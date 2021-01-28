// because IAuthFacade is just an interface, i want to tell the compiler that what I want
// is the actual concrete implementation. Look at injection.config.dart for reference
import 'package:dartz/dartz.dart';
import 'package:finance/domain/auth/auth_failure.dart';
import 'package:finance/domain/auth/i_auth_facade.dart';
import 'package:finance/domain/auth/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:finance/infrastructure/auth/firebase_user_mapper.dart';

@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthFacade(this._firebaseAuth, this._googleSignIn);

  // converts the user from firebase to my own personal UniqueUser object
  // optionOf makes it a type of Option
  // I should remove the Future here but then I'll have to edit the interface
  @override
  Future<Option<UniqueUser>> getSignedInUser() async =>
      optionOf(_firebaseAuth.currentUser?.toDomain());

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required String emailAddress,
    @required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: emailAddress, password: password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      // look at quick documentations on .createUserWithEmailAndPassword to see the different error codes
      if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithApple() {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required String emailAddress,
    @required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: emailAddress, password: password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      // look at quick documentations on .signInWithEmailAndPassword to see the different error codes
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      // .signIn returns a null if the sign in process was aborted
      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
      }

      final googleAuthentication = await googleUser.authentication;

      final authCredential = GoogleAuthProvider.credential(
        idToken: googleAuthentication.idToken,
        accessToken: googleAuthentication.accessToken,
      );

      await _firebaseAuth.signInWithCredential(authCredential);
      return right(unit);
    } on FirebaseException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  // this is essentially the same as just doing
  // await _firebaseAuth.signOut()
  // await _googleSignIn.signOut()

  @override
  Future<void> signOut() => Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
}
