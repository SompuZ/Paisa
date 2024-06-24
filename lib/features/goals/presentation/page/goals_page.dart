// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hive_flutter/adapters.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/extensions/goal_extension.dart';
import 'package:paisa/core/widgets/paisa_widget.dart';
import 'package:paisa/features/category/domain/entities/category.dart';
import 'package:paisa/features/goals/data/models/goal_model.dart';
import 'package:paisa/features/goals/domain/entity/goal_entity.dart';
import 'package:paisa/features/transaction/domain/entities/transaction_entity.dart';
import 'package:paisa/main.dart';

class GoalsPage extends StatelessWidget {
  const GoalsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaisaAnnotatedRegionWidget(
      color: context.background,
      child: ValueListenableBuilder<Box<GoalModel>>(
        valueListenable: getIt<Box<GoalModel>>().listenable(),
        builder: (_, value, child) {
          final Iterable<GoalEntity> goals = value.values.toEntities();
          if (goals.isEmpty) {
            return EmptyWidget(
              icon: MdiIcons.timetable,
              title: context.loc.emptyBudgetMessageTitle,
              description: context.loc.emptyBudgetMessageSubTitle,
            );
          }
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: goals.length,
            itemBuilder: (context, index) {
              return const SizedBox.shrink();
              /* final GoalEntity goalEntity = goales[index];
              final List<TransactionEntity> expenses = context
                  .read<HomeCubit>()
                  .fetchExpensesFromCategoryId(goalEntity.superId!)
                  .thisMonthExpensesList;
              return BudgetItem(category: goalEntity, expenses: expenses); */
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          );
        },
      ),
    );
  }
}

class BudgetItem extends StatelessWidget {
  const BudgetItem({
    super.key,
    required this.category,
    required this.expenses,
  });

  final CategoryEntity category;
  final List<TransactionEntity> expenses;

  @override
  Widget build(BuildContext context) {
    final double totalExpenses = expenses.totalExpense;
    final double totalBudget =
        (category.finalBudget == 0.0 ? 1 : category.finalBudget);
    double difference = category.finalBudget - totalExpenses;

    return ListTile(
      isThreeLine: true,
      leading: CircleAvatar(
        backgroundColor: category.backgroundColor,
        child: Icon(
          IconData(
            category.icon,
            fontFamily: fontFamilyName,
            fontPackage: fontFamilyPackageName,
          ),
          color: category.foregroundColor,
        ),
      ),
      title: Text(category.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Limit: ',
                    style: context.bodyMedium?.copyWith(
                      color: context.bodySmall?.color,
                    ),
                    children: [
                      TextSpan(
                        text:
                            ' ${category.finalBudget.toFormateCurrency(context)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Spent: ',
                    style: context.bodyMedium?.copyWith(
                      color: context.bodySmall?.color,
                    ),
                    children: [
                      TextSpan(
                        text: ' ${totalExpenses.toFormateCurrency(context)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Remaining: ',
                    style: context.bodyMedium?.copyWith(
                      color: context.bodySmall?.color,
                    ),
                    children: [
                      TextSpan(
                        text:
                            ' ${(difference < 0 ? 0.0 : difference).toFormateCurrency(context)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: totalExpenses / totalBudget,
              color: category.foregroundColor,
              backgroundColor: category.backgroundColor,
            ),
          )
        ],
      ),
    );
  }
}
