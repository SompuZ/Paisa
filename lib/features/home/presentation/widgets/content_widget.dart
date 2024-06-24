// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paisa/features/account/presentation/cubit/accounts_cubit.dart';
import 'package:paisa/features/overview/presentation/overview_page.dart';

// Project imports:
import 'package:paisa/features/account/presentation/pages/accounts_page.dart';
import 'package:paisa/features/category/presentation/pages/category_list_page.dart';
import 'package:paisa/features/debit/presentation/pages/debts_page.dart';
import 'package:paisa/features/home/presentation/pages/budget/budget_page.dart';
import 'package:paisa/features/home/presentation/pages/home/home_cubit.dart';
import 'package:paisa/features/home/presentation/pages/summary/summary_page.dart';
import 'package:paisa/features/recurring/presentation/page/recurring_page.dart';
import 'package:paisa/main.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Map<int, Widget> pages = {
      0: const SummaryPage(),
      1: BlocProvider(
        create: (context) => getIt<AccountsCubit>(),
        child: const AccountsPage(),
      ),
      2: const DebtsPage(),
      3: const OverViewPage(),
      4: const CategoryListPage(),
      5: const BudgetPage(),
      6: const RecurringPage(),
    };
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return pages[state.index] ?? const SizedBox.shrink();
      },
    );
  }
}
