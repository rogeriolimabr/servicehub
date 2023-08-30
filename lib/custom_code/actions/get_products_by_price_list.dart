// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<ProductsRecord>?> getProductsByPriceList(
    DocumentReference priceListRef) async {
  final priceListItemsQuery = FirebaseFirestore.instance
      .collection('price_list_items')
      .where('price_listRef', isEqualTo: priceListRef);

  final priceListItemsSnapshot = await priceListItemsQuery.get();
  final productRefs = priceListItemsSnapshot.docs
      .map((doc) => doc.data()['productRef'])
      .toList();

  final productsList = <ProductsRecord>[];

  for (DocumentReference productRef in productRefs) {
    final productSnapshot = await productRef.get();
    if (productSnapshot.exists) {
      productsList.add(ProductsRecord.fromSnapshot(productSnapshot));
    }
  }

  if (productsList.isEmpty) {
    return null;
  }

  return productsList;
}
