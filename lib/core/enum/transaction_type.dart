// Package imports:
import 'package:hive_flutter/adapters.dart';

part 'transaction_type.g.dart';

@HiveType(typeId: 11)
enum TransactionType {
  @HiveField(1)
  expense('expense'),
  @HiveField(0)
  income('income'),
  @HiveField(2)
  transfer('transfer');

  final String type;
  const TransactionType(this.type);
}
