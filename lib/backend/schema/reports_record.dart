import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportsRecord extends FirestoreRecord {
  ReportsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "User" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "msg" field.
  String? _msg;
  String get msg => _msg ?? '';
  bool hasMsg() => _msg != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "check" field.
  bool? _check;
  bool get check => _check ?? false;
  bool hasCheck() => _check != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _user = snapshotData['User'] as DocumentReference?;
    _msg = snapshotData['msg'] as String?;
    _data = snapshotData['data'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _check = snapshotData['check'] as bool?;
    _name = snapshotData['Name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reports');

  static Stream<ReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportsRecord.fromSnapshot(s));

  static Future<ReportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportsRecord.fromSnapshot(s));

  static ReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportsRecordData({
  DocumentReference? user,
  String? msg,
  DateTime? data,
  String? email,
  bool? check,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'User': user,
      'msg': msg,
      'data': data,
      'email': email,
      'check': check,
      'Name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportsRecordDocumentEquality implements Equality<ReportsRecord> {
  const ReportsRecordDocumentEquality();

  @override
  bool equals(ReportsRecord? e1, ReportsRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.msg == e2?.msg &&
        e1?.data == e2?.data &&
        e1?.email == e2?.email &&
        e1?.check == e2?.check &&
        e1?.name == e2?.name;
  }

  @override
  int hash(ReportsRecord? e) => const ListEquality()
      .hash([e?.user, e?.msg, e?.data, e?.email, e?.check, e?.name]);

  @override
  bool isValidKey(Object? o) => o is ReportsRecord;
}
