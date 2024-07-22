import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OptionItemRecord extends FirestoreRecord {
  OptionItemRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "ves" field.
  double? _ves;
  double get ves => _ves ?? 0.0;
  bool hasVes() => _ves != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "restoran" field.
  DocumentReference? _restoran;
  DocumentReference? get restoran => _restoran;
  bool hasRestoran() => _restoran != null;

  // "menu" field.
  List<DocumentReference>? _menu;
  List<DocumentReference> get menu => _menu ?? const [];
  bool hasMenu() => _menu != null;

  // "OptionTXT" field.
  List<String>? _optionTXT;
  List<String> get optionTXT => _optionTXT ?? const [];
  bool hasOptionTXT() => _optionTXT != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _ves = castToType<double>(snapshotData['ves']);
    _price = castToType<double>(snapshotData['price']);
    _restoran = snapshotData['restoran'] as DocumentReference?;
    _menu = getDataList(snapshotData['menu']);
    _optionTXT = getDataList(snapshotData['OptionTXT']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('OptionItem');

  static Stream<OptionItemRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OptionItemRecord.fromSnapshot(s));

  static Future<OptionItemRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OptionItemRecord.fromSnapshot(s));

  static OptionItemRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OptionItemRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OptionItemRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OptionItemRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OptionItemRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OptionItemRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOptionItemRecordData({
  String? name,
  double? ves,
  double? price,
  DocumentReference? restoran,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'ves': ves,
      'price': price,
      'restoran': restoran,
    }.withoutNulls,
  );

  return firestoreData;
}

class OptionItemRecordDocumentEquality implements Equality<OptionItemRecord> {
  const OptionItemRecordDocumentEquality();

  @override
  bool equals(OptionItemRecord? e1, OptionItemRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.ves == e2?.ves &&
        e1?.price == e2?.price &&
        e1?.restoran == e2?.restoran &&
        listEquality.equals(e1?.menu, e2?.menu) &&
        listEquality.equals(e1?.optionTXT, e2?.optionTXT);
  }

  @override
  int hash(OptionItemRecord? e) => const ListEquality()
      .hash([e?.name, e?.ves, e?.price, e?.restoran, e?.menu, e?.optionTXT]);

  @override
  bool isValidKey(Object? o) => o is OptionItemRecord;
}
