import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
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

  // "sellerRef" field.
  DocumentReference? _sellerRef;
  DocumentReference? get sellerRef => _sellerRef;
  bool hasSellerRef() => _sellerRef != null;

  // "payment_termsRef" field.
  DocumentReference? _paymentTermsRef;
  DocumentReference? get paymentTermsRef => _paymentTermsRef;
  bool hasPaymentTermsRef() => _paymentTermsRef != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "price_listRef" field.
  DocumentReference? _priceListRef;
  DocumentReference? get priceListRef => _priceListRef;
  bool hasPriceListRef() => _priceListRef != null;

  // "totalItems" field.
  double? _totalItems;
  double get totalItems => _totalItems ?? 0.0;
  bool hasTotalItems() => _totalItems != null;

  void _initializeFields() {
    _erpId = snapshotData['erpId'] as String?;
    _customerRef = snapshotData['customerRef'] as DocumentReference?;
    _totalValue = castToType<double>(snapshotData['totalValue']);
    _sellerRef = snapshotData['sellerRef'] as DocumentReference?;
    _paymentTermsRef = snapshotData['payment_termsRef'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _priceListRef = snapshotData['price_listRef'] as DocumentReference?;
    _totalItems = castToType<double>(snapshotData['totalItems']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  String? erpId,
  DocumentReference? customerRef,
  double? totalValue,
  DocumentReference? sellerRef,
  DocumentReference? paymentTermsRef,
  DateTime? date,
  String? status,
  DocumentReference? priceListRef,
  double? totalItems,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'erpId': erpId,
      'customerRef': customerRef,
      'totalValue': totalValue,
      'sellerRef': sellerRef,
      'payment_termsRef': paymentTermsRef,
      'date': date,
      'status': status,
      'price_listRef': priceListRef,
      'totalItems': totalItems,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    return e1?.erpId == e2?.erpId &&
        e1?.customerRef == e2?.customerRef &&
        e1?.totalValue == e2?.totalValue &&
        e1?.sellerRef == e2?.sellerRef &&
        e1?.paymentTermsRef == e2?.paymentTermsRef &&
        e1?.date == e2?.date &&
        e1?.status == e2?.status &&
        e1?.priceListRef == e2?.priceListRef &&
        e1?.totalItems == e2?.totalItems;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.erpId,
        e?.customerRef,
        e?.totalValue,
        e?.sellerRef,
        e?.paymentTermsRef,
        e?.date,
        e?.status,
        e?.priceListRef,
        e?.totalItems
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
