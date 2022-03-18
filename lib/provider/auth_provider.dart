import 'package:book_club/model/auth_result.dart';
import 'package:book_club/model/failure.dart';
import 'package:book_club/model/notifier_state.dart';
import 'package:book_club/utils/google_sign_in_api.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  Either<Failure, AuthResult> authResult;
  NotifierState _notifierState = NotifierState.initial;

  final FirebaseAuth firebaseAuth;
  final GoogleSignInApi googleSignIn;

  AuthProvider({
    required this.googleSignIn,
    required this.authResult,
    required this.firebaseAuth,
  });

  NotifierState get notifierState => _notifierState;

  bool get isAuth => authResult.fold(
        (failure) => false,
        (authResult) => authResult.email.isNotEmpty && authResult.uuid.isNotEmpty,
      );

  void setNotifierState(NotifierState newState) {
    _notifierState = newState;

    notifyListeners();
  }

  void clearError() {
    authResult = left(
      Failure(message: ""),
    );

    notifyListeners();
  }

  Future<void> logout() async {
    setNotifierState(NotifierState.loading);

    try {
      await firebaseAuth.signOut();

      authResult = right(
        AuthResult(
          email: "",
          uuid: "",
        ),
      );
    } catch (e) {
      authResult = left(
        Failure(
          message: e.toString(),
        ),
      );
    }

    setNotifierState(NotifierState.loaded);
  }

  Future<void> autoLogin() async {
    try {
      final user = firebaseAuth.currentUser;

      await Future.delayed(Duration.zero);

      if (user != null) {
        authResult = right(
          AuthResult(
            email: user.email!,
            uuid: user.uid,
          ),
        );

        notifyListeners();
      }
    } catch (e) {
      authResult = left(
        Failure(
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> signInWithGoogle() async {
    setNotifierState(NotifierState.loading);

    try {
      final userData = await googleSignIn.login();
      final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: userData['accessToken'],
        idToken: userData['idToken'],
      );
      final user = await firebaseAuth.signInWithCredential(authCredential);

      if (user.user != null) {
        authResult = right(
          AuthResult(
            email: user.user!.email!,
            uuid: user.user!.uid,
          ),
        );
      }
    } catch (e) {
      authResult = left(
        Failure(message: e.toString()),
      );
    }

    setNotifierState(NotifierState.loaded);
  }

  Future<void> signUpUser(String email, String password) async {
    setNotifierState(NotifierState.loading);

    try {
      final user = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      if (user.user != null) {
        authResult = right(
          AuthResult(
            email: user.user!.email!,
            uuid: user.user!.uid,
          ),
        );
      } else {
        throw Exception();
      }
    } catch (e) {
      authResult = left(
        Failure(message: e.toString()),
      );
    }

    setNotifierState(NotifierState.loaded);
  }

  Future<void> signInUserWithEmail(String email, String password) async {
    setNotifierState(NotifierState.loading);

    try {
      final user = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      if (user.user != null) {
        authResult = right(
          AuthResult(
            email: user.user!.email!,
            uuid: user.user!.uid,
          ),
        );
      } else {
        throw Exception();
      }
    } catch (e) {
      authResult = left(
        Failure(
          message: e.toString(),
        ),
      );
    }

    setNotifierState(NotifierState.loaded);
  }

  Future<void> resetPassword(String email) async {
    setNotifierState(NotifierState.loading);

    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      authResult = left(
        Failure(
          message: e.toString(),
        ),
      );
    }

    setNotifierState(NotifierState.loaded);
  }
}
