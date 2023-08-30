import '/components/sidebar_menu_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TasksPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // Model for sidebarMenu component.
  late SidebarMenuModel sidebarMenuModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sidebarMenuModel = createModel(context, () => SidebarMenuModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sidebarMenuModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
