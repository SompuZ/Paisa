// Flutter imports:
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paisa/core/common.dart';
import 'package:paisa/core/enum/filter_expense.dart';
import 'package:paisa/core/widgets/paisa_widgets/paisa_divider.dart';
import 'package:paisa/core/widgets/section_list_view/sectioned_list_view.dart';

// Project imports:
import 'package:paisa/features/account/domain/entities/account_entity.dart';
import 'package:paisa/features/account/presentation/cubit/accounts_cubit.dart';
import 'package:paisa/features/account/presentation/widgets/account_summary_widget.dart';
import 'package:paisa/features/account/presentation/widgets/accounts_page_view_widget.dart';
import 'package:paisa/features/category/domain/entities/category.dart';
import 'package:paisa/features/home/presentation/controller/summary_controller.dart';
import 'package:paisa/features/home/presentation/pages/home/home_cubit.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/transaction_item_widget.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/transactions_header_widget.dart';
import 'package:provider/provider.dart';

class AccountsHorizontalTabletPage extends StatelessWidget {
  const AccountsHorizontalTabletPage({
    super.key,
    required this.accounts,
  });

  final List<AccountEntity> accounts;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AccountPageViewWidget(accounts: accounts),
              BlocBuilder<AccountsCubit, AccountsState>(
                builder: (context, state) {
                  return AccountSummaryWidget(expenses: state.transactions);
                },
              )
            ],
          ),
        ),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    TransactionsHeaderWidget(
                      summaryController:
                          Provider.of<SummaryController>(context),
                    ),
                  ],
                ),
              ),
              BlocBuilder<AccountsCubit, AccountsState>(
                builder: (context, state) {
                  return ValueListenableBuilder<FilterExpense>(
                    valueListenable: Provider.of<SummaryController>(context)
                        .sortHomeExpenseNotifier,
                    builder: (context, value, child) {
                      groupBy(state.transactions,
                          (element) => element.time.formatted(value));
                      return SliverGroupedListView(
                        elements: state.transactions,
                        groupBy: (element) => element.time.formatted(value),
                        separator: const PaisaDivider(),
                        sort: false,
                        groupSeparatorBuilder: (value) {
                          return ListTile(
                            title: Text(
                              value,
                              style: context.titleSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: context.onBackground,
                              ),
                            ),
                          );
                        },
                        itemBuilder: (context, transaction) {
                          final AccountEntity? account = context
                              .read<HomeCubit>()
                              .fetchAccountFromId(transaction.accountId);
                          final CategoryEntity? category = context
                              .read<HomeCubit>()
                              .fetchCategoryFromId(transaction.categoryId);
                          if (account == null || category == null) {
                            return const SizedBox.shrink();
                          }
                          return TransactionItemWidget(
                            expense: transaction,
                            account: account,
                            category: category,
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
