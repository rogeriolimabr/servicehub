import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderItemsRecord extends FirestoreRecord {
  OrderItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "orderRef" field.
  DocumentReference? _orderRef;
  DocumentReference? get orderRef => _orderRef;
  bool hasOrderRef() => _orderRef != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "productRef" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  // "qty" field.
  double? _qty;
  double get qty => _qty ?? 0.0;
  bool hasQty() => _qty != null;

  // "seq" field.
  double? _seq;
  double get seq => _seq ?? 0.0;
  bool hasSeq() => _seq != null;

  // "totalValue" field.
  double? _totalValue;
  double get totalValue => _totalValue ?? 0.0;
  bool hasTotalValue() => _totalValue != null;

  // "unitValue" field.
  double? _unitValue;
  double get unitValue => _unitValue ?? 0.0;
  bool hasUnitValue() => _unitValue != null;

  void _initializeFields() {
    _orderRef = snapshotData['orderRef'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
    _productRef = snapshotData['productRef'] as DocumentReference?;
    _qty = castToType<double>(snapshotData['qty']);
    _seq = castToType<double>(snapshotData['seq']);
    _totalValue = castToType<double>(snapshotData['totalValue']);
    _unitValue = castToType<double>(snapshotData['unitValue']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order_items');

  static Stream<OrderItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderItemsRecord.fromSnapshot(s));

  static Future<OrderItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderItemsRecord.fromSnapshot(s));

  static OrderItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrderItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderItemsRecordData({
  DocumentReference? orderRef,
  String? description,
  DocumentReference? productRef,
  double? qty,
  double? seq,
  double? totalValue,
  double? unitValue,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'orderRef': orderRef,
      'description': description,
      'productRef': productRef,
      'qty': qty,
      'seq': seq,
      'totalValue': totalValue,
      'unitValue': unitValue,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderItemsRecordDocumentEquality implements Equality<OrderItemsRecord> {
  const OrderItemsRecordDocumentEquality();

  @override
  bool equals(OrderItemsRecord? e1, OrderItemsRecord? e2) {
    return e1?.orderRef == e2?.orderRef &&
        e1?.description == e2?.description &&
        e1?.productRef == e2?.productRef &&
        e1?.qty == e2?.qty &&
        e1?.seq == e2?.seq &&
        e1?.totalValue == e2?.totalValue &&
        e1?.unitValue == e2?.unitValue;
  }

  @override
  int hash(OrderItemsRecord? e) => const ListEquality().hash([
        e?.orderRef,
        e?.description,
        e?.productRef,
        e?.qty,
        e?.seq,
        e?.totalValue,
        e?.unitValue
      ]);

  @override
  bool isValidKey(Object? o) => o is OrderItemsRecord;
}
