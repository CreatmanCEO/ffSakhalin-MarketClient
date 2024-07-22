import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewsRecord extends FirestoreRecord {
  ReviewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "RestoranID" field.
  DocumentReference? _restoranID;
  DocumentReference? get restoranID => _restoranID;
  bool hasRestoranID() => _restoranID != null;

  // "MenuID" field.
  DocumentReference? _menuID;
  DocumentReference? get menuID => _menuID;
  bool hasMenuID() => _menuID != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "tovarName" field.
  String? _tovarName;
  String get tovarName => _tovarName ?? '';
  bool hasTovarName() => _tovarName != null;

  // "reviiewsMenu" field.
  List<DocumentReference>? _reviiewsMenu;
  List<DocumentReference> get reviiewsMenu => _reviiewsMenu ?? const [];
  bool hasReviiewsMenu() => _reviiewsMenu != null;

  // "UserName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "otvet" field.
  String? _otvet;
  String get otvet => _otvet ?? '';
  bool hasOtvet() => _otvet != null;

  // "otvetData" field.
  DateTime? _otvetData;
  DateTime? get otvetData => _otvetData;
  bool hasOtvetData() => _otvetData != null;

  // "numberOrder" field.
  int? _numberOrder;
  int get numberOrder => _numberOrder ?? 0;
  bool hasNumberOrder() => _numberOrder != null;

  // "restoranName" field.
  String? _restoranName;
  String get restoranName => _restoranName ?? '';
  bool hasRestoranName() => _restoranName != null;

  void _initializeFields() {
    _restoranID = snapshotData['RestoranID'] as DocumentReference?;
    _menuID = snapshotData['MenuID'] as DocumentReference?;
    _text = snapshotData['text'] as String?;
    _data = snapshotData['data'] as DateTime?;
    _rating = castToType<int>(snapshotData['rating']);
    _user = snapshotData['user'] as DocumentReference?;
    _tovarName = snapshotData['tovarName'] as String?;
    _reviiewsMenu = getDataList(snapshotData['reviiewsMenu']);
    _userName = snapshotData['UserName'] as String?;
    _otvet = snapshotData['otvet'] as String?;
    _otvetData = snapshotData['otvetData'] as DateTime?;
    _numberOrder = castToType<int>(snapshotData['numberOrder']);
    _restoranName = snapshotData['restoranName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reviews');

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewsRecord.fromSnapshot(s));

  static Future<ReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewsRecord.fromSnapshot(s));

  static ReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewsRecordData({
  DocumentReference? restoranID,
  DocumentReference? menuID,
  String? text,
  DateTime? data,
  int? rating,
  DocumentReference? user,
  String? tovarName,
  String? userName,
  String? otvet,
  DateTime? otvetData,
  int? numberOrder,
  String? restoranName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'RestoranID': restoranID,
      'MenuID': menuID,
      'text': text,
      'data': data,
      'rating': rating,
      'user': user,
      'tovarName': tovarName,
      'UserName': userName,
      'otvet': otvet,
      'otvetData': otvetData,
      'numberOrder': numberOrder,
      'restoranName': restoranName,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewsRecordDocumentEquality implements Equality<ReviewsRecord> {
  const ReviewsRecordDocumentEquality();

  @override
  bool equals(ReviewsRecord? e1, ReviewsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.restoranID == e2?.restoranID &&
        e1?.menuID == e2?.menuID &&
        e1?.text == e2?.text &&
        e1?.data == e2?.data &&
        e1?.rating == e2?.rating &&
        e1?.user == e2?.user &&
        e1?.tovarName == e2?.tovarName &&
        listEquality.equals(e1?.reviiewsMenu, e2?.reviiewsMenu) &&
        e1?.userName == e2?.userName &&
        e1?.otvet == e2?.otvet &&
        e1?.otvetData == e2?.otvetData &&
        e1?.numberOrder == e2?.numberOrder &&
        e1?.restoranName == e2?.restoranName;
  }

  @override
  int hash(ReviewsRecord? e) => const ListEquality().hash([
        e?.restoranID,
        e?.menuID,
        e?.text,
        e?.data,
        e?.rating,
        e?.user,
        e?.tovarName,
        e?.reviiewsMenu,
        e?.userName,
        e?.otvet,
        e?.otvetData,
        e?.numberOrder,
        e?.restoranName
      ]);

  @override
  bool isValidKey(Object? o) => o is ReviewsRecord;
}
