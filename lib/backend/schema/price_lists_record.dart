import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PriceListsRecord extends FirestoreRecord {
  PriceListsRecord._(
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

  // "customerRef" field.
  DocumentReference? _customerRef;
  DocumentReference? get customerRef => _customerRef;
  bool hasCustomerRef() => _customerRef != null;

  void _initializeFields() {
    _erpId = snapshotData['erpId'] as String?;
    _description = snapshotData['description'] as String?;
    _customerRef = snapshotData['customerRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('price_lists');

  static Stream<PriceListsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PriceListsRecord.fromSnapshot(s));

  static Future<PriceListsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PriceListsRecord.fromSnapshot(s));

  static PriceListsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PriceListsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PriceListsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PriceListsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PriceListsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PriceListsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPriceListsRecordData({
  String? erpId,
  String? description,
  DocumentReference? customerRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'erpId': erpId,
      'description': description,
      'customerRef': customerRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class PriceListsRecordDocumentEquality implements Equality<PriceListsRecord> {
  const PriceListsRecordDocumentEquality();

  @override
  bool equals(PriceListsRecord? e1, PriceListsRecord? e2) {
    return e1?.erpId == e2?.erpId &&
        e1?.description == e2?.description &&
        e1?.customerRef == e2?.customerRef;
  }

  @override
  int hash(PriceListsRecord? e) =>
      const ListEquality().hash([e?.erpId, e?.description, e?.customerRef]);

  @override
  bool isValidKey(Object? o) => o is PriceListsRecord;
}
