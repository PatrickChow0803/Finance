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
      @required String displayName,
      @required String email}) {
    return _UniqueUser(
      id: id,
      profilePic: profilePic,
      displayName: displayName,
      email: email,
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
  String get displayName;
  String get email;

  @JsonKey(ignore: true)
  $UniqueUserCopyWith<UniqueUser> get copyWith;
}

/// @nodoc
abstract class $UniqueUserCopyWith<$Res> {
  factory $UniqueUserCopyWith(
          UniqueUser value, $Res Function(UniqueUser) then) =
      _$UniqueUserCopyWithImpl<$Res>;
  $Res call({String id, String profilePic, String displayName, String email});
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
    Object displayName = freezed,
    Object email = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      profilePic:
          profilePic == freezed ? _value.profilePic : profilePic as String,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String,
      email: email == freezed ? _value.email : email as String,
    ));
  }
}

/// @nodoc
abstract class _$UniqueUserCopyWith<$Res> implements $UniqueUserCopyWith<$Res> {
  factory _$UniqueUserCopyWith(
          _UniqueUser value, $Res Function(_UniqueUser) then) =
      __$UniqueUserCopyWithImpl<$Res>;
  @override
  $Res call({String id, String profilePic, String displayName, String email});
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
    Object displayName = freezed,
    Object email = freezed,
  }) {
    return _then(_UniqueUser(
      id: id == freezed ? _value.id : id as String,
      profilePic:
          profilePic == freezed ? _value.profilePic : profilePic as String,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String,
      email: email == freezed ? _value.email : email as String,
    ));
  }
}

/// @nodoc
class _$_UniqueUser implements _UniqueUser {
  const _$_UniqueUser(
      {@required this.id,
      this.profilePic,
      @required this.displayName,
      @required this.email})
      : assert(id != null),
        assert(displayName != null),
        assert(email != null);

  @override
  final String id;
  @override
  final String profilePic;
  @override
  final String displayName;
  @override
  final String email;

  @override
  String toString() {
    return 'UniqueUser(id: $id, profilePic: $profilePic, displayName: $displayName, email: $email)';
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
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(profilePic) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(email);

  @JsonKey(ignore: true)
  @override
  _$UniqueUserCopyWith<_UniqueUser> get copyWith =>
      __$UniqueUserCopyWithImpl<_UniqueUser>(this, _$identity);
}

abstract class _UniqueUser implements UniqueUser {
  const factory _UniqueUser(
      {@required String id,
      String profilePic,
      @required String displayName,
      @required String email}) = _$_UniqueUser;

  @override
  String get id;
  @override
  String get profilePic;
  @override
  String get displayName;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$UniqueUserCopyWith<_UniqueUser> get copyWith;
}
