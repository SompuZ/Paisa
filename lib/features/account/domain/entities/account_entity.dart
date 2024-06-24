// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:paisa/core/common_enum.dart';
part 'account_entity.freezed.dart';

@freezed
class AccountEntity with _$AccountEntity {
  const factory AccountEntity({
    required String bankName,
    required String name,
    @Default(0.0) double amount,
    @Default(CardType.bank) CardType cardType,
    @Default(0xFFFFFFFF) int color,
    int? superId,
    @Default(false) bool isAccountExcluded,
  }) = _AccountEntity;
}
