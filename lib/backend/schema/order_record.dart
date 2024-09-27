import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderRecord extends FirestoreRecord {
  OrderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Number" field.
  int? _number;
  int get number => _number ?? 0;
  bool hasNumber() => _number != null;

  // "Date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "Timer" field.
  DateTime? _timer;
  DateTime? get timer => _timer;
  bool hasTimer() => _timer != null;

  // "Restoran" field.
  DocumentReference? _restoran;
  DocumentReference? get restoran => _restoran;
  bool hasRestoran() => _restoran != null;

  // "delivery" field.
  bool? _delivery;
  bool get delivery => _delivery ?? false;
  bool hasDelivery() => _delivery != null;

  // "deliveryaddress" field.
  String? _deliveryaddress;
  String get deliveryaddress => _deliveryaddress ?? '';
  bool hasDeliveryaddress() => _deliveryaddress != null;

  // "SummaOrder" field.
  double? _summaOrder;
  double get summaOrder => _summaOrder ?? 0.0;
  bool hasSummaOrder() => _summaOrder != null;

  // "User" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "Item" field.
  List<DocumentReference>? _item;
  List<DocumentReference> get item => _item ?? const [];
  bool hasItem() => _item != null;

  // "Adress" field.
  DocumentReference? _adress;
  DocumentReference? get adress => _adress;
  bool hasAdress() => _adress != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "recipient" field.
  String? _recipient;
  String get recipient => _recipient ?? '';
  bool hasRecipient() => _recipient != null;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "txtcancelreason" field.
  String? _txtcancelreason;
  String get txtcancelreason => _txtcancelreason ?? '';
  bool hasTxtcancelreason() => _txtcancelreason != null;

  // "revivew" field.
  DocumentReference? _revivew;
  DocumentReference? get revivew => _revivew;
  bool hasRevivew() => _revivew != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "DateDD" field.
  String? _dateDD;
  String get dateDD => _dateDD ?? '';
  bool hasDateDD() => _dateDD != null;

  // "restoranName" field.
  String? _restoranName;
  String get restoranName => _restoranName ?? '';
  bool hasRestoranName() => _restoranName != null;

  // "UserEmail" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "delite" field.
  bool? _delite;
  bool get delite => _delite ?? false;
  bool hasDelite() => _delite != null;

  // "apiCallMade" field.
  bool? _apiCallMade;
  bool get apiCallMade => _apiCallMade ?? false;
  bool hasApiCallMade() => _apiCallMade != null;

  void _initializeFields() {
    _number = castToType<int>(snapshotData['Number']);
    _date = snapshotData['Date'] as DateTime?;
    _timer = snapshotData['Timer'] as DateTime?;
    _restoran = snapshotData['Restoran'] as DocumentReference?;
    _delivery = snapshotData['delivery'] as bool?;
    _deliveryaddress = snapshotData['deliveryaddress'] as String?;
    _summaOrder = castToType<double>(snapshotData['SummaOrder']);
    _user = snapshotData['User'] as DocumentReference?;
    _item = getDataList(snapshotData['Item']);
    _adress = snapshotData['Adress'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _recipient = snapshotData['recipient'] as String?;
    _phoneNumber = snapshotData['phoneNumber'] as String?;
    _txtcancelreason = snapshotData['txtcancelreason'] as String?;
    _revivew = snapshotData['revivew'] as DocumentReference?;
    _comment = snapshotData['comment'] as String?;
    _dateDD = snapshotData['DateDD'] as String?;
    _restoranName = snapshotData['restoranName'] as String?;
    _userEmail = snapshotData['UserEmail'] as String?;
    _delite = snapshotData['delite'] as bool?;
    _apiCallMade = snapshotData['apiCallMade'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Order');

  static Stream<OrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderRecord.fromSnapshot(s));

  static Future<OrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderRecord.fromSnapshot(s));

  static OrderRecord fromSnapshot(DocumentSnapshot snapshot) => OrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderRecordData({
  int? number,
  DateTime? date,
  DateTime? timer,
  DocumentReference? restoran,
  bool? delivery,
  String? deliveryaddress,
  double? summaOrder,
  DocumentReference? user,
  DocumentReference? adress,
  String? status,
  String? recipient,
  String? phoneNumber,
  String? txtcancelreason,
  DocumentReference? revivew,
  String? comment,
  String? dateDD,
  String? restoranName,
  String? userEmail,
  bool? delite,
  bool? apiCallMade,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Number': number,
      'Date': date,
      'Timer': timer,
      'Restoran': restoran,
      'delivery': delivery,
      'deliveryaddress': deliveryaddress,
      'SummaOrder': summaOrder,
      'User': user,
      'Adress': adress,
      'status': status,
      'recipient': recipient,
      'phoneNumber': phoneNumber,
      'txtcancelreason': txtcancelreason,
      'revivew': revivew,
      'comment': comment,
      'DateDD': dateDD,
      'restoranName': restoranName,
      'UserEmail': userEmail,
      'delite': delite,
      'apiCallMade': apiCallMade,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderRecordDocumentEquality implements Equality<OrderRecord> {
  const OrderRecordDocumentEquality();

  @override
  bool equals(OrderRecord? e1, OrderRecord? e2) {
    const listEquality = ListEquality();
    return e1?.number == e2?.number &&
        e1?.date == e2?.date &&
        e1?.timer == e2?.timer &&
        e1?.restoran == e2?.restoran &&
        e1?.delivery == e2?.delivery &&
        e1?.deliveryaddress == e2?.deliveryaddress &&
        e1?.summaOrder == e2?.summaOrder &&
        e1?.user == e2?.user &&
        listEquality.equals(e1?.item, e2?.item) &&
        e1?.adress == e2?.adress &&
        e1?.status == e2?.status &&
        e1?.recipient == e2?.recipient &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.txtcancelreason == e2?.txtcancelreason &&
        e1?.revivew == e2?.revivew &&
        e1?.comment == e2?.comment &&
        e1?.dateDD == e2?.dateDD &&
        e1?.restoranName == e2?.restoranName &&
        e1?.userEmail == e2?.userEmail &&
        e1?.delite == e2?.delite &&
        e1?.apiCallMade == e2?.apiCallMade;
  }

  @override
  int hash(OrderRecord? e) => const ListEquality().hash([
        e?.number,
        e?.date,
        e?.timer,
        e?.restoran,
        e?.delivery,
        e?.deliveryaddress,
        e?.summaOrder,
        e?.user,
        e?.item,
        e?.adress,
        e?.status,
        e?.recipient,
        e?.phoneNumber,
        e?.txtcancelreason,
        e?.revivew,
        e?.comment,
        e?.dateDD,
        e?.restoranName,
        e?.userEmail,
        e?.delite,
        e?.apiCallMade
      ]);

  @override
  bool isValidKey(Object? o) => o is OrderRecord;
}
