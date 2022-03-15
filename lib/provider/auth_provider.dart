import 'package:book_club/model/auth_result.dart';
import 'package:book_club/model/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  Either<Failure, AuthResult> authResult;

  FirebaseAuth firebaseAuth;

  AuthProvider({
    required this.authResult,
    required this.firebaseAuth,
  });

  bool get isAuth => authResult.fold(
        (failure) => false,
        (authResult) => true,
      );

  Future<void> signUpUser(String email, String password) async {
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

    notifyListeners();
  }

  Future<void> signInUser(String email, String password) async {
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
  }
}
