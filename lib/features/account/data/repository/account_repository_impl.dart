// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/common_enum.dart';
import 'package:paisa/features/account/data/data_sources/account_data_source.dart';
import 'package:paisa/features/account/data/model/account_model.dart';
import 'package:paisa/features/account/domain/entities/account_entity.dart';
import 'package:paisa/features/account/domain/repository/account_repository.dart';

@LazySingleton(as: AccountRepository)
class AccountRepositoryImpl extends AccountRepository {
  AccountRepositoryImpl({required this.dataSource});

  final AccountDataSource dataSource;

  @override
  Future<int> add({
    required String bankName,
    required String holderName,
    required CardType cardType,
    double amount = 0,
    int color = 0xFFFFC107,
    bool isAccountExcluded = false,
  }) {
    return dataSource.add(AccountModel(
      name: holderName,
      bankName: bankName,
      cardType: cardType,
      amount: amount,
      color: color,
      isAccountExcluded: isAccountExcluded,
    ));
  }

  @override
  List<AccountEntity> all() {
    return dataSource.accounts().toEntities();
  }

  @override
  Future<void> clearAll() {
    return dataSource.clear();
  }

  @override
  Future<void> delete(int key) {
    return dataSource.delete(key);
  }

  @override
  AccountEntity? fetchById(int? accountId) {
    return dataSource.findById(accountId)?.toEntity();
  }

  @override
  Future<void> update({
    required int key,
    required String bankName,
    required String holderName,
    required CardType cardType,
    double amount = 0,
    int color = 0xFFFFC107,
    bool isAccountExcluded = false,
  }) {
    return dataSource.update(
      AccountModel(
        name: holderName,
        bankName: bankName,
        cardType: cardType,
        amount: amount,
        color: color,
        isAccountExcluded: isAccountExcluded,
        superId: key,
      ),
    );
  }
}
