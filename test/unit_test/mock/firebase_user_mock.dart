import 'package:firebase_auth/firebase_auth.dart';
import 'package:mocktail/mocktail.dart';

class FirebaseUserMock extends Mock implements User {
  @override
  String email;

  @override
  String uid;

  FirebaseUserMock({
    required this.email,
    required this.uid,
  });
}
