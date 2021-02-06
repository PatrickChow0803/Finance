// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'receipt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ReceiptTearOff {
  const _$ReceiptTearOff();

// ignore: unused_element
  _Receipt call(
      {@required String id,
      @required Category category,
      @required double price,
      @required DateTime date}) {
    return _Receipt(
      id: id,
      category: category,
      price: price,
      date: date,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Receipt = _$ReceiptTearOff();

/// @nodoc
mixin _$Receipt {
  String get id;
  Category get category;
  double get price;
  DateTime get date;

  @JsonKey(ignore: true)
  $ReceiptCopyWith<Receipt> get copyWith;
}

/// @nodoc
abstract class $ReceiptCopyWith<$Res> {
  factory $ReceiptCopyWith(Receipt value, $Res Function(Receipt) then) =
      _$ReceiptCopyWithImpl<$Res>;
  $Res call({String id, Category category, double price, DateTime date});
}

/// @nodoc
class _$ReceiptCopyWithImpl<$Res> implements $ReceiptCopyWith<$Res> {
  _$ReceiptCopyWithImpl(this._value, this._then);

  final Receipt _value;
  // ignore: unused_field
  final $Res Function(Receipt) _then;

  @override
  $Res call({
    Object id = freezed,
    Object category = freezed,
    Object price = freezed,
    Object date = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      category: category == freezed ? _value.category : category as Category,
      price: price == freezed ? _value.price : price as double,
      date: date == freezed ? _value.date : date as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$ReceiptCopyWith<$Res> implements $ReceiptCopyWith<$Res> {
  factory _$ReceiptCopyWith(_Receipt value, $Res Function(_Receipt) then) =
      __$ReceiptCopyWithImpl<$Res>;
  @override
  $Res call({String id, Category category, double price, DateTime date});
}

/// @nodoc
class __$ReceiptCopyWithImpl<$Res> extends _$ReceiptCopyWithImpl<$Res>
    implements _$ReceiptCopyWith<$Res> {
  __$ReceiptCopyWithImpl(_Receipt _value, $Res Function(_Receipt) _then)
      : super(_value, (v) => _then(v as _Receipt));

  @override
  _Receipt get _value => super._value as _Receipt;

  @override
  $Res call({
    Object id = freezed,
    Object category = freezed,
    Object price = freezed,
    Object date = freezed,
  }) {
    return _then(_Receipt(
      id: id == freezed ? _value.id : id as String,
      category: category == freezed ? _value.category : category as Category,
      price: price == freezed ? _value.price : price as double,
      date: date == freezed ? _value.date : date as DateTime,
    ));
  }
}

/// @nodoc
class _$_Receipt extends _Receipt {
  const _$_Receipt(
      {@required this.id,
      @required this.category,
      @required this.price,
      @required this.date})
      : assert(id != null),
        assert(category != null),
        assert(price != null),
        assert(date != null),
        super._();

  @override
  final String id;
  @override
  final Category category;
  @override
  final double price;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'Receipt(id: $id, category: $category, price: $price, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Receipt &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(date);

  @JsonKey(ignore: true)
  @override
  _$ReceiptCopyWith<_Receipt> get copyWith =>
      __$ReceiptCopyWithImpl<_Receipt>(this, _$identity);
}

abstract class _Receipt extends Receipt {
  const _Receipt._() : super._();
  const factory _Receipt(
      {@required String id,
      @required Category category,
      @required double price,
      @required DateTime date}) = _$_Receipt;

  @override
  String get id;
  @override
  Category get category;
  @override
  double get price;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$ReceiptCopyWith<_Receipt> get copyWith;
}
