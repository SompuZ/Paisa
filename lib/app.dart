// Flutter imports:
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:paisa/config/routes.dart';
import 'package:paisa/core/common.dart';
import 'package:paisa/core/theme/app_theme.dart';
import 'package:paisa/features/account/presentation/bloc/accounts_bloc.dart';
import 'package:paisa/features/home/presentation/controller/summary_controller.dart';
import 'package:paisa/features/home/presentation/pages/home/home_cubit.dart';
import 'package:paisa/features/intro/data/models/country_model.dart';
import 'package:paisa/features/intro/domain/entities/country_entity.dart';
import 'package:paisa/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:paisa/main.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

import 'core/enum/card_type.dart';
import 'core/enum/transaction_type.dart';
import 'features/account/data/data_sources/account_data_source.dart';
import 'features/account/data/model/account_model.dart';
import 'features/category/data/data_sources/category_data_source.dart';
import 'features/category/data/model/category_model.dart';
import 'features/transaction/data/data_sources/local/transaction_data_manager.dart';
import 'features/transaction/data/model/transaction_model.dart';

class PaisaApp extends StatefulWidget {
  const PaisaApp({
    super.key,
  });

  @override
  State<PaisaApp> createState() => _PaisaAppState();
}

class _PaisaAppState extends State<PaisaApp> {

  StreamSubscription<List<SharedMediaFile>>? _intentDataStreamSubscription;
  File? _image;
  String? _recognizedText;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<SettingCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<HomeCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<AccountBloc>(),
        ),
        Provider(
          create: (context) => getIt<SummaryController>(),
        ),
      ],
      child: ValueListenableBuilder<Box>(
        valueListenable: settings.listenable(
          keys: [
            appColorKey,
            dynamicThemeKey,
            themeModeKey,
            calendarFormatKey,
            userCountryKey,
            appFontChangerKey,
            appLanguageKey,
            blackThemeKey,
          ],
        ),
        builder: (context, value, _) {
          final int color = value.get(
            appColorKey,
            defaultValue: 0xFF795548,
          );
          final Color primaryColor = Color(color);
          final bool isDynamic = value.get(
            dynamicThemeKey,
            defaultValue: false,
          );
          final bool isBlack = value.get(
            blackThemeKey,
            defaultValue: false,
          );
          final ThemeMode themeMode = ThemeMode.values[value.get(
            themeModeKey,
            defaultValue: 0,
          )];
          final Locale locale = Locale(
            value.get(appLanguageKey, defaultValue: 'en'),
          );
          final String fontPreference = value.get(
            appFontChangerKey,
            defaultValue: 'Outfit',
          );

          final TextTheme darkTextTheme = GoogleFonts.getTextTheme(
            fontPreference,
            ThemeData.dark().textTheme,
          );

          final TextTheme lightTextTheme = GoogleFonts.getTextTheme(
            fontPreference,
            ThemeData.light().textTheme,
          );

          return ProxyProvider0<CountryEntity>(
            lazy: true,
            update: (BuildContext context, _) {
              final Map<String, dynamic>? jsonString =
                  (value.get(userCountryKey) as Map<dynamic, dynamic>?)
                      ?.map((key, value) => MapEntry(key.toString(), value));

              final CountryEntity model =
                  CountryModel.fromJson(jsonString ?? {}).toEntity();
              return model;
            },
            child: DynamicColorBuilder(
              builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
                ColorScheme lightColorScheme;
                ColorScheme darkColorScheme;
                if (lightDynamic != null && darkDynamic != null && isDynamic) {
                  lightColorScheme = lightDynamic.harmonized();
                  darkColorScheme = darkDynamic.harmonized();
                } else {
                  lightColorScheme = ColorScheme.fromSeed(
                    seedColor: primaryColor,
                  );
                  darkColorScheme = ColorScheme.fromSeed(
                    seedColor: primaryColor,
                    brightness: Brightness.dark,
                  );

                  if (isBlack) {
                    darkColorScheme = darkColorScheme.copyWith(
                      background: Colors.black,
                      surface: Colors.black,
                    );
                  }
                }

                return ScreenUtilInit(
                  designSize: MediaQuery.of(context).size,
                  minTextAdapt: true,
                  splitScreenMode: true,
                  child: MaterialApp.router(
                    locale: locale,
                    routerConfig: goRouter,
                    debugShowCheckedModeBanner: false,
                    themeMode: themeMode,
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                    onGenerateTitle: (BuildContext context) {
                      return context.loc.appTitle;
                    },
                    theme: appTheme(
                      context,
                      lightColorScheme,
                      fontPreference,
                      lightTextTheme,
                      ThemeData.light().dividerColor,
                      SystemUiOverlayStyle.dark,
                    ),
                    darkTheme: appTheme(
                      context,
                      darkColorScheme,
                      fontPreference,
                      darkTextTheme,
                      ThemeData.dark().dividerColor,
                      SystemUiOverlayStyle.light,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // For sharing images coming from outside the app while the app is in the memory
    _intentDataStreamSubscription = ReceiveSharingIntent.instance.getMediaStream().listen((List<SharedMediaFile> value) {
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Value"+value.toString());
      if (value.isNotEmpty) {
        setState(() {
          _image = File(value.first.path);
        });
        goRouter.go(const LandingPageData().location);
        goRouter.push(TransactionPageData(
            transactionType: TransactionType.expense).location);
        // _recognizeText(_image!);
      }
    }, onError: (err) {
      print("getMediaStream error: $err");
    });

    // For sharing images coming from outside the app while the app is closed
    ReceiveSharingIntent.instance.getInitialMedia().then((List<SharedMediaFile> value) {
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Value"+value.toString());
      if (value.isNotEmpty) {
        setState(() {
          _image = File(value.first.path);
        });
        goRouter.go(const LandingPageData().location);
        goRouter.push(TransactionPageData(
            transactionType: TransactionType.expense).location);
        // _recognizeText(_image!);
      }
    });
  }

  @override
  void dispose() {
    _intentDataStreamSubscription?.cancel();
    super.dispose();
  }

}
