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

  Future<bool> signUpUser(String email, String password) async {}

  Future<bool> signInUser(String email, String password) async {}
}
