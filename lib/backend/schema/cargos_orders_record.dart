import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CargosOrdersRecord extends FirestoreRecord {
  CargosOrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "erpId" field.
  String? _erpId;
  String get erpId => _erpId ?? '';
  bool hasErpId() => _erpId != null;

  // "customerRef" field.
  DocumentReference? _customerRef;
  DocumentReference? get customerRef => _customerRef;
  bool hasCustomerRef() => _customerRef != null;

  // "totalValue" field.
  double? _totalValue;
  double get totalValue => _totalValue ?? 0.0;
  bool hasTotalValue() => _totalValue != null;

  // "delivered" field.
  bool? _delivered;
  bool get delivered => _delivered ?? false;
  bool hasDelivered() => _delivered != null;

  // "cargoRef" field.
  DocumentReference? _cargoRef;
  DocumentReference? get cargoRef => _cargoRef;
  bool hasCargoRef() => _cargoRef != null;

  void _initializeFields() {
    _erpId = snapshotData['erpId'] as String?;
    _customerRef = snapshotData['customerRef'] as DocumentReference?;
    _totalValue = castToType<double>(snapshotData['totalValue']);
    _delivered = snapshotData['delivered'] as bool?;
    _cargoRef = snapshotData['cargoRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cargos_orders');

  static Stream<CargosOrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CargosOrdersRecord.fromSnapshot(s));

  static Future<CargosOrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CargosOrdersRecord.fromSnapshot(s));

  static CargosOrdersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CargosOrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CargosOrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CargosOrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CargosOrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CargosOrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCargosOrdersRecordData({
  String? erpId,
  DocumentReference? customerRef,
  double? totalValue,
  bool? delivered,
  DocumentReference? cargoRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'erpId': erpId,
      'customerRef': customerRef,
      'totalValue': totalValue,
      'delivered': delivered,
      'cargoRef': cargoRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CargosOrdersRecordDocumentEquality
    implements Equality<CargosOrdersRecord> {
  const CargosOrdersRecordDocumentEquality();

  @override
  bool equals(CargosOrdersRecord? e1, CargosOrdersRecord? e2) {
    return e1?.erpId == e2?.erpId &&
        e1?.customerRef == e2?.customerRef &&
        e1?.totalValue == e2?.totalValue &&
        e1?.delivered == e2?.delivered &&
        e1?.cargoRef == e2?.cargoRef;
  }

  @override
  int hash(CargosOrdersRecord? e) => const ListEquality().hash(
      [e?.erpId, e?.customerRef, e?.totalValue, e?.delivered, e?.cargoRef]);

  @override
  bool isValidKey(Object? o) => o is CargosOrdersRecord;
}
