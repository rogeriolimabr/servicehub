import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String> getRoles() {
  // Crie uma função que retorne uma lista de cargos: Vendedor, Motorista, Porteiro, Operador
  List<String> cargos = ['Vendedor', 'Motorista', 'Porteiro', 'Operador'];
  return cargos;
}

DateTime? getDateTime() {
  // Retornar Data e Hora atual formato Timestamp do Firestore
  DateTime now = DateTime.now();
  Timestamp timestamp = Timestamp.fromDate(now);
  return timestamp.toDate();
}

String? getOrderStatus(String? status) {
  // Substitua N, P, A e R para Novo, Pendente, Aprovado e Rejeitado
  switch (status) {
    case 'N':
      return 'Novo';
    case 'P':
      return 'Pendente';
    case 'A':
      return 'Aprovado';
    case 'R':
      return 'Rejeitado';
    default:
      return null;
  }
}

List<DocumentReference>? getPriceListsByCustomerRef(String? customerId) {
  // Refaça o código
// Get Price Lists by Customer Reference
// Get all price lists that belong to a customer by customerRef
  if (customerId == null) {
    return null;
  } else {
    List<DocumentReference> priceLists = [];
    FirebaseFirestore.instance
        .collection('price_lists')
        .where('customerRef', isEqualTo: getCustomerRef(customerId))
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        priceLists.add(doc.reference);
      });
    });
    return priceLists;
  }
}

DocumentReference? getCustomerRef(String? customerId) {
  // Get Customer Ref by Customer ID
// Get customerRef document by customerId
  if (customerId == null) {
    return null;
  } else {
    return FirebaseFirestore.instance.collection('customers').doc(customerId);
  }
}

DocumentReference? getPaymentTermsById(String? paymentTermsId) {
  // Get Payment Terms by Id
// Get Payment Terms document by paymentTermsId
  if (paymentTermsId == null) {
    return null;
  } else {
    return FirebaseFirestore.instance
        .collection('payment_terms')
        .doc(paymentTermsId);
  }
}

DocumentReference? getPriceListById(String? pricelistId) {
  // Get Price List Reference by Id
// Get Price List document by pricelistId
  if (pricelistId == null) {
    return null;
  } else {
    return FirebaseFirestore.instance
        .collection('price_lists')
        .doc(pricelistId);
  }
}

DocumentReference? getUserByReferenceId(String? userId) {
  // Get User Reference by User ID
// Get User Reference by User ID
// Get user document by userid
  if (userId == null) {
    return null;
  } else {
    return FirebaseFirestore.instance.collection('users').doc(userId);
  }
}

String? getLoadStatus(String status) {
  // Get Load Status N = Novo, S = Saida, R = Retorno
  switch (status) {
    case 'n':
      return 'Novo';
    case 's':
      return 'Saida';
    case 'r':
      return 'Retorno';
    default:
      return null;
  }
}

double? getPrice1(String productId) {
  // Get price1 field on Product by ID
// Assuming that the product data is stored in a Firestore collection called "products"
// and each document has a "price1" field

  double? price1;

  FirebaseFirestore.instance
      .collection('products')
      .doc(productId)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      price1 = data['price1'];
    } else {
      print('Product with ID $productId does not exist');
    }
  }).catchError((error) {
    print('Error getting product with ID $productId: $error');
  });

  return price1;
}

String? getProductNameByProductId(String productId) {
  // Get Description on products collection by Product Id
  String? productName;
  FirebaseFirestore.instance
      .collection('products')
      .doc(productId)
      .get()
      .then((doc) {
    if (doc.exists) {
      productName = doc.data()!['description'];
    }
  });
  return productName;
}

DocumentReference? getProductReferenceById(String productId) {
  // Get Product Reference by Product Id
  return FirebaseFirestore.instance.collection('products').doc(productId);
}

DocumentReference getPriceListItemReferenceById(String pricelistitemId) {
  // get Price List Item Reference By Id
  return FirebaseFirestore.instance
      .collection('price_list_items')
      .doc(pricelistitemId);
}

double? sumAllValues(List<String>? vrTotal) {
  // Sum All Values vrTotal, parse to double and return sum
  if (vrTotal == null || vrTotal.isEmpty) {
    return null;
  }
  double sum = 0.0;
  for (String value in vrTotal) {
    sum += double.tryParse(value) ?? 0.0;
  }
  return sum;
}

int? sumQtyItems(List<int>? qty) {
  // Sum All Qty of Component and return sum
  if (qty == null || qty.isEmpty) {
    return 0;
  }
  int sum = 0;
  for (int i = 0; i < qty.length; i++) {
    sum += qty[i];
  }
  return sum;
}

DocumentReference getOrderRef(String orderId) {
  // Get Order Reference by Id
  return FirebaseFirestore.instance.collection('orders').doc(orderId);
}
