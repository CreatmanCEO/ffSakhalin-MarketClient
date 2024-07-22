import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RestoranRecord extends FirestoreRecord {
  RestoranRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "imageCart" field.
  List<String>? _imageCart;
  List<String> get imageCart => _imageCart ?? const [];
  bool hasImageCart() => _imageCart != null;

  // "AdminName" field.
  String? _adminName;
  String get adminName => _adminName ?? '';
  bool hasAdminName() => _adminName != null;

  // "nameOrg" field.
  String? _nameOrg;
  String get nameOrg => _nameOrg ?? '';
  bool hasNameOrg() => _nameOrg != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phone" field.
  int? _phone;
  int get phone => _phone ?? 0;
  bool hasPhone() => _phone != null;

  // "ogrnip" field.
  int? _ogrnip;
  int get ogrnip => _ogrnip ?? 0;
  bool hasOgrnip() => _ogrnip != null;

  // "minDiskription" field.
  String? _minDiskription;
  String get minDiskription => _minDiskription ?? '';
  bool hasMinDiskription() => _minDiskription != null;

  // "minSumDelivery" field.
  int? _minSumDelivery;
  int get minSumDelivery => _minSumDelivery ?? 0;
  bool hasMinSumDelivery() => _minSumDelivery != null;

  // "courier" field.
  bool? _courier;
  bool get courier => _courier ?? false;
  bool hasCourier() => _courier != null;

  // "pickup" field.
  bool? _pickup;
  bool get pickup => _pickup ?? false;
  bool hasPickup() => _pickup != null;

  // "cartPay" field.
  bool? _cartPay;
  bool get cartPay => _cartPay ?? false;
  bool hasCartPay() => _cartPay != null;

  // "cash" field.
  bool? _cash;
  bool get cash => _cash ?? false;
  bool hasCash() => _cash != null;

  // "qrCode" field.
  bool? _qrCode;
  bool get qrCode => _qrCode ?? false;
  bool hasQrCode() => _qrCode != null;

  // "Adress" field.
  String? _adress;
  String get adress => _adress ?? '';
  bool hasAdress() => _adress != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "EmailAdmin" field.
  String? _emailAdmin;
  String get emailAdmin => _emailAdmin ?? '';
  bool hasEmailAdmin() => _emailAdmin != null;

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

  // "kategoryKitchen" field.
  List<String>? _kategoryKitchen;
  List<String> get kategoryKitchen => _kategoryKitchen ?? const [];
  bool hasKategoryKitchen() => _kategoryKitchen != null;

  // "delite" field.
  bool? _delite;
  bool get delite => _delite ?? false;
  bool hasDelite() => _delite != null;

  // "visible" field.
  bool? _visible;
  bool get visible => _visible ?? false;
  bool hasVisible() => _visible != null;

  // "PhoneOrg" field.
  String? _phoneOrg;
  String get phoneOrg => _phoneOrg ?? '';
  bool hasPhoneOrg() => _phoneOrg != null;

  // "OpeningHours" field.
  String? _openingHours;
  String get openingHours => _openingHours ?? '';
  bool hasOpeningHours() => _openingHours != null;

  // "StatusTXT" field.
  String? _statusTXT;
  String get statusTXT => _statusTXT ?? '';
  bool hasStatusTXT() => _statusTXT != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "City" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "payvariable" field.
  List<String>? _payvariable;
  List<String> get payvariable => _payvariable ?? const [];
  bool hasPayvariable() => _payvariable != null;

  // "reviews" field.
  List<DocumentReference>? _reviews;
  List<DocumentReference> get reviews => _reviews ?? const [];
  bool hasReviews() => _reviews != null;

  // "summaRating" field.
  List<int>? _summaRating;
  List<int> get summaRating => _summaRating ?? const [];
  bool hasSummaRating() => _summaRating != null;

  // "categoryMenu" field.
  List<String>? _categoryMenu;
  List<String> get categoryMenu => _categoryMenu ?? const [];
  bool hasCategoryMenu() => _categoryMenu != null;

  // "timeStart" field.
  DateTime? _timeStart;
  DateTime? get timeStart => _timeStart;
  bool hasTimeStart() => _timeStart != null;

  // "timeEnd" field.
  DateTime? _timeEnd;
  DateTime? get timeEnd => _timeEnd;
  bool hasTimeEnd() => _timeEnd != null;

  // "aroundTheClock" field.
  bool? _aroundTheClock;
  bool get aroundTheClock => _aroundTheClock ?? false;
  bool hasAroundTheClock() => _aroundTheClock != null;

  // "positionMenuRef" field.
  List<DocumentReference>? _positionMenuRef;
  List<DocumentReference> get positionMenuRef => _positionMenuRef ?? const [];
  bool hasPositionMenuRef() => _positionMenuRef != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _logo = snapshotData['logo'] as String?;
    _imageCart = getDataList(snapshotData['imageCart']);
    _adminName = snapshotData['AdminName'] as String?;
    _nameOrg = snapshotData['nameOrg'] as String?;
    _email = snapshotData['email'] as String?;
    _phone = castToType<int>(snapshotData['phone']);
    _ogrnip = castToType<int>(snapshotData['ogrnip']);
    _minDiskription = snapshotData['minDiskription'] as String?;
    _minSumDelivery = castToType<int>(snapshotData['minSumDelivery']);
    _courier = snapshotData['courier'] as bool?;
    _pickup = snapshotData['pickup'] as bool?;
    _cartPay = snapshotData['cartPay'] as bool?;
    _cash = snapshotData['cash'] as bool?;
    _qrCode = snapshotData['qrCode'] as bool?;
    _adress = snapshotData['Adress'] as String?;
    _status = snapshotData['status'] as bool?;
    _emailAdmin = snapshotData['EmailAdmin'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _kategoryKitchen = getDataList(snapshotData['kategoryKitchen']);
    _delite = snapshotData['delite'] as bool?;
    _visible = snapshotData['visible'] as bool?;
    _phoneOrg = snapshotData['PhoneOrg'] as String?;
    _openingHours = snapshotData['OpeningHours'] as String?;
    _statusTXT = snapshotData['StatusTXT'] as String?;
    _rating = castToType<double>(snapshotData['rating']);
    _city = snapshotData['City'] as String?;
    _payvariable = getDataList(snapshotData['payvariable']);
    _reviews = getDataList(snapshotData['reviews']);
    _summaRating = getDataList(snapshotData['summaRating']);
    _categoryMenu = getDataList(snapshotData['categoryMenu']);
    _timeStart = snapshotData['timeStart'] as DateTime?;
    _timeEnd = snapshotData['timeEnd'] as DateTime?;
    _aroundTheClock = snapshotData['aroundTheClock'] as bool?;
    _positionMenuRef = getDataList(snapshotData['positionMenuRef']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('restoran');

  static Stream<RestoranRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RestoranRecord.fromSnapshot(s));

  static Future<RestoranRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RestoranRecord.fromSnapshot(s));

  static RestoranRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RestoranRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RestoranRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RestoranRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RestoranRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RestoranRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRestoranRecordData({
  String? name,
  String? logo,
  String? adminName,
  String? nameOrg,
  String? email,
  int? phone,
  int? ogrnip,
  String? minDiskription,
  int? minSumDelivery,
  bool? courier,
  bool? pickup,
  bool? cartPay,
  bool? cash,
  bool? qrCode,
  String? adress,
  bool? status,
  String? emailAdmin,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  bool? delite,
  bool? visible,
  String? phoneOrg,
  String? openingHours,
  String? statusTXT,
  double? rating,
  String? city,
  DateTime? timeStart,
  DateTime? timeEnd,
  bool? aroundTheClock,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'logo': logo,
      'AdminName': adminName,
      'nameOrg': nameOrg,
      'email': email,
      'phone': phone,
      'ogrnip': ogrnip,
      'minDiskription': minDiskription,
      'minSumDelivery': minSumDelivery,
      'courier': courier,
      'pickup': pickup,
      'cartPay': cartPay,
      'cash': cash,
      'qrCode': qrCode,
      'Adress': adress,
      'status': status,
      'EmailAdmin': emailAdmin,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'delite': delite,
      'visible': visible,
      'PhoneOrg': phoneOrg,
      'OpeningHours': openingHours,
      'StatusTXT': statusTXT,
      'rating': rating,
      'City': city,
      'timeStart': timeStart,
      'timeEnd': timeEnd,
      'aroundTheClock': aroundTheClock,
    }.withoutNulls,
  );

  return firestoreData;
}

class RestoranRecordDocumentEquality implements Equality<RestoranRecord> {
  const RestoranRecordDocumentEquality();

  @override
  bool equals(RestoranRecord? e1, RestoranRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.logo == e2?.logo &&
        listEquality.equals(e1?.imageCart, e2?.imageCart) &&
        e1?.adminName == e2?.adminName &&
        e1?.nameOrg == e2?.nameOrg &&
        e1?.email == e2?.email &&
        e1?.phone == e2?.phone &&
        e1?.ogrnip == e2?.ogrnip &&
        e1?.minDiskription == e2?.minDiskription &&
        e1?.minSumDelivery == e2?.minSumDelivery &&
        e1?.courier == e2?.courier &&
        e1?.pickup == e2?.pickup &&
        e1?.cartPay == e2?.cartPay &&
        e1?.cash == e2?.cash &&
        e1?.qrCode == e2?.qrCode &&
        e1?.adress == e2?.adress &&
        e1?.status == e2?.status &&
        e1?.emailAdmin == e2?.emailAdmin &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.kategoryKitchen, e2?.kategoryKitchen) &&
        e1?.delite == e2?.delite &&
        e1?.visible == e2?.visible &&
        e1?.phoneOrg == e2?.phoneOrg &&
        e1?.openingHours == e2?.openingHours &&
        e1?.statusTXT == e2?.statusTXT &&
        e1?.rating == e2?.rating &&
        e1?.city == e2?.city &&
        listEquality.equals(e1?.payvariable, e2?.payvariable) &&
        listEquality.equals(e1?.reviews, e2?.reviews) &&
        listEquality.equals(e1?.summaRating, e2?.summaRating) &&
        listEquality.equals(e1?.categoryMenu, e2?.categoryMenu) &&
        e1?.timeStart == e2?.timeStart &&
        e1?.timeEnd == e2?.timeEnd &&
        e1?.aroundTheClock == e2?.aroundTheClock &&
        listEquality.equals(e1?.positionMenuRef, e2?.positionMenuRef);
  }

  @override
  int hash(RestoranRecord? e) => const ListEquality().hash([
        e?.name,
        e?.logo,
        e?.imageCart,
        e?.adminName,
        e?.nameOrg,
        e?.email,
        e?.phone,
        e?.ogrnip,
        e?.minDiskription,
        e?.minSumDelivery,
        e?.courier,
        e?.pickup,
        e?.cartPay,
        e?.cash,
        e?.qrCode,
        e?.adress,
        e?.status,
        e?.emailAdmin,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.kategoryKitchen,
        e?.delite,
        e?.visible,
        e?.phoneOrg,
        e?.openingHours,
        e?.statusTXT,
        e?.rating,
        e?.city,
        e?.payvariable,
        e?.reviews,
        e?.summaRating,
        e?.categoryMenu,
        e?.timeStart,
        e?.timeEnd,
        e?.aroundTheClock,
        e?.positionMenuRef
      ]);

  @override
  bool isValidKey(Object? o) => o is RestoranRecord;
}
