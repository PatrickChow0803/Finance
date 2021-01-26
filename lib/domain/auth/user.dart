import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class UniqueUser with _$UniqueUser {
  const factory UniqueUser({
    @required String id,
    String profilePic,
    @required String displayName,
    @required String email,
  }) = _UniqueUser;
}
