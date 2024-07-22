import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PositionMenuRecord extends FirestoreRecord {
  PositionMenuRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "uid" field.
  int? _uid;
  int get uid => _uid ?? 0;
  bool hasUid() => _uid != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  bool hasNumber() => _number != null;

  // "restoran" field.
  DocumentReference? _restoran;
  DocumentReference? get restoran => _restoran;
  bool hasRestoran() => _restoran != null;

  // "close" field.
  bool? _close;
  bool get close => _close ?? false;
  bool hasClose() => _close != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _uid = castToType<int>(snapshotData['uid']);
    _number = castToType<int>(snapshotData['number']);
    _restoran = snapshotData['restoran'] as DocumentReference?;
    _close = snapshotData['close'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('positionMenu');

  static Stream<PositionMenuRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PositionMenuRecord.fromSnapshot(s));

  static Future<PositionMenuRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PositionMenuRecord.fromSnapshot(s));

  static PositionMenuRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PositionMenuRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PositionMenuRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PositionMenuRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PositionMenuRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PositionMenuRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPositionMenuRecordData({
  String? name,
  int? uid,
  int? number,
  DocumentReference? restoran,
  bool? close,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'uid': uid,
      'number': number,
      'restoran': restoran,
      'close': close,
    }.withoutNulls,
  );

  return firestoreData;
}

class PositionMenuRecordDocumentEquality
    implements Equality<PositionMenuRecord> {
  const PositionMenuRecordDocumentEquality();

  @override
  bool equals(PositionMenuRecord? e1, PositionMenuRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.uid == e2?.uid &&
        e1?.number == e2?.number &&
        e1?.restoran == e2?.restoran &&
        e1?.close == e2?.close;
  }

  @override
  int hash(PositionMenuRecord? e) => const ListEquality()
      .hash([e?.name, e?.uid, e?.number, e?.restoran, e?.close]);

  @override
  bool isValidKey(Object? o) => o is PositionMenuRecord;
}
