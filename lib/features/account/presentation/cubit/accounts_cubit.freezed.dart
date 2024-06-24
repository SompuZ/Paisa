// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accounts_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<TransactionEntity> get transactions =>
      throw _privateConstructorUsedError;
  AccountEntity? get accountEntity => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading,
            List<TransactionEntity> transactions, AccountEntity? accountEntity)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, List<TransactionEntity> transactions,
            AccountEntity? accountEntity)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, List<TransactionEntity> transactions,
            AccountEntity? accountEntity)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountsStateCopyWith<AccountsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsStateCopyWith<$Res> {
  factory $AccountsStateCopyWith(
          AccountsState value, $Res Function(AccountsState) then) =
      _$AccountsStateCopyWithImpl<$Res, AccountsState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<TransactionEntity> transactions,
      AccountEntity? accountEntity});

  $AccountEntityCopyWith<$Res>? get accountEntity;
}

/// @nodoc
class _$AccountsStateCopyWithImpl<$Res, $Val extends AccountsState>
    implements $AccountsStateCopyWith<$Res> {
  _$AccountsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? transactions = null,
    Object? accountEntity = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionEntity>,
      accountEntity: freezed == accountEntity
          ? _value.accountEntity
          : accountEntity // ignore: cast_nullable_to_non_nullable
              as AccountEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountEntityCopyWith<$Res>? get accountEntity {
    if (_value.accountEntity == null) {
      return null;
    }

    return $AccountEntityCopyWith<$Res>(_value.accountEntity!, (value) {
      return _then(_value.copyWith(accountEntity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $AccountsStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<TransactionEntity> transactions,
      AccountEntity? accountEntity});

  @override
  $AccountEntityCopyWith<$Res>? get accountEntity;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AccountsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? transactions = null,
    Object? accountEntity = freezed,
  }) {
    return _then(_$InitialImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionEntity>,
      accountEntity: freezed == accountEntity
          ? _value.accountEntity
          : accountEntity // ignore: cast_nullable_to_non_nullable
              as AccountEntity?,
    ));
  }
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl(
      {this.isLoading = false,
      final List<TransactionEntity> transactions = const [],
      this.accountEntity})
      : _transactions = transactions;

  @override
  @JsonKey()
  final bool isLoading;
  final List<TransactionEntity> _transactions;
  @override
  @JsonKey()
  List<TransactionEntity> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  final AccountEntity? accountEntity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountsState.loaded(isLoading: $isLoading, transactions: $transactions, accountEntity: $accountEntity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountsState.loaded'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('transactions', transactions))
      ..add(DiagnosticsProperty('accountEntity', accountEntity));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.accountEntity, accountEntity) ||
                other.accountEntity == accountEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_transactions), accountEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading,
            List<TransactionEntity> transactions, AccountEntity? accountEntity)
        loaded,
  }) {
    return loaded(isLoading, transactions, accountEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, List<TransactionEntity> transactions,
            AccountEntity? accountEntity)?
        loaded,
  }) {
    return loaded?.call(isLoading, transactions, accountEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, List<TransactionEntity> transactions,
            AccountEntity? accountEntity)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(isLoading, transactions, accountEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AccountsState {
  const factory _Initial(
      {final bool isLoading,
      final List<TransactionEntity> transactions,
      final AccountEntity? accountEntity}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  List<TransactionEntity> get transactions;
  @override
  AccountEntity? get accountEntity;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
