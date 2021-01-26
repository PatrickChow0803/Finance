import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure {
  // User cancels the third party sign in method (By Google or Apple for example)
  const factory AuthFailure.cancelledByUser() = CancelledByUser;

  // Problem with the server that prevented the login
  const factory AuthFailure.serverError() = ServerError;

  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;

  const factory AuthFailure.invalidEmailAndPasswordCombination() =
      InvalidEmailAndPasswordCombination;
}
