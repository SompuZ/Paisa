// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:paisa/features/account/domain/entities/account_entity.dart';
import 'package:paisa/features/category/domain/entities/category.dart';
import 'package:paisa/features/home/presentation/pages/home/home_cubit.dart';
import 'package:paisa/features/transaction/domain/entities/transaction_entity.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/transaction_item_widget.dart';

class TransactionsListWidget extends StatelessWidget {
  const TransactionsListWidget({
    super.key,
    required this.expenses,
  });

  final List<TransactionEntity> expenses;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverList.separated(
          separatorBuilder: (context, index) => Divider(
            indent: 72,
            height: 0,
            color: Theme.of(context).dividerColor,
          ),
          itemCount: expenses.length,
          itemBuilder: (_, index) {
            final TransactionEntity expense = expenses[index];
            final AccountEntity? account = BlocProvider.of<HomeCubit>(context)
                .fetchAccountFromId(expense.accountId);
            final CategoryEntity? category = BlocProvider.of<HomeCubit>(context)
                .fetchCategoryFromId(expense.categoryId);
            if (account == null || category == null) {
              return const SizedBox.shrink();
            } else {
              return TransactionItemWidget(
                expense: expense,
                account: account,
                category: category,
              );
            }
          },
        ),
      ],
    );
  }
}
