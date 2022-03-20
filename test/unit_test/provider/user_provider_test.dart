import 'package:book_club/model/failure.dart';
import 'package:book_club/model/notifier_state.dart';
import 'package:book_club/provider/user_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../data/data.dart';
import '../mock/collection_reference_mock.dart';
import '../mock/document_reference_mock.dart';
import '../mock/document_snapshot_mock.dart';
import '../mock/firebase_firestore_mock.dart';

void main() {
  late UserProvider userProvider;
  late FirebaseFirestoreMock firebaseFirestoreMock;
  late DocumentSnapshotMock documentSnapshotMock;
  late DocumentReferenceMock documentReferenceMock;
  late CollectionReferenceMock collectionReferenceMock;

  setUp(() {
    firebaseFirestoreMock = FirebaseFirestoreMock();
    documentReferenceMock = DocumentReferenceMock();
    documentSnapshotMock = DocumentSnapshotMock();
    collectionReferenceMock = CollectionReferenceMock();

    userProvider = UserProvider(
      firebaseFirestore: firebaseFirestoreMock,
      user: left(
        Failure(message: ""),
      ),
    );
  });

  test(
    "createUser should return user",
    () async {
      when(() => firebaseFirestoreMock.collection(any())).thenReturn(collectionReferenceMock);
      when(() => collectionReferenceMock.doc(any())).thenReturn(documentReferenceMock);
      when(() => documentReferenceMock.set(any())).thenAnswer((_) async => unit);

      await userProvider.createUser(
        Data.user.uid,
        Data.user.email,
        Data.user.fullName,
        Data.user.accountCreated,
      );

      userProvider.user.fold(
        (failure) => Fail(failure.message),
        (user) => expect(
          user,
          Data.user,
        ),
      );
    },
  );

  test(
    "loadUser should load user",
    () async {
      when(() => firebaseFirestoreMock.collection(any())).thenReturn(collectionReferenceMock);
      when(() => collectionReferenceMock.doc(any())).thenReturn(documentReferenceMock);
      when(() => documentReferenceMock.get()).thenAnswer((_) async => documentSnapshotMock);
      when(() => documentSnapshotMock.data()).thenReturn(
        Data.userData,
      );

      await userProvider.loadUser("123");

      expect(userProvider.notifierState, NotifierState.loaded);
      userProvider.user.fold(
        (failure) => Fail(failure.message),
        (user) {
          expect(user, Data.user);
        },
      );
    },
  );
}
