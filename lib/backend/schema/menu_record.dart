import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MenuRecord extends FirestoreRecord {
  MenuRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "allergies" field.
  List<String>? _allergies;
  List<String> get allergies => _allergies ?? const [];
  bool hasAllergies() => _allergies != null;

  // "ves" field.
  String? _ves;
  String get ves => _ves ?? '';
  bool hasVes() => _ves != null;

  // "Status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "kkal" field.
  int? _kkal;
  int get kkal => _kkal ?? 0;
  bool hasKkal() => _kkal != null;

  // "b" field.
  int? _b;
  int get b => _b ?? 0;
  bool hasB() => _b != null;

  // "zh" field.
  int? _zh;
  int get zh => _zh ?? 0;
  bool hasZh() => _zh != null;

  // "u" field.
  int? _u;
  int get u => _u ?? 0;
  bool hasU() => _u != null;

  // "CategoryBluda" field.
  List<String>? _categoryBluda;
  List<String> get categoryBluda => _categoryBluda ?? const [];
  bool hasCategoryBluda() => _categoryBluda != null;

  // "image" field.
  List<String>? _image;
  List<String> get image => _image ?? const [];
  bool hasImage() => _image != null;

  // "StatusTXT" field.
  String? _statusTXT;
  String get statusTXT => _statusTXT ?? '';
  bool hasStatusTXT() => _statusTXT != null;

  // "oldPrice" field.
  double? _oldPrice;
  double get oldPrice => _oldPrice ?? 0.0;
  bool hasOldPrice() => _oldPrice != null;

  // "sostav" field.
  String? _sostav;
  String get sostav => _sostav ?? '';
  bool hasSostav() => _sostav != null;

  // "restoran" field.
  DocumentReference? _restoran;
  DocumentReference? get restoran => _restoran;
  bool hasRestoran() => _restoran != null;

  // "restoranName" field.
  String? _restoranName;
  String get restoranName => _restoranName ?? '';
  bool hasRestoranName() => _restoranName != null;

  // "options" field.
  List<DocumentReference>? _options;
  List<DocumentReference> get options => _options ?? const [];
  bool hasOptions() => _options != null;

  // "reviews" field.
  List<DocumentReference>? _reviews;
  List<DocumentReference> get reviews => _reviews ?? const [];
  bool hasReviews() => _reviews != null;

  // "summaRatinTovar" field.
  List<int>? _summaRatinTovar;
  List<int> get summaRatinTovar => _summaRatinTovar ?? const [];
  bool hasSummaRatinTovar() => _summaRatinTovar != null;

  // "Sharp" field.
  bool? _sharp;
  bool get sharp => _sharp ?? false;
  bool hasSharp() => _sharp != null;

  // "popular" field.
  int? _popular;
  int get popular => _popular ?? 0;
  bool hasPopular() => _popular != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _allergies = getDataList(snapshotData['allergies']);
    _ves = snapshotData['ves'] as String?;
    _status = snapshotData['Status'] as bool?;
    _kkal = castToType<int>(snapshotData['kkal']);
    _b = castToType<int>(snapshotData['b']);
    _zh = castToType<int>(snapshotData['zh']);
    _u = castToType<int>(snapshotData['u']);
    _categoryBluda = getDataList(snapshotData['CategoryBluda']);
    _image = getDataList(snapshotData['image']);
    _statusTXT = snapshotData['StatusTXT'] as String?;
    _oldPrice = castToType<double>(snapshotData['oldPrice']);
    _sostav = snapshotData['sostav'] as String?;
    _restoran = snapshotData['restoran'] as DocumentReference?;
    _restoranName = snapshotData['restoranName'] as String?;
    _options = getDataList(snapshotData['options']);
    _reviews = getDataList(snapshotData['reviews']);
    _summaRatinTovar = getDataList(snapshotData['summaRatinTovar']);
    _sharp = snapshotData['Sharp'] as bool?;
    _popular = castToType<int>(snapshotData['popular']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('menu')
          : FirebaseFirestore.instance.collectionGroup('menu');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('menu').doc(id);

  static Stream<MenuRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MenuRecord.fromSnapshot(s));

  static Future<MenuRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MenuRecord.fromSnapshot(s));

  static MenuRecord fromSnapshot(DocumentSnapshot snapshot) => MenuRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MenuRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MenuRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MenuRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MenuRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMenuRecordData({
  String? name,
  String? description,
  double? price,
  String? ves,
  bool? status,
  int? kkal,
  int? b,
  int? zh,
  int? u,
  String? statusTXT,
  double? oldPrice,
  String? sostav,
  DocumentReference? restoran,
  String? restoranName,
  bool? sharp,
  int? popular,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'ves': ves,
      'Status': status,
      'kkal': kkal,
      'b': b,
      'zh': zh,
      'u': u,
      'StatusTXT': statusTXT,
      'oldPrice': oldPrice,
      'sostav': sostav,
      'restoran': restoran,
      'restoranName': restoranName,
      'Sharp': sharp,
      'popular': popular,
    }.withoutNulls,
  );

  return firestoreData;
}

class MenuRecordDocumentEquality implements Equality<MenuRecord> {
  const MenuRecordDocumentEquality();

  @override
  bool equals(MenuRecord? e1, MenuRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price &&
        listEquality.equals(e1?.allergies, e2?.allergies) &&
        e1?.ves == e2?.ves &&
        e1?.status == e2?.status &&
        e1?.kkal == e2?.kkal &&
        e1?.b == e2?.b &&
        e1?.zh == e2?.zh &&
        e1?.u == e2?.u &&
        listEquality.equals(e1?.categoryBluda, e2?.categoryBluda) &&
        listEquality.equals(e1?.image, e2?.image) &&
        e1?.statusTXT == e2?.statusTXT &&
        e1?.oldPrice == e2?.oldPrice &&
        e1?.sostav == e2?.sostav &&
        e1?.restoran == e2?.restoran &&
        e1?.restoranName == e2?.restoranName &&
        listEquality.equals(e1?.options, e2?.options) &&
        listEquality.equals(e1?.reviews, e2?.reviews) &&
        listEquality.equals(e1?.summaRatinTovar, e2?.summaRatinTovar) &&
        e1?.sharp == e2?.sharp &&
        e1?.popular == e2?.popular;
  }

  @override
  int hash(MenuRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.price,
        e?.allergies,
        e?.ves,
        e?.status,
        e?.kkal,
        e?.b,
        e?.zh,
        e?.u,
        e?.categoryBluda,
        e?.image,
        e?.statusTXT,
        e?.oldPrice,
        e?.sostav,
        e?.restoran,
        e?.restoranName,
        e?.options,
        e?.reviews,
        e?.summaRatinTovar,
        e?.sharp,
        e?.popular
      ]);

  @override
  bool isValidKey(Object? o) => o is MenuRecord;
}
