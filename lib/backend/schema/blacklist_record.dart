import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BlacklistRecord extends FirestoreRecord {
  BlacklistRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "place" field.
  DocumentReference? _place;
  DocumentReference? get place => _place;
  bool hasPlace() => _place != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  bool hasReason() => _reason != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _place = snapshotData['place'] as DocumentReference?;
    _reason = snapshotData['reason'] as String?;
    _phone = snapshotData['phone'] as String?;
    _email = snapshotData['email'] as String?;
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('blacklist');

  static Stream<BlacklistRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BlacklistRecord.fromSnapshot(s));

  static Future<BlacklistRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BlacklistRecord.fromSnapshot(s));

  static BlacklistRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BlacklistRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BlacklistRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BlacklistRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BlacklistRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BlacklistRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBlacklistRecordData({
  DocumentReference? user,
  DocumentReference? place,
  String? reason,
  String? phone,
  String? email,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'place': place,
      'reason': reason,
      'phone': phone,
      'email': email,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class BlacklistRecordDocumentEquality implements Equality<BlacklistRecord> {
  const BlacklistRecordDocumentEquality();

  @override
  bool equals(BlacklistRecord? e1, BlacklistRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.place == e2?.place &&
        e1?.reason == e2?.reason &&
        e1?.phone == e2?.phone &&
        e1?.email == e2?.email &&
        e1?.name == e2?.name;
  }

  @override
  int hash(BlacklistRecord? e) => const ListEquality()
      .hash([e?.user, e?.place, e?.reason, e?.phone, e?.email, e?.name]);

  @override
  bool isValidKey(Object? o) => o is BlacklistRecord;
}
