import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryOfMenuRecord extends FirestoreRecord {
  CategoryOfMenuRecord._(
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

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _status = snapshotData['status'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Category_of_menu');

  static Stream<CategoryOfMenuRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoryOfMenuRecord.fromSnapshot(s));

  static Future<CategoryOfMenuRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoryOfMenuRecord.fromSnapshot(s));

  static CategoryOfMenuRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoryOfMenuRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoryOfMenuRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoryOfMenuRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoryOfMenuRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoryOfMenuRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoryOfMenuRecordData({
  String? name,
  bool? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoryOfMenuRecordDocumentEquality
    implements Equality<CategoryOfMenuRecord> {
  const CategoryOfMenuRecordDocumentEquality();

  @override
  bool equals(CategoryOfMenuRecord? e1, CategoryOfMenuRecord? e2) {
    return e1?.name == e2?.name && e1?.status == e2?.status;
  }

  @override
  int hash(CategoryOfMenuRecord? e) =>
      const ListEquality().hash([e?.name, e?.status]);

  @override
  bool isValidKey(Object? o) => o is CategoryOfMenuRecord;
}
