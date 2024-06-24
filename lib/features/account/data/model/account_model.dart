// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';

// Project imports:
import 'package:paisa/core/common_enum.dart';
import 'package:paisa/core/data/super_id.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@unfreezed
class AccountModel extends HiveObject with _$AccountModel implements SuperId {
  @HiveType(typeId: 2, adapterName: 'AccountModelAdapter')
  factory AccountModel({
    @HiveField(0) required String name,
    @HiveField(3) required String bankName,
    @HiveField(6, defaultValue: CardType.bank)
    @Default(CardType.bank)
    CardType cardType,
    @HiveField(7) int? superId,
    @HiveField(8, defaultValue: 0) @Default(0.0) double amount,
    @HiveField(9, defaultValue: 0xFFFFC107) @Default(0xFFFFC107) int color,
    @HiveField(21, defaultValue: false) @Default(false) bool isAccountExcluded,
  }) = _AccountModel;

  AccountModel._();

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);
}
