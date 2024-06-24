// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';

part 'country_model.freezed.dart';
part 'country_model.g.dart';

@freezed
class CountryModel extends HiveObject with _$CountryModel {
  @HiveType(typeId: 7, adapterName: 'CountryModelAdapter')
  factory CountryModel({
    @HiveField(0) required String code,
    @HiveField(1)
    @JsonKey(name: 'decimal_digits')
    @Default(2)
    int decimalDigits,
    @HiveField(2)
    @JsonKey(name: 'decimal_separator')
    @Default(',')
    String decimalSeparator,
    @HiveField(3) required String name,
    @HiveField(4) @JsonKey(name: 'name_plural') @Default('') String namePlural,
    @HiveField(5) required int number,
    @HiveField(6) required String pattern,
    @HiveField(7)
    @JsonKey(name: 'space_between_amount_and_symbol')
    @HiveField(8)
    @Default(false)
    bool spaceBetweenAmountAndSymbol,
    @HiveField(9) @Default('\$') String symbol,
    @HiveField(10)
    @JsonKey(name: 'symbol_on_left')
    @Default(false)
    bool symbolOnLeft,
    @HiveField(11)
    @JsonKey(name: 'thousands_separator')
    required String thousandsSeparator,
  }) = _CountryModel;

  CountryModel._();

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);
}
