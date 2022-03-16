import 'package:book_club/model/auth_result.dart';
import 'package:book_club/model/failure.dart';
import 'package:book_club/model/notifier_state.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  Either<Failure, AuthResult> authResult;
  NotifierState _notifierState = NotifierState.initial;

  FirebaseAuth firebaseAuth;

  AuthProvider({
    required this.authResult,
    required this.firebaseAuth,
  });

  NotifierState get notifierState => _notifierState;

  bool get isAuth => authResult.fold(
        (failure) => false,
        (authResult) => true,
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
}
