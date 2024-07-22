import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SoundRecord extends FirestoreRecord {
  SoundRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  bool hasCount() => _count != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _count = castToType<int>(snapshotData['count']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('sound')
          : FirebaseFirestore.instance.collectionGroup('sound');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('sound').doc(id);

  static Stream<SoundRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SoundRecord.fromSnapshot(s));

  static Future<SoundRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SoundRecord.fromSnapshot(s));

  static SoundRecord fromSnapshot(DocumentSnapshot snapshot) => SoundRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SoundRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SoundRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SoundRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SoundRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSoundRecordData({
  int? count,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'count': count,
    }.withoutNulls,
  );

  return firestoreData;
}

class SoundRecordDocumentEquality implements Equality<SoundRecord> {
  const SoundRecordDocumentEquality();

  @override
  bool equals(SoundRecord? e1, SoundRecord? e2) {
    return e1?.count == e2?.count;
  }

  @override
  int hash(SoundRecord? e) => const ListEquality().hash([e?.count]);

  @override
  bool isValidKey(Object? o) => o is SoundRecord;
}
