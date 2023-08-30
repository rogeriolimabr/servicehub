// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/flutter_flow/custom_functions.dart' as functions;

Future createOrderItems(
  List<int> qty,
  List<String> productRef,
  String orderRef,
  List<String> totalValue,
  List<String> unitValue,
) async {
  // Create multiple  order_items documents by arguments lists
// First, we need to check if all the lists have the same length
  if (qty.length != productRef.length ||
      qty.length != totalValue.length ||
      qty.length != unitValue.length) {
    throw Exception('All lists must have the same length');
  }

  // Then, we create a list of order_items documents
  final orderItems = <Map<String, dynamic>>[];
  for (var i = 0; i < qty.length; i++) {
    orderItems.add({
      'qty': qty[i],
      'productRef': functions.getProductReferenceById(productRef[i]),
      'orderRef': functions.getOrderRef(orderRef),
      'totalValue': double.parse(totalValue[i]),
      'unitValue': double.parse(unitValue[i]),
    });
  }

  // Finally, we save the order_items documents to the database
  final batch = FirebaseFirestore.instance.batch();
  for (final orderItem in orderItems) {
    batch.set(
      FirebaseFirestore.instance.collection('order_items').doc(),
      orderItem,
    );
  }
  await batch.commit();
}
