import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:finance/domain/auth/auth_failure.dart';
import 'package:finance/domain/auth/i_auth_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

// logic goes into here
// The logic performed inside BLoCs is focused on transforming incoming events into states.
// For example, a raw String will come in from the UI and a validated EmailAddress will come out.

// since this is expecting an IAuthFacade instance, make this injectable

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial());

  @override
  Stream<SignInFormState> mapEventToState(
    SignInFormEvent event,
  ) async* {
    // yield adds a value to the output stream of the surrounding async* function. It's like return, but doesn't terminate the function.
    // use yield for when you want to change the state's variable
    yield* event.map(
      emailChanged: (e) async* {
        yield state.copyWith(
          emailAddress: e.emailString,

          // when the email address changes, it's not correct to associate the old "auth response" with the updated email address.
          // therefore reset authFailureOrSuccessOption
          authFailureOrSuccessOption: none(),
        );
      },
      passwordChanged: (e) async* {
        yield state.copyWith(
          password: e.passwordString,

          // when the email address changes, it's not correct to associate the old "auth response" with the updated password.
          // therefore reset authFailureOrSuccessOption
          authFailureOrSuccessOption: none(),
        );
      },
      registerWithEmailAndPasswordPressed: (e) async* {
        yield* _performActionOnAuthFacadeWithEmailAndPassword(
          _authFacade.registerWithEmailAndPassword,
        );
      },
      signInWithEmailAndPasswordPressed: (e) async* {
        yield* _performActionOnAuthFacadeWithEmailAndPassword(
          _authFacade.signInWithEmailAndPassword,
        );
      },
    );
  }

  Stream<SignInFormState> _performActionOnAuthFacadeWithEmailAndPassword(
    Future<Either<AuthFailure, Unit>> Function({
      @required String emailAddress,
      @required String password,
    }) // the function that was passed in
        forwardedCall,
  ) async* {
    Either<AuthFailure, Unit> failureOrSuccess;

    // before doing the future method
    yield state.copyWith(
      // show the loading spinner
      isSubmitting: true,
      authFailureOrSuccessOption: none(),
    );

    failureOrSuccess = await forwardedCall(
      emailAddress: state.emailAddress,
      password: state.password,
    );

    // after finishing the future method
    yield state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    );
  }
}
