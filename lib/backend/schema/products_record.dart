import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "erpId" field.
  String? _erpId;
  String get erpId => _erpId ?? '';
  bool hasErpId() => _erpId != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "commission" field.
  double? _commission;
  double get commission => _commission ?? 0.0;
  bool hasCommission() => _commission != null;

  // "base_price" field.
  double? _basePrice;
  double get basePrice => _basePrice ?? 0.0;
  bool hasBasePrice() => _basePrice != null;

  // "unit_of_measurement" field.
  String? _unitOfMeasurement;
  String get unitOfMeasurement => _unitOfMeasurement ?? '';
  bool hasUnitOfMeasurement() => _unitOfMeasurement != null;

  void _initializeFields() {
    _erpId = snapshotData['erpId'] as String?;
    _description = snapshotData['description'] as String?;
    _commission = castToType<double>(snapshotData['commission']);
    _basePrice = castToType<double>(snapshotData['base_price']);
    _unitOfMeasurement = snapshotData['unit_of_measurement'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  String? erpId,
  String? description,
  double? commission,
  double? basePrice,
  String? unitOfMeasurement,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'erpId': erpId,
      'description': description,
      'commission': commission,
      'base_price': basePrice,
      'unit_of_measurement': unitOfMeasurement,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    return e1?.erpId == e2?.erpId &&
        e1?.description == e2?.description &&
        e1?.commission == e2?.commission &&
        e1?.basePrice == e2?.basePrice &&
        e1?.unitOfMeasurement == e2?.unitOfMeasurement;
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.erpId,
        e?.description,
        e?.commission,
        e?.basePrice,
        e?.unitOfMeasurement
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
