import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:paisa/features/account/domain/entities/account_entity.dart';
import 'package:paisa/features/account/domain/use_case/account_use_case.dart';
import 'package:paisa/features/transaction/domain/entities/transaction_entity.dart';
import 'package:paisa/features/transaction/domain/use_case/transaction_use_case.dart';

part 'accounts_cubit.freezed.dart';

@injectable
class AccountsCubit extends Cubit<AccountsState> {
  AccountsCubit(this.getTransactionsByAccountIdUseCase, this.getAccountUseCase)
      : super(const AccountsState.loaded());

  final GetAccountUseCase getAccountUseCase;
  final GetTransactionsByAccountIdUseCase getTransactionsByAccountIdUseCase;

  void fetchTransactionsByAccountId(int accountId) async {
    emit(state.copyWith(isLoading: true));
    final AccountEntity? accountEntity =
        getAccountUseCase(GetAccountParams(accountId));
    final List<TransactionEntity> transactions =
        getTransactionsByAccountIdUseCase(
            ParamsGetTransactionsByAccountId(accountId));

    emit(state.copyWith(
      isLoading: false,
      transactions: transactions,
      accountEntity: accountEntity,
    ));
  }
}

@freezed
class AccountsState with _$AccountsState {
  const factory AccountsState.loaded({
    @Default(false) bool isLoading,
    @Default([]) List<TransactionEntity> transactions,
    AccountEntity? accountEntity,
  }) = _Initial;
}
