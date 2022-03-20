import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String email;
  final String fullName;
  final Timestamp accountCreated;

  const User({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.accountCreated,
  });

  @override
  List<Object?> get props => [
        uid,
        email,
        fullName,
        accountCreated,
      ];
}
