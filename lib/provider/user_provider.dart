import 'package:book_club/model/failure.dart';
import 'package:book_club/model/notifier_state.dart';
import 'package:book_club/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  final FirebaseFirestore firebaseFirestore;
  Either<Failure, User> user;
  NotifierState _notifierState = NotifierState.initial;

  UserProvider({
    required this.firebaseFirestore,
    required this.user,
  });

  NotifierState get notifierState => _notifierState;

  void setNotifierState(NotifierState newNotifierState) {
    _notifierState = newNotifierState;
    notifyListeners();
  }

  Future<void> loadUser(String uid) async {
    setNotifierState(NotifierState.loading);

    try {
      final userDataSnapshot = await firebaseFirestore.collection("user").doc(uid).get();
      final userData = userDataSnapshot.data();

      if (userData != null) {
        user = right(
          User(
            uid: uid,
            email: userData['email'],
            fullName: userData['fullName'],
            accountCreated: userData['accountCreated'],
          ),
        );
      } else {
        user = left(
          Failure(
            message: "User data not found",
          ),
        );
      }
    } catch (e) {
      user = left(
        Failure(
          message: e.toString(),
        ),
      );
    }

    setNotifierState(NotifierState.loaded);
  }

  Future<void> createUser(String uid, String email, String fullName, Timestamp accountCreated) async {
    setNotifierState(NotifierState.loading);

    try {
      await firebaseFirestore.collection("user").doc(uid).set(
        {
          "fullName": fullName,
          "email": email,
          "accountCreated": accountCreated,
        },
      );

      user = right(
        User(
          uid: uid,
          email: email,
          fullName: fullName,
          accountCreated: accountCreated,
        ),
      );
    } catch (e) {
      user = left(
        Failure(
          message: e.toString(),
        ),
      );
    }

    setNotifierState(NotifierState.loaded);
  }
}
