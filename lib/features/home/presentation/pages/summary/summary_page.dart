// Flutter imports:
import 'dart:math';

import 'package:flutter/material.dart';

// Package imports:
import 'package:hive_flutter/adapters.dart';
import 'package:home_widget/home_widget.dart';
import 'package:paisa/features/transaction/domain/entities/transaction_entity.dart';
import 'package:responsive_builder/responsive_builder.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/summary_desktop_widget.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/summary_mobile_widget.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/summary_tablet_widget.dart';
import 'package:paisa/features/transaction/data/model/transaction_model.dart';
import 'package:paisa/main.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<TransactionModel>>(
      valueListenable: getIt<Box<TransactionModel>>().listenable(),
      builder: (_, value, child) {
        final List<TransactionEntity> transactions =
            value.values.toExcludeAccounts();
        _updateHomeScreenWidget(
          context,
          totalExpenses: transactions.totalExpense.toFormateCurrency(context),
          totalIncome: transactions.totalIncome.toFormateCurrency(context),
          total: transactions.total.toFormateCurrency(context),
        );
        return ScreenTypeLayout.builder(
          mobile: (p0) => SummaryMobileWidget(expenses: transactions),
          tablet: (p0) => SummaryTabletWidget(expenses: transactions),
          desktop: (p0) => SummaryDesktopWidget(expenses: transactions),
        );
      },
    );
  }
}

Future<void> _updateHomeScreenWidget(
  BuildContext context, {
  required String totalExpenses,
  required String totalIncome,
  required String total,
}) async {
  final primaryContainer = Theme.of(context).colorScheme.primaryContainer.value;
  final bgColor = Color(primaryContainer).value;
  final onPrimaryContainer =
      Theme.of(context).colorScheme.onPrimaryContainer.value;
  final textColor = Color(onPrimaryContainer).value;
  await HomeWidget.saveWidgetData('expense', totalExpenses);
  await HomeWidget.saveWidgetData('income', totalIncome);
  await HomeWidget.saveWidgetData('total', total);
  await HomeWidget.saveWidgetData('bgColor', chopToJavaInt(bgColor));
  await HomeWidget.saveWidgetData('textColor', chopToJavaInt(textColor));
  await HomeWidget.updateWidget(
    name: 'Paisa',
    androidName: 'PaisaHomeScreenWidget',
    qualifiedAndroidName: 'dev.hemanths.paisa.PaisaHomeScreenWidget',
  );
}

int chopToJavaInt(int result) {
  while (result > pow(2, 31)) {
    result = result - pow(2, 32).toInt();
  }
  return result;
}
