import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "ProductinCart" field.
  List<DocumentReference>? _productinCart;
  List<DocumentReference> get productinCart => _productinCart ?? const [];
  bool hasProductinCart() => _productinCart != null;

  // "YouRest" field.
  DocumentReference? _youRest;
  DocumentReference? get youRest => _youRest;
  bool hasYouRest() => _youRest != null;

  // "Favorit" field.
  List<DocumentReference>? _favorit;
  List<DocumentReference> get favorit => _favorit ?? const [];
  bool hasFavorit() => _favorit != null;

  // "FavoritTovar" field.
  List<DocumentReference>? _favoritTovar;
  List<DocumentReference> get favoritTovar => _favoritTovar ?? const [];
  bool hasFavoritTovar() => _favoritTovar != null;

  // "smsCode" field.
  int? _smsCode;
  int get smsCode => _smsCode ?? 0;
  bool hasSmsCode() => _smsCode != null;

  // "codeTrue" field.
  bool? _codeTrue;
  bool get codeTrue => _codeTrue ?? false;
  bool hasCodeTrue() => _codeTrue != null;

  // "authCode" field.
  String? _authCode;
  String get authCode => _authCode ?? '';
  bool hasAuthCode() => _authCode != null;

  // "isLoggedIn" field.
  bool? _isLoggedIn;
  bool get isLoggedIn => _isLoggedIn ?? false;
  bool hasIsLoggedIn() => _isLoggedIn != null;

  // "EmailReal" field.
  String? _emailReal;
  String get emailReal => _emailReal ?? '';
  bool hasEmailReal() => _emailReal != null;

  // "Adres" field.
  String? _adres;
  String get adres => _adres ?? '';
  bool hasAdres() => _adres != null;

  // "AdresStroke" field.
  String? _adresStroke;
  String get adresStroke => _adresStroke ?? '';
  bool hasAdresStroke() => _adresStroke != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _productinCart = getDataList(snapshotData['ProductinCart']);
    _youRest = snapshotData['YouRest'] as DocumentReference?;
    _favorit = getDataList(snapshotData['Favorit']);
    _favoritTovar = getDataList(snapshotData['FavoritTovar']);
    _smsCode = castToType<int>(snapshotData['smsCode']);
    _codeTrue = snapshotData['codeTrue'] as bool?;
    _authCode = snapshotData['authCode'] as String?;
    _isLoggedIn = snapshotData['isLoggedIn'] as bool?;
    _emailReal = snapshotData['EmailReal'] as String?;
    _adres = snapshotData['Adres'] as String?;
    _adresStroke = snapshotData['AdresStroke'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DocumentReference? youRest,
  int? smsCode,
  bool? codeTrue,
  String? authCode,
  bool? isLoggedIn,
  String? emailReal,
  String? adres,
  String? adresStroke,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'YouRest': youRest,
      'smsCode': smsCode,
      'codeTrue': codeTrue,
      'authCode': authCode,
      'isLoggedIn': isLoggedIn,
      'EmailReal': emailReal,
      'Adres': adres,
      'AdresStroke': adresStroke,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(e1?.productinCart, e2?.productinCart) &&
        e1?.youRest == e2?.youRest &&
        listEquality.equals(e1?.favorit, e2?.favorit) &&
        listEquality.equals(e1?.favoritTovar, e2?.favoritTovar) &&
        e1?.smsCode == e2?.smsCode &&
        e1?.codeTrue == e2?.codeTrue &&
        e1?.authCode == e2?.authCode &&
        e1?.isLoggedIn == e2?.isLoggedIn &&
        e1?.emailReal == e2?.emailReal &&
        e1?.adres == e2?.adres &&
        e1?.adresStroke == e2?.adresStroke;
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.productinCart,
        e?.youRest,
        e?.favorit,
        e?.favoritTovar,
        e?.smsCode,
        e?.codeTrue,
        e?.authCode,
        e?.isLoggedIn,
        e?.emailReal,
        e?.adres,
        e?.adresStroke
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
