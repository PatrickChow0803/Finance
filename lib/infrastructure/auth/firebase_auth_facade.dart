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

@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthFacade(this._firebaseAuth, this._googleSignIn);

  // converts the user from firebase to my own personal UniqueUser object
  // optionOf makes it a type of Option
  // I should remove the Future here but then I'll have to edit the interface
  @override
  Future<Option<UniqueUser>> getSignedInUser() async => optionOf(UniqueUser(
      id: _firebaseAuth.currentUser.uid,
      displayName: _firebaseAuth.currentUser.displayName,
      email: _firebaseAuth.currentUser.email,
      profilePic: _firebaseAuth.currentUser.photoURL ?? 'No Profile pic'));

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
  Future<Either<AuthFailure, Unit>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
