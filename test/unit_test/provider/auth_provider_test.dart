import 'package:book_club/model/failure.dart';
import 'package:book_club/provider/auth_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mock/firebase_auth_mock.dart';

void main() {
  late AuthProvider authProvider;
  late FirebaseAuthMock firebaseAuthMock;

  setUp(() {
    firebaseAuthMock = FirebaseAuthMock();
    authProvider = AuthProvider(
      authResult: left(
        Failure(message: ""),
      ),
      firebaseAuth: firebaseAuthMock,
    );
  });

  test("signUpUser should return true", () async {
    when(() => firebaseAuthMock.createUserWithEmailAndPassword(email: any(), password: any())).thenAnswer((_) async => UserCredential());
  });
}
