import 'package:book_club/model/failure.dart';
import 'package:book_club/provider/auth_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mock/firebase_auth_mock.dart';
import '../mock/firebase_user_mock.dart';
import '../mock/user_credential_mock.dart';

void main() {
  late AuthProvider authProvider;
  late FirebaseAuthMock firebaseAuthMock;
  late UserCredentialMock userCredentialMock;
  late FirebaseUserMock firebaseUserMock;

  setUp(() {
    firebaseUserMock = FirebaseUserMock(email: "email", uid: "uid");
    userCredentialMock = UserCredentialMock();
    firebaseAuthMock = FirebaseAuthMock();
    authProvider = AuthProvider(
      authResult: left(
        Failure(message: ""),
      ),
      firebaseAuth: firebaseAuthMock,
    );
  });

  test(
    "signInUser should authenticate user",
    () async {
      when(
        () => firebaseAuthMock.signInWithEmailAndPassword(
          email: any(named: "email"),
          password: any(
            named: "password",
          ),
        ),
      ).thenAnswer(
        (_) async => userCredentialMock,
      );

      when(() => userCredentialMock.user).thenReturn(firebaseUserMock);

      expect(authProvider.isAuth, false);

      await authProvider.signInUser("", "");

      verify(
        () => firebaseAuthMock.signInWithEmailAndPassword(
          email: any(named: "email"),
          password: any(
            named: "password",
          ),
        ),
      ).called(1);

      expect(authProvider.isAuth, true);
    },
  );

  test(
    "signUpUser should authenticate user",
    () async {
      when(
        () => firebaseAuthMock.createUserWithEmailAndPassword(
          email: any(named: "email"),
          password: any(named: "password"),
        ),
      ).thenAnswer(
        (_) async => userCredentialMock,
      );

      when(() => userCredentialMock.user).thenReturn(firebaseUserMock);

      expect(
        authProvider.isAuth,
        false,
      );

      await authProvider.signUpUser(
        "",
        "",
      );

      verify(
        () => firebaseAuthMock.createUserWithEmailAndPassword(
          email: any(named: "email"),
          password: any(named: "password"),
        ),
      ).called(
        1,
      );

      expect(
        authProvider.isAuth,
        true,
      );
    },
  );
}
