import 'package:book_club/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Data {
  static Timestamp accountCreated = Timestamp.now();

  static User user = User(
    uid: "123",
    email: "jan@kowalski.com",
    fullName: "Jan Kowalski",
    accountCreated: accountCreated,
  );

  static Map<String, dynamic> userData = {
    "uid": "123",
    "email": "jan@kowalski.com",
    "fullName": "Jan Kowalski",
    "accountCreated": accountCreated,
  };
}
