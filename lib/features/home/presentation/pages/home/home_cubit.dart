// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:paisa/core/common_enum.dart';
import 'package:paisa/features/account/domain/entities/account_entity.dart';
import 'package:paisa/features/account/domain/use_case/account_use_case.dart';
import 'package:paisa/features/category/domain/entities/category.dart';
import 'package:paisa/features/category/domain/use_case/category_use_case.dart';
import 'package:paisa/features/transaction/domain/entities/transaction_entity.dart';
import 'package:paisa/features/transaction/domain/use_case/transaction_use_case.dart';

part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this.expensesUseCase,
    this.defaultCategoriesUseCase,
    this.getAccountUseCase,
    this.getCategoryUseCase,
    this.getExpensesFromCategoryIdUseCase,
    this._getTransactionsByAccountIdUseCase,
  ) : super(const HomeState.currentIndex(0));

  final GetDefaultCategoriesUseCase defaultCategoriesUseCase;
  final GetTransactionsUseCase expensesUseCase;
  final GetAccountUseCase getAccountUseCase;
  final GetCategoryUseCase getCategoryUseCase;
  final GetTransactionsByCategoryIdUseCase getExpensesFromCategoryIdUseCase;

  final GetTransactionsByAccountIdUseCase _getTransactionsByAccountIdUseCase;

  PageType getPageFromIndex() {
    switch (state.index) {
      case 1:
        return PageType.accounts;
      case 2:
        return PageType.debts;
      case 3:
        return PageType.overview;
      case 4:
        return PageType.category;
      case 5:
        return PageType.budget;
      case 6:
        return PageType.recurring;
      case 0:
      default:
        return PageType.home;
    }
  }

  void setCurrentIndex(int index) {
    if (state.index != index) {
      emit(CurrentIndexState(index));
    }
  }

  CategoryEntity? fetchCategoryFromId(int categoryId) =>
      getCategoryUseCase(GetCategoryParams(categoryId));

  AccountEntity? fetchAccountFromId(int? accountId) =>
      getAccountUseCase(GetAccountParams(accountId));

  List<TransactionEntity> fetchExpensesFromCategoryId(int categoryId) =>
      getExpensesFromCategoryIdUseCase(
          ParamsGetTransactionsByCategoryId(categoryId));

  List<TransactionEntity> fetchTransactionsFromAccountId(int accountId) =>
      _getTransactionsByAccountIdUseCase(
          ParamsGetTransactionsByAccountId(accountId));
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState.currentIndex(int index) = CurrentIndexState;
}
