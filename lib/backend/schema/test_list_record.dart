import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestListRecord extends FirestoreRecord {
  TestListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('TestList');

  static Stream<TestListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestListRecord.fromSnapshot(s));

  static Future<TestListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestListRecord.fromSnapshot(s));

  static TestListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TestListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestListRecordData({
  String? email,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
    }.withoutNulls,
  );

  return firestoreData;
}

class TestListRecordDocumentEquality implements Equality<TestListRecord> {
  const TestListRecordDocumentEquality();

  @override
  bool equals(TestListRecord? e1, TestListRecord? e2) {
    return e1?.email == e2?.email;
  }

  @override
  int hash(TestListRecord? e) => const ListEquality().hash([e?.email]);

  @override
  bool isValidKey(Object? o) => o is TestListRecord;
}
