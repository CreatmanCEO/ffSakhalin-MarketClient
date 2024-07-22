import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavoritShopRecord extends FirestoreRecord {
  FavoritShopRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Shop" field.
  DocumentReference? _shop;
  DocumentReference? get shop => _shop;
  bool hasShop() => _shop != null;

  // "User" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _shop = snapshotData['Shop'] as DocumentReference?;
    _user = snapshotData['User'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('FavoritShop');

  static Stream<FavoritShopRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavoritShopRecord.fromSnapshot(s));

  static Future<FavoritShopRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavoritShopRecord.fromSnapshot(s));

  static FavoritShopRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FavoritShopRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavoritShopRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavoritShopRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavoritShopRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavoritShopRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavoritShopRecordData({
  DocumentReference? shop,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Shop': shop,
      'User': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class FavoritShopRecordDocumentEquality implements Equality<FavoritShopRecord> {
  const FavoritShopRecordDocumentEquality();

  @override
  bool equals(FavoritShopRecord? e1, FavoritShopRecord? e2) {
    return e1?.shop == e2?.shop && e1?.user == e2?.user;
  }

  @override
  int hash(FavoritShopRecord? e) =>
      const ListEquality().hash([e?.shop, e?.user]);

  @override
  bool isValidKey(Object? o) => o is FavoritShopRecord;
}
