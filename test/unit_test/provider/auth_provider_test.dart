import 'package:book_club/model/failure.dart';
import 'package:book_club/provider/auth_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../fake/auth_credential_fake.dart';
import '../mock/firebase_auth_mock.dart';
import '../mock/firebase_user_mock.dart';
import '../mock/google_sign_in_mock.dart';
import '../mock/user_credential_mock.dart';

void main() {
  late AuthProvider authProvider;
  late FirebaseAuthMock firebaseAuthMock;
  late UserCredentialMock userCredentialMock;
  late FirebaseUserMock firebaseUserMock;
  late GoogleSignInApiMock googleSignInMock;

  setUp(() {
    registerFallbackValue(AuthCredentialFake());

    firebaseUserMock = FirebaseUserMock(email: "email", uid: "uid");
    userCredentialMock = UserCredentialMock();
    firebaseAuthMock = FirebaseAuthMock();
    googleSignInMock = GoogleSignInApiMock();

    authProvider = AuthProvider(
      googleSignIn: googleSignInMock,
      authResult: left(
        Failure(message: ""),
      ),
      firebaseAuth: firebaseAuthMock,
    );
  });

  test(
    "signInWithGoogle should authenticate user",
    () async {
      when(() => googleSignInMock.login()).thenAnswer(
        (_) async => {
          "firstName": "Jan",
          "lastName": "Kowalski",
          "email": "jan@kowalski.com",
          "idToken": "123456",
          "accessToken": "123456",
        },
      );

      when(() => firebaseAuthMock.signInWithCredential(any())).thenAnswer((_) async => userCredentialMock);
      when(() => userCredentialMock.user).thenReturn(firebaseUserMock);

      expect(authProvider.isAuth, false);

      await authProvider.signInWithGoogle();

      verify(() => googleSignInMock.login()).called(1);
      verify(() => firebaseAuthMock.signInWithCredential(any())).called(1);

      expect(authProvider.isAuth, true);
    },
  );

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

      await authProvider.signInUserWithEmail("", "");

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
