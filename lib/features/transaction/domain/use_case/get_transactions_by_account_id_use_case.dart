// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:paisa/core/use_case/use_case.dart';
import 'package:paisa/features/transaction/domain/entities/transaction_entity.dart';
import 'package:paisa/features/transaction/domain/repository/transaction_repository.dart';

@lazySingleton
class GetTransactionsByAccountIdUseCase
    implements
        UseCase<List<TransactionEntity>, ParamsGetTransactionsByAccountId> {
  GetTransactionsByAccountIdUseCase({required this.expenseRepository});

  final TransactionRepository expenseRepository;

  @override
  List<TransactionEntity> call(ParamsGetTransactionsByAccountId params) =>
      expenseRepository.fetchExpensesFromAccountId(params.accountId);
}

class ParamsGetTransactionsByAccountId {
  ParamsGetTransactionsByAccountId(this.accountId);

  final int accountId;
}
