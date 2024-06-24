// Package imports:
import 'package:hive_flutter/adapters.dart';

part 'debt_type.g.dart';

@HiveType(typeId: 15)
enum DebitType {
  @HiveField(1)
  debit,
  @HiveField(2)
  credit;
}
