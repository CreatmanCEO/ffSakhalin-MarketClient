import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderItemRecord extends FirestoreRecord {
  OrderItemRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "discription" field.
  String? _discription;
  String get discription => _discription ?? '';
  bool hasDiscription() => _discription != null;

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

  // "oldPrise" field.
  double? _oldPrise;
  double get oldPrise => _oldPrise ?? 0.0;
  bool hasOldPrise() => _oldPrise != null;

  // "restoran" field.
  DocumentReference? _restoran;
  DocumentReference? get restoran => _restoran;
  bool hasRestoran() => _restoran != null;

  // "product" field.
  DocumentReference? _product;
  DocumentReference? get product => _product;
  bool hasProduct() => _product != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "restoranname" field.
  String? _restoranname;
  String get restoranname => _restoranname ?? '';
  bool hasRestoranname() => _restoranname != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "TotalPrise" field.
  double? _totalPrise;
  double get totalPrise => _totalPrise ?? 0.0;
  bool hasTotalPrise() => _totalPrise != null;

  // "Option" field.
  List<DocumentReference>? _option;
  List<DocumentReference> get option => _option ?? const [];
  bool hasOption() => _option != null;

  // "OptionTXT" field.
  List<String>? _optionTXT;
  List<String> get optionTXT => _optionTXT ?? const [];
  bool hasOptionTXT() => _optionTXT != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _discription = snapshotData['discription'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _allergies = getDataList(snapshotData['allergies']);
    _ves = snapshotData['ves'] as String?;
    _kkal = castToType<int>(snapshotData['kkal']);
    _b = castToType<int>(snapshotData['b']);
    _zh = castToType<int>(snapshotData['zh']);
    _u = castToType<int>(snapshotData['u']);
    _categoryBluda = getDataList(snapshotData['CategoryBluda']);
    _image = getDataList(snapshotData['image']);
    _oldPrise = castToType<double>(snapshotData['oldPrise']);
    _restoran = snapshotData['restoran'] as DocumentReference?;
    _product = snapshotData['product'] as DocumentReference?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _restoranname = snapshotData['restoranname'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _totalPrise = castToType<double>(snapshotData['TotalPrise']);
    _option = getDataList(snapshotData['Option']);
    _optionTXT = getDataList(snapshotData['OptionTXT']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Order_item');

  static Stream<OrderItemRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderItemRecord.fromSnapshot(s));

  static Future<OrderItemRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderItemRecord.fromSnapshot(s));

  static OrderItemRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrderItemRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderItemRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderItemRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderItemRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderItemRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderItemRecordData({
  String? name,
  String? discription,
  double? price,
  String? ves,
  int? kkal,
  int? b,
  int? zh,
  int? u,
  double? oldPrise,
  DocumentReference? restoran,
  DocumentReference? product,
  int? quantity,
  String? restoranname,
  DocumentReference? user,
  double? totalPrise,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'discription': discription,
      'price': price,
      'ves': ves,
      'kkal': kkal,
      'b': b,
      'zh': zh,
      'u': u,
      'oldPrise': oldPrise,
      'restoran': restoran,
      'product': product,
      'quantity': quantity,
      'restoranname': restoranname,
      'user': user,
      'TotalPrise': totalPrise,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderItemRecordDocumentEquality implements Equality<OrderItemRecord> {
  const OrderItemRecordDocumentEquality();

  @override
  bool equals(OrderItemRecord? e1, OrderItemRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.discription == e2?.discription &&
        e1?.price == e2?.price &&
        listEquality.equals(e1?.allergies, e2?.allergies) &&
        e1?.ves == e2?.ves &&
        e1?.kkal == e2?.kkal &&
        e1?.b == e2?.b &&
        e1?.zh == e2?.zh &&
        e1?.u == e2?.u &&
        listEquality.equals(e1?.categoryBluda, e2?.categoryBluda) &&
        listEquality.equals(e1?.image, e2?.image) &&
        e1?.oldPrise == e2?.oldPrise &&
        e1?.restoran == e2?.restoran &&
        e1?.product == e2?.product &&
        e1?.quantity == e2?.quantity &&
        e1?.restoranname == e2?.restoranname &&
        e1?.user == e2?.user &&
        e1?.totalPrise == e2?.totalPrise &&
        listEquality.equals(e1?.option, e2?.option) &&
        listEquality.equals(e1?.optionTXT, e2?.optionTXT);
  }

  @override
  int hash(OrderItemRecord? e) => const ListEquality().hash([
        e?.name,
        e?.discription,
        e?.price,
        e?.allergies,
        e?.ves,
        e?.kkal,
        e?.b,
        e?.zh,
        e?.u,
        e?.categoryBluda,
        e?.image,
        e?.oldPrise,
        e?.restoran,
        e?.product,
        e?.quantity,
        e?.restoranname,
        e?.user,
        e?.totalPrise,
        e?.option,
        e?.optionTXT
      ]);

  @override
  bool isValidKey(Object? o) => o is OrderItemRecord;
}
