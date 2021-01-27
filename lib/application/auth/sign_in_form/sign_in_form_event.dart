part of 'sign_in_form_bloc.dart';

// Think of all of the possible things that the ui can perform to trigger some logic inside the block
// Comes into the bloc from the presentation layer
// Example, why are the parameters type String instead of type EmailAddress/Password?
// That's because the data that the user is passing in is just a plain String
// Whereas the sign_in_form_state is showing the state, their data types ARE EmailAddress/Password
// Since I'm using freezed to make the events a union, can make sure that all of the events are handled properly

@freezed
abstract class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.emailChanged(String emailString) = EmailChanged;
  const factory SignInFormEvent.passwordChanged(String passwordString) = PasswordChanged;
  const factory SignInFormEvent.registerWithEmailAndPasswordPressed() =
      RegisterWithEmailAndPasswordPressed;
  const factory SignInFormEvent.signInWithEmailAndPasswordPressed() =
      SignInWithEmailAndPasswordPressed;
  const factory SignInFormEvent.signInWithGooglePressed() = SignInWithGooglePressed;
}
