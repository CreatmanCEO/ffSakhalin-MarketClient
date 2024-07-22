import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavoritItemRecord extends FirestoreRecord {
  FavoritItemRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "User" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "item" field.
  DocumentReference? _item;
  DocumentReference? get item => _item;
  bool hasItem() => _item != null;

  // "Restoran" field.
  DocumentReference? _restoran;
  DocumentReference? get restoran => _restoran;
  bool hasRestoran() => _restoran != null;

  void _initializeFields() {
    _user = snapshotData['User'] as DocumentReference?;
    _item = snapshotData['item'] as DocumentReference?;
    _restoran = snapshotData['Restoran'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('FavoritItem');

  static Stream<FavoritItemRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavoritItemRecord.fromSnapshot(s));

  static Future<FavoritItemRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavoritItemRecord.fromSnapshot(s));

  static FavoritItemRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FavoritItemRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavoritItemRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavoritItemRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavoritItemRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavoritItemRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavoritItemRecordData({
  DocumentReference? user,
  DocumentReference? item,
  DocumentReference? restoran,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'User': user,
      'item': item,
      'Restoran': restoran,
    }.withoutNulls,
  );

  return firestoreData;
}

class FavoritItemRecordDocumentEquality implements Equality<FavoritItemRecord> {
  const FavoritItemRecordDocumentEquality();

  @override
  bool equals(FavoritItemRecord? e1, FavoritItemRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.item == e2?.item &&
        e1?.restoran == e2?.restoran;
  }

  @override
  int hash(FavoritItemRecord? e) =>
      const ListEquality().hash([e?.user, e?.item, e?.restoran]);

  @override
  bool isValidKey(Object? o) => o is FavoritItemRecord;
}
