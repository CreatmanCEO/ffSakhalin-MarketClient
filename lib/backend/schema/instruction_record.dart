import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InstructionRecord extends FirestoreRecord {
  InstructionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "num" field.
  int? _num;
  int get num => _num ?? 0;
  bool hasNum() => _num != null;

  // "mobView" field.
  bool? _mobView;
  bool get mobView => _mobView ?? false;
  bool hasMobView() => _mobView != null;

  // "videoUrl" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  bool hasVideoUrl() => _videoUrl != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _num = castToType<int>(snapshotData['num']);
    _mobView = snapshotData['mobView'] as bool?;
    _videoUrl = snapshotData['videoUrl'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('instruction');

  static Stream<InstructionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InstructionRecord.fromSnapshot(s));

  static Future<InstructionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InstructionRecord.fromSnapshot(s));

  static InstructionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InstructionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InstructionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InstructionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InstructionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InstructionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInstructionRecordData({
  String? name,
  int? num,
  bool? mobView,
  String? videoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'num': num,
      'mobView': mobView,
      'videoUrl': videoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class InstructionRecordDocumentEquality implements Equality<InstructionRecord> {
  const InstructionRecordDocumentEquality();

  @override
  bool equals(InstructionRecord? e1, InstructionRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.num == e2?.num &&
        e1?.mobView == e2?.mobView &&
        e1?.videoUrl == e2?.videoUrl;
  }

  @override
  int hash(InstructionRecord? e) =>
      const ListEquality().hash([e?.name, e?.num, e?.mobView, e?.videoUrl]);

  @override
  bool isValidKey(Object? o) => o is InstructionRecord;
}
