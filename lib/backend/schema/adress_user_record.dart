import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdressUserRecord extends FirestoreRecord {
  AdressUserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "adress" field.
  String? _adress;
  String get adress => _adress ?? '';
  bool hasAdress() => _adress != null;

  // "comments" field.
  String? _comments;
  String get comments => _comments ?? '';
  bool hasComments() => _comments != null;

  // "entrance" field.
  String? _entrance;
  String get entrance => _entrance ?? '';
  bool hasEntrance() => _entrance != null;

  // "User" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "korpus" field.
  String? _korpus;
  String get korpus => _korpus ?? '';
  bool hasKorpus() => _korpus != null;

  // "kvartira" field.
  String? _kvartira;
  String get kvartira => _kvartira ?? '';
  bool hasKvartira() => _kvartira != null;

  // "domofon" field.
  String? _domofon;
  String get domofon => _domofon ?? '';
  bool hasDomofon() => _domofon != null;

  // "AdressStrok" field.
  String? _adressStrok;
  String get adressStrok => _adressStrok ?? '';
  bool hasAdressStrok() => _adressStrok != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _status = snapshotData['status'] as bool?;
    _adress = snapshotData['adress'] as String?;
    _comments = snapshotData['comments'] as String?;
    _entrance = snapshotData['entrance'] as String?;
    _user = snapshotData['User'] as DocumentReference?;
    _korpus = snapshotData['korpus'] as String?;
    _kvartira = snapshotData['kvartira'] as String?;
    _domofon = snapshotData['domofon'] as String?;
    _adressStrok = snapshotData['AdressStrok'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AdressUser');

  static Stream<AdressUserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdressUserRecord.fromSnapshot(s));

  static Future<AdressUserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdressUserRecord.fromSnapshot(s));

  static AdressUserRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdressUserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdressUserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdressUserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdressUserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdressUserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdressUserRecordData({
  String? name,
  bool? status,
  String? adress,
  String? comments,
  String? entrance,
  DocumentReference? user,
  String? korpus,
  String? kvartira,
  String? domofon,
  String? adressStrok,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'status': status,
      'adress': adress,
      'comments': comments,
      'entrance': entrance,
      'User': user,
      'korpus': korpus,
      'kvartira': kvartira,
      'domofon': domofon,
      'AdressStrok': adressStrok,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdressUserRecordDocumentEquality implements Equality<AdressUserRecord> {
  const AdressUserRecordDocumentEquality();

  @override
  bool equals(AdressUserRecord? e1, AdressUserRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.status == e2?.status &&
        e1?.adress == e2?.adress &&
        e1?.comments == e2?.comments &&
        e1?.entrance == e2?.entrance &&
        e1?.user == e2?.user &&
        e1?.korpus == e2?.korpus &&
        e1?.kvartira == e2?.kvartira &&
        e1?.domofon == e2?.domofon &&
        e1?.adressStrok == e2?.adressStrok;
  }

  @override
  int hash(AdressUserRecord? e) => const ListEquality().hash([
        e?.name,
        e?.status,
        e?.adress,
        e?.comments,
        e?.entrance,
        e?.user,
        e?.korpus,
        e?.kvartira,
        e?.domofon,
        e?.adressStrok
      ]);

  @override
  bool isValidKey(Object? o) => o is AdressUserRecord;
}
