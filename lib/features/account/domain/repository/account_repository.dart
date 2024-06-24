// Project imports:
import 'package:paisa/core/common_enum.dart';
import 'package:paisa/features/account/domain/entities/account_entity.dart';

abstract class AccountRepository {
  Future<int> add({
    required String bankName,
    required String holderName,
    required CardType cardType,
    double amount = 0,
    int color = 0xFFFFC107,
    bool isAccountExcluded = false,
  });

  Future<void> update({
    required int key,
    required String bankName,
    required String holderName,
    required CardType cardType,
    double amount = 0,
    int color = 0xFFFFC107,
    bool isAccountExcluded = false,
  });

  Future<void> delete(int key);

  AccountEntity? fetchById(int? accountId);

  List<AccountEntity> all();

  Future<void> clearAll();
}
