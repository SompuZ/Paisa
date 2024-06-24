// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:paisa/config/routes.dart';
import 'package:paisa/core/common.dart';
import 'package:paisa/core/widgets/lava/lava_clock.dart';
import 'package:paisa/core/widgets/paisa_widget.dart';
import 'package:paisa/features/account/domain/entities/account_entity.dart';
import 'package:paisa/features/account/presentation/bloc/accounts_bloc.dart';
import 'package:paisa/features/account/presentation/cubit/accounts_cubit.dart';
import 'package:paisa/features/account/presentation/widgets/account_card.dart';

class AccountPageViewWidget extends StatefulWidget {
  const AccountPageViewWidget({
    super.key,
    required this.accounts,
  });

  final List<AccountEntity> accounts;

  @override
  State<AccountPageViewWidget> createState() => _AccountPageViewWidgetState();
}

class _AccountPageViewWidgetState extends State<AccountPageViewWidget>
    with AutomaticKeepAliveClientMixin {
  final PageController _controller = PageController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    if (widget.accounts.isNotEmpty) {
      context.read<AccountsCubit>().fetchTransactionsByAccountId(
            widget.accounts.first.superId!,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LavaAnimation(
          child: SizedBox(
            height: 256.h,
            child: PageView.builder(
              key: const Key('accounts_page_view'),
              controller: _controller,
              itemCount: widget.accounts.length,
              onPageChanged: (index) {
                context.read<AccountsCubit>().fetchTransactionsByAccountId(
                    widget.accounts[index].superId!);
              },
              itemBuilder: (_, index) {
                return BlocBuilder<AccountsCubit, AccountsState>(
                  builder: (context, state) {
                    final AccountEntity account = widget.accounts[index];
                    final String expense = state.transactions.totalExpense
                        .toFormateCurrency(context);
                    final String income = state.transactions.totalIncome
                        .toFormateCurrency(context);
                    final String totalBalance =
                        (state.transactions.fullTotal + account.initialAmount)
                            .toFormateCurrency(context);
                    return AccountCard(
                      key: ValueKey(account.hashCode),
                      expense: expense,
                      income: income,
                      totalBalance: totalBalance,
                      cardHolder: account.name,
                      bankName: account.bankName,
                      cardType: account.cardType,
                      onDelete: () {
                        paisaAlertDialog(
                          context,
                          title: Text(
                            context.loc.dialogDeleteTitle,
                          ),
                          child: RichText(
                            text: TextSpan(
                              text: context.loc.deleteAccount,
                              style: context.bodyMedium,
                              children: [
                                TextSpan(
                                  text: account.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          confirmationButton: TextButton(
                            onPressed: () {
                              context
                                  .read<AccountBloc>()
                                  .add(DeleteAccountEvent(account.superId!));
                              Navigator.pop(context);
                            },
                            child: Text(context.loc.delete),
                          ),
                        );
                      },
                      onTap: () {
                        AccountPageData(
                          accountId: account.superId,
                        ).push(context);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
        AccountPageViewDotsIndicator(
          pageController: _controller,
          accounts: widget.accounts,
        ),
      ],
    );
  }
}

class AccountPageViewDotsIndicator extends StatelessWidget {
  const AccountPageViewDotsIndicator({
    super.key,
    required this.pageController,
    required this.accounts,
  });

  final List<AccountEntity> accounts;
  final PageController pageController;

  Widget _indicator(BuildContext context, bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isActive ? context.primary : Theme.of(context).disabledColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (accounts.length == 1) {
      return const SizedBox.shrink();
    }
    return BlocBuilder<AccountsCubit, AccountsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(accounts.length, (index) {
              return GestureDetector(
                onTap: () {
                  pageController.jumpToPage(index);
                },
                child: _indicator(
                  context,
                  accounts[index] == state.accountEntity,
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
