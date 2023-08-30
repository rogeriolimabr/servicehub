import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddOrderItemsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for qty widget.
  int? qtyValue;
  // State field(s) for pricelist widget.
  String? pricelistValue;
  FormFieldController<String>? pricelistValueController;
  // Stores action output result for [Backend Call - Read Document] action in pricelist widget.
  PriceListItemsRecord? priceListItem;
  // State field(s) for vrUnit widget.
  TextEditingController? vrUnitController;
  String? Function(BuildContext, String?)? vrUnitControllerValidator;
  // State field(s) for vrTotal widget.
  TextEditingController? vrTotalController;
  String? Function(BuildContext, String?)? vrTotalControllerValidator;
  // State field(s) for product widget.
  TextEditingController? productController;
  String? Function(BuildContext, String?)? productControllerValidator;
  // State field(s) for vrTotalDouble widget.
  TextEditingController? vrTotalDoubleController;
  String? Function(BuildContext, String?)? vrTotalDoubleControllerValidator;
  // State field(s) for vrUnitDouble widget.
  TextEditingController? vrUnitDoubleController;
  String? Function(BuildContext, String?)? vrUnitDoubleControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    vrUnitController?.dispose();
    vrTotalController?.dispose();
    productController?.dispose();
    vrTotalDoubleController?.dispose();
    vrUnitDoubleController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
