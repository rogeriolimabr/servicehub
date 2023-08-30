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
import 'add_order_items_model.dart';
export 'add_order_items_model.dart';

class AddOrderItemsWidget extends StatefulWidget {
  const AddOrderItemsWidget({
    Key? key,
    required this.priceListRef,
  }) : super(key: key);

  final DocumentReference? priceListRef;

  @override
  _AddOrderItemsWidgetState createState() => _AddOrderItemsWidgetState();
}

class _AddOrderItemsWidgetState extends State<AddOrderItemsWidget> {
  late AddOrderItemsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddOrderItemsModel());

    _model.vrUnitController ??= TextEditingController(
        text: formatNumber(
      0,
      formatType: FormatType.decimal,
      decimalType: DecimalType.commaDecimal,
      currency: 'R\$ ',
    ));
    _model.vrTotalController ??= TextEditingController();
    _model.productController ??= TextEditingController();
    _model.vrTotalDoubleController ??= TextEditingController();
    _model.vrUnitDoubleController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 0.2,
          height: 50.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(2.0),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryBackground,
              width: 0.0,
            ),
          ),
          child: FlutterFlowCountController(
            decrementIconBuilder: (enabled) => FaIcon(
              FontAwesomeIcons.minus,
              color: enabled
                  ? FlutterFlowTheme.of(context).primaryText
                  : FlutterFlowTheme.of(context).alternate,
              size: 10.0,
            ),
            incrementIconBuilder: (enabled) => FaIcon(
              FontAwesomeIcons.plus,
              color: enabled
                  ? FlutterFlowTheme.of(context).primaryText
                  : FlutterFlowTheme.of(context).alternate,
              size: 10.0,
            ),
            countBuilder: (count) => Text(
              count.toString(),
              style: FlutterFlowTheme.of(context).labelMedium,
            ),
            count: _model.qtyValue ??= 1,
            updateCount: (count) async {
              setState(() => _model.qtyValue = count);
              if (_model.pricelistValue != null &&
                  _model.pricelistValue != '') {
                setState(() {
                  _model.vrTotalController?.text = formatNumber(
                    _model.qtyValue! * _model.priceListItem!.price1,
                    formatType: FormatType.decimal,
                    decimalType: DecimalType.commaDecimal,
                    currency: 'R\$ ',
                  );
                });
                setState(() {
                  _model.vrTotalDoubleController?.text =
                      (_model.qtyValue! * _model.priceListItem!.price1)
                          .toString();
                });
                return;
              } else {
                return;
              }
            },
            stepSize: 1,
            contentPadding:
                EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
            child: FutureBuilder<List<PriceListItemsRecord>>(
              future: queryPriceListItemsRecordOnce(
                queryBuilder: (priceListItemsRecord) => priceListItemsRecord
                    .where('price_listRef', isEqualTo: widget.priceListRef),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: SpinKitFadingFour(
                        color: FlutterFlowTheme.of(context).primary,
                        size: 20.0,
                      ),
                    ),
                  );
                }
                List<PriceListItemsRecord> pricelistPriceListItemsRecordList =
                    snapshot.data!;
                return FlutterFlowDropDown<String>(
                  controller: _model.pricelistValueController ??=
                      FormFieldController<String>(
                    _model.pricelistValue ??= '',
                  ),
                  options: pricelistPriceListItemsRecordList
                      .map((e) => e.reference.id)
                      .toList(),
                  optionLabels: pricelistPriceListItemsRecordList
                      .map((e) => e.productDescription)
                      .toList(),
                  onChanged: (val) async {
                    setState(() => _model.pricelistValue = val);
                    var _shouldSetState = false;
                    if (_model.pricelistValue != null &&
                        _model.pricelistValue != '') {
                      _model.priceListItem =
                          await PriceListItemsRecord.getDocumentOnce(
                              functions.getPriceListItemReferenceById(
                                  _model.pricelistValue!));
                      _shouldSetState = true;
                      setState(() {
                        _model.productController?.text =
                            _model.priceListItem!.productRef!.id;
                      });
                      setState(() {
                        _model.vrUnitController?.text = formatNumber(
                          _model.priceListItem!.price1,
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.commaDecimal,
                          currency: 'R\$ ',
                        );
                      });
                      setState(() {
                        _model.vrUnitDoubleController?.text =
                            valueOrDefault<String>(
                          _model.priceListItem?.price1?.toString(),
                          '0',
                        );
                      });
                      setState(() {
                        _model.vrTotalController?.text = formatNumber(
                          _model.qtyValue! * _model.priceListItem!.price1,
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.commaDecimal,
                          currency: 'R\$ ',
                        );
                      });
                      setState(() {
                        _model.vrTotalDoubleController?.text =
                            (_model.qtyValue! * _model.priceListItem!.price1)
                                .toString();
                      });
                      if (_shouldSetState) setState(() {});
                      return;
                    } else {
                      if (_shouldSetState) setState(() {});
                      return;
                    }

                    if (_shouldSetState) setState(() {});
                  },
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  height: 50.0,
                  searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 16.0,
                      ),
                  hintText: 'Produtos',
                  searchHintText: 'Procure pela descrição',
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  elevation: 0.0,
                  borderColor: FlutterFlowTheme.of(context).primaryBackground,
                  borderWidth: 0.0,
                  borderRadius: 2.0,
                  margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                  hidesUnderline: true,
                  isSearchable: true,
                  isMultiSelect: false,
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.15,
              child: TextFormField(
                controller: _model.vrUnitController,
                readOnly: true,
                obscureText: false,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Valor Unitário',
                  labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 14.0,
                        letterSpacing: 1.0,
                      ),
                  hintText: 'R\$ 0',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 16.0,
                    ),
                textAlign: TextAlign.end,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator:
                    _model.vrUnitControllerValidator.asValidator(context),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.15,
              child: TextFormField(
                controller: _model.vrTotalController,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.vrTotalController',
                  Duration(milliseconds: 200),
                  () => setState(() {}),
                ),
                autofocus: true,
                readOnly: true,
                obscureText: false,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Valor Total',
                  labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 14.0,
                        letterSpacing: 1.0,
                      ),
                  hintText: 'R\$ 0',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 16.0,
                    ),
                textAlign: TextAlign.end,
                validator:
                    _model.vrTotalControllerValidator.asValidator(context),
              ),
            ),
          ),
        ),
        if (false)
          Expanded(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.0,
              child: TextFormField(
                controller: _model.productController,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.productController',
                  Duration(milliseconds: 200),
                  () => setState(() {}),
                ),
                autofocus: true,
                readOnly: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 14.0,
                        letterSpacing: 1.0,
                      ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 16.0,
                    ),
                textAlign: TextAlign.end,
                validator:
                    _model.productControllerValidator.asValidator(context),
              ),
            ),
          ),
        if (false)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
            child: Container(
              width: 1.0,
              child: TextFormField(
                controller: _model.vrTotalDoubleController,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.vrTotalDoubleController',
                  Duration(milliseconds: 200),
                  () => setState(() {}),
                ),
                readOnly: true,
                obscureText: false,
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 16.0,
                    ),
                textAlign: TextAlign.end,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: _model.vrTotalDoubleControllerValidator
                    .asValidator(context),
              ),
            ),
          ),
        if (false)
          Expanded(
            child: Container(
              width: 1.0,
              child: TextFormField(
                controller: _model.vrUnitDoubleController,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.vrUnitDoubleController',
                  Duration(milliseconds: 200),
                  () => setState(() {}),
                ),
                readOnly: true,
                obscureText: false,
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 16.0,
                    ),
                textAlign: TextAlign.end,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator:
                    _model.vrUnitDoubleControllerValidator.asValidator(context),
              ),
            ),
          ),
      ],
    );
  }
}
