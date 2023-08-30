import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentTermsRecord extends FirestoreRecord {
  PaymentTermsRecord._(
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

  void _initializeFields() {
    _erpId = snapshotData['erpId'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('payment_terms');

  static Stream<PaymentTermsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentTermsRecord.fromSnapshot(s));

  static Future<PaymentTermsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentTermsRecord.fromSnapshot(s));

  static PaymentTermsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentTermsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentTermsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentTermsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentTermsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentTermsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentTermsRecordData({
  String? erpId,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'erpId': erpId,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentTermsRecordDocumentEquality
    implements Equality<PaymentTermsRecord> {
  const PaymentTermsRecordDocumentEquality();

  @override
  bool equals(PaymentTermsRecord? e1, PaymentTermsRecord? e2) {
    return e1?.erpId == e2?.erpId && e1?.description == e2?.description;
  }

  @override
  int hash(PaymentTermsRecord? e) =>
      const ListEquality().hash([e?.erpId, e?.description]);

  @override
  bool isValidKey(Object? o) => o is PaymentTermsRecord;
}
