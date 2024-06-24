// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/widgets/paisa_widget.dart';
import 'package:paisa/features/account/domain/entities/account_entity.dart';
import 'package:paisa/features/category/domain/entities/category.dart';
import 'package:paisa/features/home/presentation/pages/home/home_cubit.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/transaction_item_widget.dart';
import 'package:paisa/features/transaction/domain/entities/transaction_entity.dart';

class TransactionByCategoryPage extends StatelessWidget {
  const TransactionByCategoryPage({
    super.key,
    required this.categoryId,
  });

  final int categoryId;

  @override
  Widget build(BuildContext context) {
    final List<TransactionEntity> expenses =
        context.read<HomeCubit>().fetchExpensesFromCategoryId(categoryId);
    final CategoryEntity? categoryEntity =
        context.read<HomeCubit>().fetchCategoryFromId(categoryId);

    return PaisaAnnotatedRegionWidget(
      color: Colors.transparent,
      child: Scaffold(
        extendBody: true,
        appBar: context.materialYouAppBar(categoryEntity?.name ?? ''),
        bottomNavigationBar: SafeArea(
          child: PaisaFilledCard(
            child: ListTile(
              title: Text(
                context.loc.total,
                style: context.titleSmall
                    ?.copyWith(color: context.onSurfaceVariant),
              ),
              subtitle: Text(
                expenses.fullTotal.toFormateCurrency(context),
                style: context.titleMedium?.copyWith(
                  color: context.onSurfaceVariant,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: expenses.length,
          itemBuilder: (BuildContext context, int index) {
            final AccountEntity? account = context
                .read<HomeCubit>()
                .fetchAccountFromId(expenses[index].accountId);
            final CategoryEntity? category = context
                .read<HomeCubit>()
                .fetchCategoryFromId(expenses[index].categoryId);
            if (account == null || category == null) {
              return const SizedBox.shrink();
            }
            return TransactionItemWidget(
              expense: expenses[index],
              account: account,
              category: category,
            );
          },
        ),
      ),
    );
  }
}
