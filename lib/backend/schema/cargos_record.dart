import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CargosRecord extends FirestoreRecord {
  CargosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "erpId" field.
  String? _erpId;
  String get erpId => _erpId ?? '';
  bool hasErpId() => _erpId != null;

  // "dtEntry" field.
  DateTime? _dtEntry;
  DateTime? get dtEntry => _dtEntry;
  bool hasDtEntry() => _dtEntry != null;

  // "dtExit" field.
  DateTime? _dtExit;
  DateTime? get dtExit => _dtExit;
  bool hasDtExit() => _dtExit != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "driverRef" field.
  DocumentReference? _driverRef;
  DocumentReference? get driverRef => _driverRef;
  bool hasDriverRef() => _driverRef != null;

  // "keyPlate" field.
  String? _keyPlate;
  String get keyPlate => _keyPlate ?? '';
  bool hasKeyPlate() => _keyPlate != null;

  void _initializeFields() {
    _erpId = snapshotData['erpId'] as String?;
    _dtEntry = snapshotData['dtEntry'] as DateTime?;
    _dtExit = snapshotData['dtExit'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _driverRef = snapshotData['driverRef'] as DocumentReference?;
    _keyPlate = snapshotData['keyPlate'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cargos');

  static Stream<CargosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CargosRecord.fromSnapshot(s));

  static Future<CargosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CargosRecord.fromSnapshot(s));

  static CargosRecord fromSnapshot(DocumentSnapshot snapshot) => CargosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CargosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CargosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CargosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CargosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCargosRecordData({
  String? erpId,
  DateTime? dtEntry,
  DateTime? dtExit,
  String? status,
  DocumentReference? driverRef,
  String? keyPlate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'erpId': erpId,
      'dtEntry': dtEntry,
      'dtExit': dtExit,
      'status': status,
      'driverRef': driverRef,
      'keyPlate': keyPlate,
    }.withoutNulls,
  );

  return firestoreData;
}

class CargosRecordDocumentEquality implements Equality<CargosRecord> {
  const CargosRecordDocumentEquality();

  @override
  bool equals(CargosRecord? e1, CargosRecord? e2) {
    return e1?.erpId == e2?.erpId &&
        e1?.dtEntry == e2?.dtEntry &&
        e1?.dtExit == e2?.dtExit &&
        e1?.status == e2?.status &&
        e1?.driverRef == e2?.driverRef &&
        e1?.keyPlate == e2?.keyPlate;
  }

  @override
  int hash(CargosRecord? e) => const ListEquality().hash(
      [e?.erpId, e?.dtEntry, e?.dtExit, e?.status, e?.driverRef, e?.keyPlate]);

  @override
  bool isValidKey(Object? o) => o is CargosRecord;
}
