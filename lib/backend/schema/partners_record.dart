import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PartnersRecord extends FirestoreRecord {
  PartnersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "company" field.
  String? _company;
  String get company => _company ?? '';
  bool hasCompany() => _company != null;

  // "read" field.
  bool? _read;
  bool get read => _read ?? false;
  bool hasRead() => _read != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _company = snapshotData['company'] as String?;
    _read = snapshotData['read'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('partners');

  static Stream<PartnersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PartnersRecord.fromSnapshot(s));

  static Future<PartnersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PartnersRecord.fromSnapshot(s));

  static PartnersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PartnersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PartnersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PartnersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PartnersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PartnersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPartnersRecordData({
  String? email,
  String? displayName,
  DateTime? createdTime,
  String? phoneNumber,
  String? company,
  bool? read,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'company': company,
      'read': read,
    }.withoutNulls,
  );

  return firestoreData;
}

class PartnersRecordDocumentEquality implements Equality<PartnersRecord> {
  const PartnersRecordDocumentEquality();

  @override
  bool equals(PartnersRecord? e1, PartnersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.company == e2?.company &&
        e1?.read == e2?.read;
  }

  @override
  int hash(PartnersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.createdTime,
        e?.phoneNumber,
        e?.company,
        e?.read
      ]);

  @override
  bool isValidKey(Object? o) => o is PartnersRecord;
}
