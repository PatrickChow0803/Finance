// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UniqueUserTearOff {
  const _$UniqueUserTearOff();

// ignore: unused_element
  _UniqueUser call(
      {@required String id,
      String profilePic,
      @required String firstName,
      @required String lastName}) {
    return _UniqueUser(
      id: id,
      profilePic: profilePic,
      firstName: firstName,
      lastName: lastName,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $UniqueUser = _$UniqueUserTearOff();

/// @nodoc
mixin _$UniqueUser {
  String get id;
  String get profilePic;
  String get firstName;
  String get lastName;

  @JsonKey(ignore: true)
  $UniqueUserCopyWith<UniqueUser> get copyWith;
}

/// @nodoc
abstract class $UniqueUserCopyWith<$Res> {
  factory $UniqueUserCopyWith(
          UniqueUser value, $Res Function(UniqueUser) then) =
      _$UniqueUserCopyWithImpl<$Res>;
  $Res call({String id, String profilePic, String firstName, String lastName});
}

/// @nodoc
class _$UniqueUserCopyWithImpl<$Res> implements $UniqueUserCopyWith<$Res> {
  _$UniqueUserCopyWithImpl(this._value, this._then);

  final UniqueUser _value;
  // ignore: unused_field
  final $Res Function(UniqueUser) _then;

  @override
  $Res call({
    Object id = freezed,
    Object profilePic = freezed,
    Object firstName = freezed,
    Object lastName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      profilePic:
          profilePic == freezed ? _value.profilePic : profilePic as String,
      firstName: firstName == freezed ? _value.firstName : firstName as String,
      lastName: lastName == freezed ? _value.lastName : lastName as String,
    ));
  }
}

/// @nodoc
abstract class _$UniqueUserCopyWith<$Res> implements $UniqueUserCopyWith<$Res> {
  factory _$UniqueUserCopyWith(
          _UniqueUser value, $Res Function(_UniqueUser) then) =
      __$UniqueUserCopyWithImpl<$Res>;
  @override
  $Res call({String id, String profilePic, String firstName, String lastName});
}

/// @nodoc
class __$UniqueUserCopyWithImpl<$Res> extends _$UniqueUserCopyWithImpl<$Res>
    implements _$UniqueUserCopyWith<$Res> {
  __$UniqueUserCopyWithImpl(
      _UniqueUser _value, $Res Function(_UniqueUser) _then)
      : super(_value, (v) => _then(v as _UniqueUser));

  @override
  _UniqueUser get _value => super._value as _UniqueUser;

  @override
  $Res call({
    Object id = freezed,
    Object profilePic = freezed,
    Object firstName = freezed,
    Object lastName = freezed,
  }) {
    return _then(_UniqueUser(
      id: id == freezed ? _value.id : id as String,
      profilePic:
          profilePic == freezed ? _value.profilePic : profilePic as String,
      firstName: firstName == freezed ? _value.firstName : firstName as String,
      lastName: lastName == freezed ? _value.lastName : lastName as String,
    ));
  }
}

/// @nodoc
class _$_UniqueUser implements _UniqueUser {
  const _$_UniqueUser(
      {@required this.id,
      this.profilePic,
      @required this.firstName,
      @required this.lastName})
      : assert(id != null),
        assert(firstName != null),
        assert(lastName != null);

  @override
  final String id;
  @override
  final String profilePic;
  @override
  final String firstName;
  @override
  final String lastName;

  @override
  String toString() {
    return 'UniqueUser(id: $id, profilePic: $profilePic, firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UniqueUser &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.profilePic, profilePic) ||
                const DeepCollectionEquality()
                    .equals(other.profilePic, profilePic)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(profilePic) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName);

  @JsonKey(ignore: true)
  @override
  _$UniqueUserCopyWith<_UniqueUser> get copyWith =>
      __$UniqueUserCopyWithImpl<_UniqueUser>(this, _$identity);
}

abstract class _UniqueUser implements UniqueUser {
  const factory _UniqueUser(
      {@required String id,
      String profilePic,
      @required String firstName,
      @required String lastName}) = _$_UniqueUser;

  @override
  String get id;
  @override
  String get profilePic;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  @JsonKey(ignore: true)
  _$UniqueUserCopyWith<_UniqueUser> get copyWith;
}
