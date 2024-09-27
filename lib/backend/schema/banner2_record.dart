import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Banner2Record extends FirestoreRecord {
  Banner2Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "linkRest" field.
  DocumentReference? _linkRest;
  DocumentReference? get linkRest => _linkRest;
  bool hasLinkRest() => _linkRest != null;

  // "linkName" field.
  String? _linkName;
  String get linkName => _linkName ?? '';
  bool hasLinkName() => _linkName != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _linkRest = snapshotData['linkRest'] as DocumentReference?;
    _linkName = snapshotData['linkName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('banner2');

  static Stream<Banner2Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Banner2Record.fromSnapshot(s));

  static Future<Banner2Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Banner2Record.fromSnapshot(s));

  static Banner2Record fromSnapshot(DocumentSnapshot snapshot) =>
      Banner2Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Banner2Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Banner2Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Banner2Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Banner2Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBanner2RecordData({
  String? image,
  DocumentReference? linkRest,
  String? linkName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'linkRest': linkRest,
      'linkName': linkName,
    }.withoutNulls,
  );

  return firestoreData;
}

class Banner2RecordDocumentEquality implements Equality<Banner2Record> {
  const Banner2RecordDocumentEquality();

  @override
  bool equals(Banner2Record? e1, Banner2Record? e2) {
    return e1?.image == e2?.image &&
        e1?.linkRest == e2?.linkRest &&
        e1?.linkName == e2?.linkName;
  }

  @override
  int hash(Banner2Record? e) =>
      const ListEquality().hash([e?.image, e?.linkRest, e?.linkName]);

  @override
  bool isValidKey(Object? o) => o is Banner2Record;
}
