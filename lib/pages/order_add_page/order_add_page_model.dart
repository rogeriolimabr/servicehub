import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_order_items_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderAddPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<int> totalProducts = [];
  void addToTotalProducts(int item) => totalProducts.add(item);
  void removeFromTotalProducts(int item) => totalProducts.remove(item);
  void removeAtIndexFromTotalProducts(int index) =>
      totalProducts.removeAt(index);
  void updateTotalProductsAtIndex(int index, Function(int) updateFn) =>
      totalProducts[index] = updateFn(totalProducts[index]);

  bool showItems = false;

  double? sumTotal = 0.0;

  int loopCounter = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for customerName widget.
  String? customerNameValue;
  FormFieldController<String>? customerNameValueController;
  // State field(s) for paymentTerms widget.
  String? paymentTermsValue;
  FormFieldController<String>? paymentTermsValueController;
  // State field(s) for priceLists widget.
  String? priceListsValue;
  FormFieldController<String>? priceListsValueController;
  // Stores action output result for [Backend Call - Read Document] action in priceLists widget.
  PriceListsRecord? priceListRef;
  // Models for AddOrderItems dynamic component.
  late FlutterFlowDynamicModels<AddOrderItemsModel> addOrderItemsModels;
  // Stores action output result for [Backend Call - Create Document] action in confirmOrderBtn widget.
  OrdersRecord? orderDocument;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    addOrderItemsModels = FlutterFlowDynamicModels(() => AddOrderItemsModel());
  }

  void dispose() {
    unfocusNode.dispose();
    addOrderItemsModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
