import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PriceListItemsRecord extends FirestoreRecord {
  PriceListItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "price_listRef" field.
  DocumentReference? _priceListRef;
  DocumentReference? get priceListRef => _priceListRef;
  bool hasPriceListRef() => _priceListRef != null;

  // "productRef" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  // "price1" field.
  double? _price1;
  double get price1 => _price1 ?? 0.0;
  bool hasPrice1() => _price1 != null;

  // "price2" field.
  double? _price2;
  double get price2 => _price2 ?? 0.0;
  bool hasPrice2() => _price2 != null;

  // "price3" field.
  double? _price3;
  double get price3 => _price3 ?? 0.0;
  bool hasPrice3() => _price3 != null;

  // "erpId" field.
  String? _erpId;
  String get erpId => _erpId ?? '';
  bool hasErpId() => _erpId != null;

  // "productDescription" field.
  String? _productDescription;
  String get productDescription => _productDescription ?? '';
  bool hasProductDescription() => _productDescription != null;

  void _initializeFields() {
    _priceListRef = snapshotData['price_listRef'] as DocumentReference?;
    _productRef = snapshotData['productRef'] as DocumentReference?;
    _price1 = castToType<double>(snapshotData['price1']);
    _price2 = castToType<double>(snapshotData['price2']);
    _price3 = castToType<double>(snapshotData['price3']);
    _erpId = snapshotData['erpId'] as String?;
    _productDescription = snapshotData['productDescription'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('price_list_items');

  static Stream<PriceListItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PriceListItemsRecord.fromSnapshot(s));

  static Future<PriceListItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PriceListItemsRecord.fromSnapshot(s));

  static PriceListItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PriceListItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PriceListItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PriceListItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PriceListItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PriceListItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPriceListItemsRecordData({
  DocumentReference? priceListRef,
  DocumentReference? productRef,
  double? price1,
  double? price2,
  double? price3,
  String? erpId,
  String? productDescription,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'price_listRef': priceListRef,
      'productRef': productRef,
      'price1': price1,
      'price2': price2,
      'price3': price3,
      'erpId': erpId,
      'productDescription': productDescription,
    }.withoutNulls,
  );

  return firestoreData;
}

class PriceListItemsRecordDocumentEquality
    implements Equality<PriceListItemsRecord> {
  const PriceListItemsRecordDocumentEquality();

  @override
  bool equals(PriceListItemsRecord? e1, PriceListItemsRecord? e2) {
    return e1?.priceListRef == e2?.priceListRef &&
        e1?.productRef == e2?.productRef &&
        e1?.price1 == e2?.price1 &&
        e1?.price2 == e2?.price2 &&
        e1?.price3 == e2?.price3 &&
        e1?.erpId == e2?.erpId &&
        e1?.productDescription == e2?.productDescription;
  }

  @override
  int hash(PriceListItemsRecord? e) => const ListEquality().hash([
        e?.priceListRef,
        e?.productRef,
        e?.price1,
        e?.price2,
        e?.price3,
        e?.erpId,
        e?.productDescription
      ]);

  @override
  bool isValidKey(Object? o) => o is PriceListItemsRecord;
}
