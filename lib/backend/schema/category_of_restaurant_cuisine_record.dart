import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryOfRestaurantCuisineRecord extends FirestoreRecord {
  CategoryOfRestaurantCuisineRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "StatusTXT" field.
  String? _statusTXT;
  String get statusTXT => _statusTXT ?? '';
  bool hasStatusTXT() => _statusTXT != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "Cover" field.
  String? _cover;
  String get cover => _cover ?? '';
  bool hasCover() => _cover != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _status = snapshotData['status'] as bool?;
    _statusTXT = snapshotData['StatusTXT'] as String?;
    _rating = castToType<int>(snapshotData['rating']);
    _cover = snapshotData['Cover'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Category_of_restaurant_cuisine');

  static Stream<CategoryOfRestaurantCuisineRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => CategoryOfRestaurantCuisineRecord.fromSnapshot(s));

  static Future<CategoryOfRestaurantCuisineRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CategoryOfRestaurantCuisineRecord.fromSnapshot(s));

  static CategoryOfRestaurantCuisineRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      CategoryOfRestaurantCuisineRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoryOfRestaurantCuisineRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoryOfRestaurantCuisineRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoryOfRestaurantCuisineRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoryOfRestaurantCuisineRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoryOfRestaurantCuisineRecordData({
  String? name,
  bool? status,
  String? statusTXT,
  int? rating,
  String? cover,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'status': status,
      'StatusTXT': statusTXT,
      'rating': rating,
      'Cover': cover,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoryOfRestaurantCuisineRecordDocumentEquality
    implements Equality<CategoryOfRestaurantCuisineRecord> {
  const CategoryOfRestaurantCuisineRecordDocumentEquality();

  @override
  bool equals(CategoryOfRestaurantCuisineRecord? e1,
      CategoryOfRestaurantCuisineRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.status == e2?.status &&
        e1?.statusTXT == e2?.statusTXT &&
        e1?.rating == e2?.rating &&
        e1?.cover == e2?.cover;
  }

  @override
  int hash(CategoryOfRestaurantCuisineRecord? e) => const ListEquality()
      .hash([e?.name, e?.status, e?.statusTXT, e?.rating, e?.cover]);

  @override
  bool isValidKey(Object? o) => o is CategoryOfRestaurantCuisineRecord;
}
