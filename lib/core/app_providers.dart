import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:paisa/features/account/presentation/bloc/accounts_bloc.dart';
import 'package:paisa/features/home/presentation/controller/summary_controller.dart';
import 'package:paisa/features/home/presentation/pages/home/home_cubit.dart';
import 'package:paisa/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:paisa/main.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

@lazySingleton
class AppProviders {
  List<SingleChildWidget> get providers => [
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
      ];
}
