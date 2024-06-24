// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountEntity {
  String get bankName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  CardType get cardType => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;
  int? get superId => throw _privateConstructorUsedError;
  bool get isAccountExcluded => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountEntityCopyWith<AccountEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountEntityCopyWith<$Res> {
  factory $AccountEntityCopyWith(
          AccountEntity value, $Res Function(AccountEntity) then) =
      _$AccountEntityCopyWithImpl<$Res, AccountEntity>;
  @useResult
  $Res call(
      {String bankName,
      String name,
      double amount,
      CardType cardType,
      int color,
      int? superId,
      bool isAccountExcluded});
}

/// @nodoc
class _$AccountEntityCopyWithImpl<$Res, $Val extends AccountEntity>
    implements $AccountEntityCopyWith<$Res> {
  _$AccountEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankName = null,
    Object? name = null,
    Object? amount = null,
    Object? cardType = null,
    Object? color = null,
    Object? superId = freezed,
    Object? isAccountExcluded = null,
  }) {
    return _then(_value.copyWith(
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      cardType: null == cardType
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as CardType,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      superId: freezed == superId
          ? _value.superId
          : superId // ignore: cast_nullable_to_non_nullable
              as int?,
      isAccountExcluded: null == isAccountExcluded
          ? _value.isAccountExcluded
          : isAccountExcluded // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountEntityImplCopyWith<$Res>
    implements $AccountEntityCopyWith<$Res> {
  factory _$$AccountEntityImplCopyWith(
          _$AccountEntityImpl value, $Res Function(_$AccountEntityImpl) then) =
      __$$AccountEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String bankName,
      String name,
      double amount,
      CardType cardType,
      int color,
      int? superId,
      bool isAccountExcluded});
}

/// @nodoc
class __$$AccountEntityImplCopyWithImpl<$Res>
    extends _$AccountEntityCopyWithImpl<$Res, _$AccountEntityImpl>
    implements _$$AccountEntityImplCopyWith<$Res> {
  __$$AccountEntityImplCopyWithImpl(
      _$AccountEntityImpl _value, $Res Function(_$AccountEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankName = null,
    Object? name = null,
    Object? amount = null,
    Object? cardType = null,
    Object? color = null,
    Object? superId = freezed,
    Object? isAccountExcluded = null,
  }) {
    return _then(_$AccountEntityImpl(
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      cardType: null == cardType
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as CardType,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      superId: freezed == superId
          ? _value.superId
          : superId // ignore: cast_nullable_to_non_nullable
              as int?,
      isAccountExcluded: null == isAccountExcluded
          ? _value.isAccountExcluded
          : isAccountExcluded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AccountEntityImpl implements _AccountEntity {
  const _$AccountEntityImpl(
      {required this.bankName,
      required this.name,
      this.amount = 0.0,
      this.cardType = CardType.bank,
      this.color = 0xFFFFFFFF,
      this.superId,
      this.isAccountExcluded = false});

  @override
  final String bankName;
  @override
  final String name;
  @override
  @JsonKey()
  final double amount;
  @override
  @JsonKey()
  final CardType cardType;
  @override
  @JsonKey()
  final int color;
  @override
  final int? superId;
  @override
  @JsonKey()
  final bool isAccountExcluded;

  @override
  String toString() {
    return 'AccountEntity(bankName: $bankName, name: $name, amount: $amount, cardType: $cardType, color: $color, superId: $superId, isAccountExcluded: $isAccountExcluded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountEntityImpl &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.cardType, cardType) ||
                other.cardType == cardType) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.superId, superId) || other.superId == superId) &&
            (identical(other.isAccountExcluded, isAccountExcluded) ||
                other.isAccountExcluded == isAccountExcluded));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bankName, name, amount, cardType,
      color, superId, isAccountExcluded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountEntityImplCopyWith<_$AccountEntityImpl> get copyWith =>
      __$$AccountEntityImplCopyWithImpl<_$AccountEntityImpl>(this, _$identity);
}

abstract class _AccountEntity implements AccountEntity {
  const factory _AccountEntity(
      {required final String bankName,
      required final String name,
      final double amount,
      final CardType cardType,
      final int color,
      final int? superId,
      final bool isAccountExcluded}) = _$AccountEntityImpl;

  @override
  String get bankName;
  @override
  String get name;
  @override
  double get amount;
  @override
  CardType get cardType;
  @override
  int get color;
  @override
  int? get superId;
  @override
  bool get isAccountExcluded;
  @override
  @JsonKey(ignore: true)
  _$$AccountEntityImplCopyWith<_$AccountEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
