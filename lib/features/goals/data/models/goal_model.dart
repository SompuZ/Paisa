import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paisa/core/data/super_id.dart';

part 'goal_model.freezed.dart';
part 'goal_model.g.dart';

@unfreezed
class GoalModel extends HiveObject with _$GoalModel implements SuperId {
  @HiveType(typeId: 8, adapterName: 'GoalModelAdapter')
  factory GoalModel({
    @HiveField(0) required String name,
    @HiveField(1) required double amount,
    @HiveField(2) int? superId,
    @HiveField(3) required int icon,
  }) = _Goals;

  GoalModel._();

  factory GoalModel.fromJson(Map<String, dynamic> json) =>
      _$GoalModelFromJson(json);
}
