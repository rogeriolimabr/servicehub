import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomersRecord extends FirestoreRecord {
  CustomersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "erpId" field.
  String? _erpId;
  String get erpId => _erpId ?? '';
  bool hasErpId() => _erpId != null;

  // "corporateName" field.
  String? _corporateName;
  String get corporateName => _corporateName ?? '';
  bool hasCorporateName() => _corporateName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "addressName" field.
  String? _addressName;
  String get addressName => _addressName ?? '';
  bool hasAddressName() => _addressName != null;

  // "neighborhood" field.
  String? _neighborhood;
  String get neighborhood => _neighborhood ?? '';
  bool hasNeighborhood() => _neighborhood != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "postalCode" field.
  String? _postalCode;
  String get postalCode => _postalCode ?? '';
  bool hasPostalCode() => _postalCode != null;

  void _initializeFields() {
    _erpId = snapshotData['erpId'] as String?;
    _corporateName = snapshotData['corporateName'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _email = snapshotData['email'] as String?;
    _addressName = snapshotData['addressName'] as String?;
    _neighborhood = snapshotData['neighborhood'] as String?;
    _city = snapshotData['city'] as String?;
    _state = snapshotData['state'] as String?;
    _postalCode = snapshotData['postalCode'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('customers');

  static Stream<CustomersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomersRecord.fromSnapshot(s));

  static Future<CustomersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CustomersRecord.fromSnapshot(s));

  static CustomersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomersRecordData({
  String? erpId,
  String? corporateName,
  String? phoneNumber,
  String? email,
  String? addressName,
  String? neighborhood,
  String? city,
  String? state,
  String? postalCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'erpId': erpId,
      'corporateName': corporateName,
      'phone_number': phoneNumber,
      'email': email,
      'addressName': addressName,
      'neighborhood': neighborhood,
      'city': city,
      'state': state,
      'postalCode': postalCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustomersRecordDocumentEquality implements Equality<CustomersRecord> {
  const CustomersRecordDocumentEquality();

  @override
  bool equals(CustomersRecord? e1, CustomersRecord? e2) {
    return e1?.erpId == e2?.erpId &&
        e1?.corporateName == e2?.corporateName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.email == e2?.email &&
        e1?.addressName == e2?.addressName &&
        e1?.neighborhood == e2?.neighborhood &&
        e1?.city == e2?.city &&
        e1?.state == e2?.state &&
        e1?.postalCode == e2?.postalCode;
  }

  @override
  int hash(CustomersRecord? e) => const ListEquality().hash([
        e?.erpId,
        e?.corporateName,
        e?.phoneNumber,
        e?.email,
        e?.addressName,
        e?.neighborhood,
        e?.city,
        e?.state,
        e?.postalCode
      ]);

  @override
  bool isValidKey(Object? o) => o is CustomersRecord;
}
