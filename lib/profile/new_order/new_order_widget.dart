import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/main/info_closed/info_closed_widget.dart';
import '/profile/add_address/add_address_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'new_order_model.dart';
export 'new_order_model.dart';

class NewOrderWidget extends StatefulWidget {
  const NewOrderWidget({
    super.key,
    required this.currentCurtItem,
    required this.restoran,
  });

  final List<CartItemsRecord>? currentCurtItem;
  final RestoranRecord? restoran;

  @override
  State<NewOrderWidget> createState() => _NewOrderWidgetState();
}

class _NewOrderWidgetState extends State<NewOrderWidget> {
  late NewOrderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewOrderModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().numListItems = widget!.currentCurtItem!.length;
      safeSetState(() {});
    });

    _model.textFieldNameMTextController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.textFieldNameMFocusNode ??= FocusNode();

    _model.textFieldPhoneMTextController ??=
        TextEditingController(text: currentPhoneNumber);
    _model.textFieldPhoneMFocusNode ??= FocusNode();

    _model.textFieldcommentTextController ??= TextEditingController();
    _model.textFieldcommentFocusNode ??= FocusNode();

    _model.textFieldNameTextController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.textFieldNameFocusNode ??= FocusNode();

    _model.textFieldPhoneTextController ??=
        TextEditingController(text: currentPhoneNumber);
    _model.textFieldPhoneFocusNode ??= FocusNode();

    _model.textFieldkomentVEBTextController ??= TextEditingController();
    _model.textFieldkomentVEBFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: StreamBuilder<List<AdressUserRecord>>(
                stream: queryAdressUserRecord(
                  queryBuilder: (adressUserRecord) => adressUserRecord
                      .where(
                        'User',
                        isEqualTo: currentUserReference,
                      )
                      .where(
                        'name',
                        isEqualTo: _model.dropDownAdresMValue,
                      ),
                  singleRecord: true,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 60.0,
                        height: 60.0,
                        child: SpinKitPulse(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 60.0,
                        ),
                      ),
                    );
                  }
                  List<AdressUserRecord> containerAdressUserRecordList =
                      snapshot.data!;
                  final containerAdressUserRecord =
                      containerAdressUserRecordList.isNotEmpty
                          ? containerAdressUserRecordList.first
                          : null;

                  return Container(
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: 1440.0,
                            ),
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 25.0, 0.0, 0.0),
                                    child: Stack(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderRadius: 15.0,
                                                  borderWidth: 2.0,
                                                  buttonSize: 40.0,
                                                  fillColor: Color(0x7EF1F4F8),
                                                  icon: Icon(
                                                    Icons.arrow_back_ios_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 25.0,
                                                  ),
                                                  onPressed: () async {
                                                    context.safePop();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'Ваш заказ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (responsiveVisibility(
                                  context: context,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 8.0, 8.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          widget!
                                                              .restoran!.logo,
                                                          width: 74.0,
                                                          height: 74.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    4.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  widget!
                                                                      .restoran!
                                                                      .name,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      '${widget!.currentCurtItem?.length?.toString()} Товаров',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'на сумму:',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Montserrat',
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      formatNumber(
                                                                        FFAppState()
                                                                            .SummOrder,
                                                                        formatType:
                                                                            FormatType.custom,
                                                                        format:
                                                                            '0',
                                                                        locale:
                                                                            '',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                19.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      ' ₽',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                18.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 24.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 8.0, 16.0, 12.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 8.0, 8.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Form(
                                                        key: _model.formKey2,
                                                        autovalidateMode:
                                                            AutovalidateMode
                                                                .disabled,
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          controller: _model
                                                                  .dropDownTypeMValueController ??=
                                                              FormFieldController<
                                                                  String>(null),
                                                          options: [
                                                            'Самовывоз',
                                                            'Доставка'
                                                          ],
                                                          onChanged:
                                                              (val) async {
                                                            safeSetState(() =>
                                                                _model.dropDownTypeMValue =
                                                                    val);
                                                            safeSetState(() {
                                                              _model
                                                                  .dropDownAdresMValueController
                                                                  ?.reset();
                                                            });
                                                          },
                                                          width: 300.0,
                                                          height: 50.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                          hintText:
                                                              'Тип заказа',
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 28.0,
                                                          ),
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          elevation: 2.0,
                                                          borderColor:
                                                              Color(0xFFD3D1D8),
                                                          borderWidth: 1.0,
                                                          borderRadius: 10.0,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      1.0,
                                                                      16.0,
                                                                      0.0),
                                                          hidesUnderline: true,
                                                          isOverButton: true,
                                                          isSearchable: false,
                                                          isMultiSelect: false,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (_model.dropDownTypeMValue ==
                                                  'Самовывоз')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 8.0, 16.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          widget!
                                                              .restoran!.adress,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              if (_model.dropDownTypeMValue ==
                                                  'Доставка')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 8.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Flexible(
                                                              child: Form(
                                                                key: _model
                                                                    .formKey4,
                                                                autovalidateMode:
                                                                    AutovalidateMode
                                                                        .disabled,
                                                                child: StreamBuilder<
                                                                    List<
                                                                        AdressUserRecord>>(
                                                                  stream:
                                                                      queryAdressUserRecord(
                                                                    queryBuilder:
                                                                        (adressUserRecord) =>
                                                                            adressUserRecord.where(
                                                                      'User',
                                                                      isEqualTo:
                                                                          currentUserReference,
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              60.0,
                                                                          height:
                                                                              60.0,
                                                                          child:
                                                                              SpinKitPulse(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                60.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<AdressUserRecord>
                                                                        containerAdressUserRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              if (containerAdressUserRecordList.isNotEmpty)
                                                                                AuthUserStreamWidget(
                                                                                  builder: (context) => FlutterFlowDropDown<String>(
                                                                                    controller: _model.dropDownAdresMValueController ??= FormFieldController<String>(
                                                                                      _model.dropDownAdresMValue ??= valueOrDefault(currentUserDocument?.adres, '') != null && valueOrDefault(currentUserDocument?.adres, '') != '' ? valueOrDefault(currentUserDocument?.adres, '') : containerAdressUserRecordList.first.name,
                                                                                    ),
                                                                                    options: containerAdressUserRecordList.map((e) => e.name).toList(),
                                                                                    onChanged: (val) async {
                                                                                      safeSetState(() => _model.dropDownAdresMValue = val);
                                                                                      _model.adresName = _model.dropDownAdresMValue;
                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    width: 300.0,
                                                                                    height: 56.0,
                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    hintText: 'Please select...',
                                                                                    icon: Icon(
                                                                                      Icons.keyboard_arrow_down_rounded,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    elevation: 2.0,
                                                                                    borderColor: Color(0xFFD3D1D8),
                                                                                    borderWidth: 1.0,
                                                                                    borderRadius: 8.0,
                                                                                    margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                    hidesUnderline: true,
                                                                                    isOverButton: true,
                                                                                    isSearchable: false,
                                                                                    isMultiSelect: false,
                                                                                  ),
                                                                                ),
                                                                              FlutterFlowIconButton(
                                                                                borderRadius: 20.0,
                                                                                borderWidth: 1.0,
                                                                                buttonSize: 40.0,
                                                                                icon: Icon(
                                                                                  Icons.add,
                                                                                  size: 24.0,
                                                                                ),
                                                                                onPressed: () async {
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return GestureDetector(
                                                                                        onTap: () => FocusScope.of(context).unfocus(),
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                          child: AddAddressWidget(),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => safeSetState(() {}));
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          if (containerAdressUserRecordList
                                                                              .isNotEmpty)
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                              child: AuthUserStreamWidget(
                                                                                builder: (context) => Text(
                                                                                  valueOrDefault<String>(
                                                                                    _model.adresName == null || _model.adresName == '' ? valueOrDefault(currentUserDocument?.adresStroke, '') : containerAdressUserRecord?.adressStrok,
                                                                                    'нет',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        ].divide(SizedBox(height: 5.0)),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              Form(
                                                key: _model.formKey6,
                                                autovalidateMode:
                                                    AutovalidateMode.disabled,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  8.0,
                                                                  8.0),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            TextFormField(
                                                          controller: _model
                                                              .textFieldNameMTextController,
                                                          focusNode: _model
                                                              .textFieldNameMFocusNode,
                                                          autofocus: true,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText: 'Имя *',
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      fontSize:
                                                                          13.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0xFFD3D1D8),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                          validator: _model
                                                              .textFieldNameMTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child:
                                                                  AuthUserStreamWidget(
                                                                builder:
                                                                    (context) =>
                                                                        TextFormField(
                                                                  controller: _model
                                                                      .textFieldPhoneMTextController,
                                                                  focusNode: _model
                                                                      .textFieldPhoneMFocusNode,
                                                                  autofocus:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Телефон *',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintText:
                                                                        '+79999999999',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFD3D1D8),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .phone,
                                                                  validator: _model
                                                                      .textFieldPhoneMTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                  inputFormatters: [
                                                                    _model
                                                                        .textFieldPhoneMMask
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  8.0,
                                                                  8.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                              controller: _model
                                                                      .dropDownMValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      null),
                                                              options: [
                                                                'Наличные',
                                                                'Карта',
                                                                'QR-код'
                                                              ],
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.dropDownMValue =
                                                                          val),
                                                              width: 300.0,
                                                              height: 50.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                              hintText:
                                                                  'Тип оплаты',
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 28.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor: Color(
                                                                  0xFFD3D1D8),
                                                              borderWidth: 1.0,
                                                              borderRadius:
                                                                  10.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          1.0,
                                                                          16.0,
                                                                          0.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  true,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textFieldcommentTextController,
                                                          focusNode: _model
                                                              .textFieldcommentFocusNode,
                                                          autofocus: true,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelText:
                                                                'Комментарий',
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      fontSize:
                                                                          13.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText:
                                                                'При необходимости, вы можете\nоставить комментарий к заказу.',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0xFFD3D1D8),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          maxLines: 3,
                                                          validator: _model
                                                              .textFieldcommentTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tablet: false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.8,
                                      constraints: BoxConstraints(
                                        minHeight: 600.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 25.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        widget!
                                                                            .restoran!
                                                                            .logo,
                                                                        width:
                                                                            74.0,
                                                                        height:
                                                                            74.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children:
                                                                            [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                widget!.restoran!.name,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    '${widget!.currentCurtItem?.length?.toString()} Товаров',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      'на сумму:',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    FFAppState().SummOrder.toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          fontSize: 20.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    ' ₽',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ].divide(SizedBox(height: 24.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      15.0,
                                                                      0.0,
                                                                      15.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Builder(
                                                                builder:
                                                                    (context) {
                                                                  final listCurtItem = widget!
                                                                      .currentCurtItem!
                                                                      .toList();

                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: List.generate(
                                                                        listCurtItem
                                                                            .length,
                                                                        (listCurtItemIndex) {
                                                                      final listCurtItemItem =
                                                                          listCurtItem[
                                                                              listCurtItemIndex];
                                                                      return Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(5.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: Color(0x4C000000),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                10.0,
                                                                                10.0,
                                                                                10.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 0.4,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                        child: Text(
                                                                                          listCurtItemItem.name,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Montserrat',
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Flexible(
                                                                                      child: Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 0.2,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Text(
                                                                                          'Цена: ${listCurtItemItem.price.toString()} руб.',
                                                                                          textAlign: TextAlign.end,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Montserrat',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Flexible(
                                                                                      child: Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 0.2,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Text(
                                                                                          'Х ${listCurtItemItem.quantity.toString()}',
                                                                                          textAlign: TextAlign.end,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Montserrat',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Flexible(
                                                                                      child: Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 0.2,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Text(
                                                                                          'Итого: ${listCurtItemItem.totalPrise.toString()} руб.',
                                                                                          textAlign: TextAlign.end,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Montserrat',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                if (listCurtItemItem.optionTXT.isNotEmpty)
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Дополнительно: ',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                      Builder(
                                                                                        builder: (context) {
                                                                                          final option = listCurtItemItem.optionTXT.toList();

                                                                                          return Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: List.generate(option.length, (optionIndex) {
                                                                                              final optionItem = option[optionIndex];
                                                                                              return Text(
                                                                                                optionItem,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Montserrat',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              );
                                                                                            }).divide(SizedBox(width: 8.0)),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 15.0)),
                                                                                  ),
                                                                              ].divide(SizedBox(height: 20.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }).divide(SizedBox(
                                                                        height:
                                                                            15.0)),
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 15.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 8.0, 16.0,
                                                          12.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    8.0,
                                                                    8.0,
                                                                    8.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Expanded(
                                                              child: Form(
                                                                key: _model
                                                                    .formKey3,
                                                                autovalidateMode:
                                                                    AutovalidateMode
                                                                        .disabled,
                                                                child:
                                                                    FlutterFlowDropDown<
                                                                        String>(
                                                                  controller: _model
                                                                          .dropDownTypeValueController ??=
                                                                      FormFieldController<
                                                                              String>(
                                                                          null),
                                                                  options: [
                                                                    'Самовывоз',
                                                                    'Доставка'
                                                                  ],
                                                                  onChanged:
                                                                      (val) async {
                                                                    safeSetState(() =>
                                                                        _model.dropDownTypeValue =
                                                                            val);
                                                                    safeSetState(
                                                                        () {
                                                                      _model
                                                                          .dropDownAdresVValueController
                                                                          ?.reset();
                                                                    });
                                                                  },
                                                                  width: 300.0,
                                                                  height: 50.0,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                  hintText:
                                                                      'Тип заказа',
                                                                  icon: Icon(
                                                                    Icons
                                                                        .keyboard_arrow_down_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  elevation:
                                                                      2.0,
                                                                  borderColor:
                                                                      Color(
                                                                          0xFFD3D1D8),
                                                                  borderWidth:
                                                                      1.0,
                                                                  borderRadius:
                                                                      10.0,
                                                                  margin: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          1.0,
                                                                          16.0,
                                                                          0.0),
                                                                  hidesUnderline:
                                                                      true,
                                                                  isOverButton:
                                                                      true,
                                                                  isSearchable:
                                                                      false,
                                                                  isMultiSelect:
                                                                      false,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      if (_model
                                                              .dropDownTypeValue ==
                                                          'Самовывоз')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      8.0,
                                                                      16.0,
                                                                      8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Flexible(
                                                                child: Text(
                                                                  widget!
                                                                      .restoran!
                                                                      .adress,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      if (_model
                                                              .dropDownTypeValue ==
                                                          'Доставка')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      8.0,
                                                                      8.0,
                                                                      8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Expanded(
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Form(
                                                                        key: _model
                                                                            .formKey1,
                                                                        autovalidateMode:
                                                                            AutovalidateMode.disabled,
                                                                        child: StreamBuilder<
                                                                            List<AdressUserRecord>>(
                                                                          stream:
                                                                              queryAdressUserRecord(
                                                                            queryBuilder: (adressUserRecord) =>
                                                                                adressUserRecord.where(
                                                                              'User',
                                                                              isEqualTo: currentUserReference,
                                                                            ),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 60.0,
                                                                                  height: 60.0,
                                                                                  child: SpinKitPulse(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    size: 60.0,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            List<AdressUserRecord>
                                                                                containerAdressUserRecordList =
                                                                                snapshot.data!;

                                                                            return Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: AuthUserStreamWidget(
                                                                                          builder: (context) => FlutterFlowDropDown<String>(
                                                                                            controller: _model.dropDownAdresVValueController ??= FormFieldController<String>(
                                                                                              _model.dropDownAdresVValue ??= '',
                                                                                            ),
                                                                                            options: List<String>.from(containerAdressUserRecordList.map((e) => e.adressStrok).toList()),
                                                                                            optionLabels: containerAdressUserRecordList.map((e) => e.name).toList(),
                                                                                            onChanged: (val) async {
                                                                                              safeSetState(() => _model.dropDownAdresVValue = val);
                                                                                              _model.adresName = _model.dropDownAdresVValue;
                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            width: 300.0,
                                                                                            height: 50.0,
                                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            hintText: 'Выберите адрес',
                                                                                            icon: Icon(
                                                                                              Icons.keyboard_arrow_down_rounded,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            elevation: 2.0,
                                                                                            borderColor: Color(0xFFD3D1D8),
                                                                                            borderWidth: 1.0,
                                                                                            borderRadius: 8.0,
                                                                                            margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                            hidesUnderline: true,
                                                                                            isOverButton: true,
                                                                                            isSearchable: false,
                                                                                            isMultiSelect: false,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      FlutterFlowIconButton(
                                                                                        borderColor: Colors.transparent,
                                                                                        borderRadius: 20.0,
                                                                                        borderWidth: 1.0,
                                                                                        buttonSize: 40.0,
                                                                                        icon: Icon(
                                                                                          Icons.add,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        onPressed: () async {
                                                                                          await showModalBottomSheet(
                                                                                            isScrollControlled: true,
                                                                                            backgroundColor: Colors.transparent,
                                                                                            context: context,
                                                                                            builder: (context) {
                                                                                              return GestureDetector(
                                                                                                onTap: () => FocusScope.of(context).unfocus(),
                                                                                                child: Padding(
                                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                                  child: AddAddressWidget(),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ).then((value) => safeSetState(() {}));
                                                                                        },
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: AuthUserStreamWidget(
                                                                                      builder: (context) => Text(
                                                                                        valueOrDefault<String>(
                                                                                          _model.adresName == null || _model.adresName == '' ? valueOrDefault(currentUserDocument?.adresStroke, '') : _model.dropDownAdresVValue,
                                                                                          'нет',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 5.0)),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      Form(
                                                        key: _model.formKey5,
                                                        autovalidateMode:
                                                            AutovalidateMode
                                                                .disabled,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                              child:
                                                                  AuthUserStreamWidget(
                                                                builder:
                                                                    (context) =>
                                                                        TextFormField(
                                                                  controller: _model
                                                                      .textFieldNameTextController,
                                                                  focusNode: _model
                                                                      .textFieldNameFocusNode,
                                                                  autofocus:
                                                                      false,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Имя *',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFD3D1D8),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                  validator: _model
                                                                      .textFieldNameTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          AuthUserStreamWidget(
                                                                        builder:
                                                                            (context) =>
                                                                                TextFormField(
                                                                          controller:
                                                                              _model.textFieldPhoneTextController,
                                                                          focusNode:
                                                                              _model.textFieldPhoneFocusNode,
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'Телефон *',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintText:
                                                                                '+79999999999',
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0xFFD3D1D8),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                          keyboardType:
                                                                              TextInputType.phone,
                                                                          validator: _model
                                                                              .textFieldPhoneTextControllerValidator
                                                                              .asValidator(context),
                                                                          inputFormatters: [
                                                                            _model.textFieldPhoneMask
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Expanded(
                                                                    child: FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                          .dropDownValueController ??= FormFieldController<
                                                                              String>(
                                                                          null),
                                                                      options: [
                                                                        'Наличный',
                                                                        'Карта',
                                                                        'QR-код'
                                                                      ],
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.dropDownValue = val),
                                                                      width:
                                                                          300.0,
                                                                      height:
                                                                          50.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                      hintText:
                                                                          'Тип оплаты',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          Color(
                                                                              0xFFD3D1D8),
                                                                      borderWidth:
                                                                          1.0,
                                                                      borderRadius:
                                                                          10.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          1.0,
                                                                          16.0,
                                                                          0.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      isOverButton:
                                                                          true,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .textFieldkomentVEBTextController,
                                                                  focusNode: _model
                                                                      .textFieldkomentVEBFocusNode,
                                                                  autofocus:
                                                                      false,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Комментарий',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintText:
                                                                        'При необходимости, вы можете\nоставить  комментарий к заказу.',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFD3D1D8),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  maxLines: 3,
                                                                  validator: _model
                                                                      .textFieldkomentVEBTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              StreamBuilder<List<BlacklistRecord>>(
                                stream: queryBlacklistRecord(
                                  queryBuilder: (blacklistRecord) =>
                                      blacklistRecord
                                          .where(
                                            'user',
                                            isEqualTo: currentUserReference,
                                          )
                                          .where(
                                            'place',
                                            isEqualTo:
                                                widget!.restoran?.reference,
                                          ),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 60.0,
                                        height: 60.0,
                                        child: SpinKitPulse(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 60.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<BlacklistRecord>
                                      containerBlacklistRecordList =
                                      snapshot.data!;
                                  final containerBlacklistRecord =
                                      containerBlacklistRecordList.isNotEmpty
                                          ? containerBlacklistRecordList.first
                                          : null;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Stack(
                                      children: [
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                        ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 40.0, 0.0, 30.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                if (_model.formKey3
                                                            .currentState ==
                                                        null ||
                                                    !_model
                                                        .formKey3.currentState!
                                                        .validate()) {
                                                  return;
                                                }
                                                if (_model.dropDownTypeValue ==
                                                    null) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'Выберите тип заказа'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  return;
                                                }
                                                if (_model.formKey5
                                                            .currentState ==
                                                        null ||
                                                    !_model
                                                        .formKey5.currentState!
                                                        .validate()) {
                                                  return;
                                                }
                                                if (_model.dropDownValue ==
                                                    null) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'Выберите тип оплаты'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  return;
                                                }
                                                if (containerBlacklistRecord
                                                        ?.user ==
                                                    currentUserReference) {
                                                  await actions
                                                      .showCustomSnackBarAction2(
                                                    context,
                                                    'Вы не можете сделать заказ в данном заведении!',
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  );
                                                } else {
                                                  if (_model
                                                          .dropDownTypeValue ==
                                                      'Доставка') {
                                                    if (_model.formKey1
                                                                .currentState ==
                                                            null ||
                                                        !_model.formKey1
                                                            .currentState!
                                                            .validate()) {
                                                      return;
                                                    }
                                                    if (functions
                                                        .isRestaurantOutsideWorkingHours(
                                                            widget!
                                                                .restoran!)!) {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () =>
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  InfoClosedWidget(
                                                                cariItem: widget!
                                                                    .currentCurtItem!
                                                                    .map((e) =>
                                                                        e.reference)
                                                                    .toList(),
                                                                restoran: widget!
                                                                    .restoran!
                                                                    .reference,
                                                                name: _model
                                                                    .textFieldNameTextController
                                                                    .text,
                                                                phone: _model
                                                                    .textFieldPhoneTextController
                                                                    .text,
                                                                type: _model
                                                                    .dropDownTypeValue!,
                                                                adress:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  _model.adresName ==
                                                                              null ||
                                                                          _model.adresName ==
                                                                              ''
                                                                      ? valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.adresStroke,
                                                                          '')
                                                                      : containerAdressUserRecord
                                                                          ?.adressStrok,
                                                                  'нет',
                                                                ),
                                                                openTime: widget!
                                                                    .restoran!
                                                                    .timeStart!,
                                                                comment: _model
                                                                    .textFieldcommentTextController
                                                                    .text,
                                                                restoranEmail:
                                                                    widget!
                                                                        .restoran!
                                                                        .email,
                                                                restName: widget!
                                                                    .restoran!
                                                                    .name,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await actions
                                                          .profileNewOrder(
                                                        widget!.currentCurtItem!
                                                            .map((e) =>
                                                                e.reference)
                                                            .toList(),
                                                        widget!.restoran!
                                                            .reference,
                                                        FFAppState().SummOrder,
                                                        currentUserReference!,
                                                        _model
                                                            .textFieldNameMTextController
                                                            .text,
                                                        _model
                                                            .textFieldPhoneTextController
                                                            .text,
                                                        _model
                                                            .dropDownTypeValue!,
                                                        valueOrDefault<String>(
                                                          _model.adresName ==
                                                                      null ||
                                                                  _model.adresName ==
                                                                      ''
                                                              ? valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.adresStroke,
                                                                  '')
                                                              : containerAdressUserRecord
                                                                  ?.adressStrok,
                                                          'нет',
                                                        ),
                                                        _model
                                                            .textFieldkomentVEBTextController
                                                            .text,
                                                        valueOrDefault(
                                                            currentUserDocument
                                                                ?.emailReal,
                                                            ''),
                                                        widget!.restoran!.name,
                                                      );
                                                      await PostMarkCall.call(
                                                        to: widget!
                                                            .restoran?.email,
                                                        subject:
                                                            'Вам поступил новый заказ №:${FFAppState().nuberOrder} от: ${dateTimeFormat(
                                                          "d/M H:mm",
                                                          FFAppState()
                                                              .DateOrder,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        )}',
                                                        text:
                                                            'Заказ от: ${_model.textFieldNameTextController.text}; Телефон: ${_model.textFieldPhoneTextController.text}; Тип Заказа: ${_model.dropDownTypeValue}. Для более детального просмотра заказ, пройдите в свой личный кабинет: https://sakh-market-fme2ud.flutterflow.app/',
                                                      );

                                                      await SoundRecord
                                                              .createDoc(widget!
                                                                  .restoran!
                                                                  .reference)
                                                          .set(
                                                              createSoundRecordData(
                                                        count: 1,
                                                      ));

                                                      context
                                                          .goNamed('checkout');
                                                    }
                                                  } else {
                                                    if (functions
                                                        .isRestaurantOutsideWorkingHours(
                                                            widget!
                                                                .restoran!)!) {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () =>
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  InfoClosedWidget(
                                                                cariItem: widget!
                                                                    .currentCurtItem!
                                                                    .map((e) =>
                                                                        e.reference)
                                                                    .toList(),
                                                                restoran: widget!
                                                                    .restoran!
                                                                    .reference,
                                                                name: _model
                                                                    .textFieldNameTextController
                                                                    .text,
                                                                phone: _model
                                                                    .textFieldPhoneTextController
                                                                    .text,
                                                                type: _model
                                                                    .dropDownTypeValue!,
                                                                adress: widget!
                                                                    .restoran
                                                                    ?.adress,
                                                                openTime: widget!
                                                                    .restoran!
                                                                    .timeStart!,
                                                                comment: _model
                                                                    .textFieldcommentTextController
                                                                    .text,
                                                                restoranEmail:
                                                                    widget!
                                                                        .restoran!
                                                                        .email,
                                                                restName: widget!
                                                                    .restoran!
                                                                    .name,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await actions
                                                          .profileNewOrder(
                                                        widget!.currentCurtItem!
                                                            .map((e) =>
                                                                e.reference)
                                                            .toList(),
                                                        widget!.restoran!
                                                            .reference,
                                                        FFAppState().SummOrder,
                                                        currentUserReference!,
                                                        _model
                                                            .textFieldNameTextController
                                                            .text,
                                                        _model
                                                            .textFieldPhoneTextController
                                                            .text,
                                                        _model
                                                            .dropDownTypeValue!,
                                                        widget!
                                                            .restoran?.adress,
                                                        _model
                                                            .textFieldkomentVEBTextController
                                                            .text,
                                                        valueOrDefault(
                                                            currentUserDocument
                                                                ?.emailReal,
                                                            ''),
                                                        widget!.restoran!.name,
                                                      );
                                                      await PostMarkCall.call(
                                                        to: widget!
                                                            .restoran?.email,
                                                        subject:
                                                            'Вам поступил новый заказ №:${FFAppState().nuberOrder} от: ${dateTimeFormat(
                                                          "d/M H:mm",
                                                          FFAppState()
                                                              .DateOrder,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        )}',
                                                        text:
                                                            'Заказ от: ${_model.textFieldNameTextController.text}; Телефон: ${_model.textFieldPhoneTextController.text}; Тип Заказа: ${_model.dropDownTypeValue}. Для более детального просмотра заказ, пройдите в свой личный кабинет: https://sakh-market-fme2ud.flutterflow.app/',
                                                      );

                                                      await SoundRecord
                                                              .createDoc(widget!
                                                                  .restoran!
                                                                  .reference)
                                                          .set(
                                                              createSoundRecordData(
                                                        count: 1,
                                                      ));

                                                      context
                                                          .goNamed('checkout');
                                                    }
                                                  }
                                                }
                                              },
                                              text: 'ОФОРМИТЬ ЗАКАЗ',
                                              options: FFButtonOptions(
                                                width: 240.0,
                                                height: 45.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                            ),
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 20.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                if (_model.formKey2
                                                            .currentState ==
                                                        null ||
                                                    !_model
                                                        .formKey2.currentState!
                                                        .validate()) {
                                                  return;
                                                }
                                                if (_model.dropDownTypeMValue ==
                                                    null) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'Выберите тип заказа'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  return;
                                                }
                                                if (_model.formKey6
                                                            .currentState ==
                                                        null ||
                                                    !_model
                                                        .formKey6.currentState!
                                                        .validate()) {
                                                  return;
                                                }
                                                if (_model.dropDownMValue ==
                                                    null) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'Выберите тип оплаты'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  return;
                                                }
                                                if (FFAppState().SummOrder >
                                                    widget!.restoran!
                                                        .minSumDelivery
                                                        .toDouble()) {
                                                  if (containerBlacklistRecord
                                                          ?.user ==
                                                      currentUserReference) {
                                                    await actions
                                                        .showCustomSnackBarAction2(
                                                      context,
                                                      'Вы не можете сделать заказ в данном заведении!',
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    );
                                                  } else {
                                                    if (_model
                                                            .dropDownTypeMValue ==
                                                        'Доставка') {
                                                      if (_model.formKey4
                                                                  .currentState ==
                                                              null ||
                                                          !_model.formKey4
                                                              .currentState!
                                                              .validate()) {
                                                        return;
                                                      }
                                                      if (functions
                                                          .isRestaurantOutsideWorkingHours(
                                                              widget!
                                                                  .restoran!)!) {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () =>
                                                                  FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    InfoClosedWidget(
                                                                  cariItem: widget!
                                                                      .currentCurtItem!
                                                                      .map((e) =>
                                                                          e.reference)
                                                                      .toList(),
                                                                  restoran: widget!
                                                                      .restoran!
                                                                      .reference,
                                                                  name: _model
                                                                      .textFieldNameMTextController
                                                                      .text,
                                                                  phone: _model
                                                                      .textFieldPhoneMTextController
                                                                      .text,
                                                                  type: _model
                                                                      .dropDownTypeMValue!,
                                                                  adress:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    _model.adresName ==
                                                                                null ||
                                                                            _model.adresName ==
                                                                                ''
                                                                        ? valueOrDefault(
                                                                            currentUserDocument
                                                                                ?.adresStroke,
                                                                            '')
                                                                        : containerAdressUserRecord
                                                                            ?.adressStrok,
                                                                    'нет',
                                                                  ),
                                                                  openTime: widget!
                                                                      .restoran!
                                                                      .timeStart!,
                                                                  comment: _model
                                                                      .textFieldcommentTextController
                                                                      .text,
                                                                  restoranEmail:
                                                                      widget!
                                                                          .restoran!
                                                                          .email,
                                                                  restName: widget!
                                                                      .restoran!
                                                                      .name,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      } else {
                                                        await actions
                                                            .profileNewOrder(
                                                          widget!
                                                              .currentCurtItem!
                                                              .map((e) =>
                                                                  e.reference)
                                                              .toList(),
                                                          widget!.restoran!
                                                              .reference,
                                                          FFAppState()
                                                              .SummOrder,
                                                          currentUserReference!,
                                                          _model
                                                              .textFieldNameMTextController
                                                              .text,
                                                          _model
                                                              .textFieldPhoneMTextController
                                                              .text,
                                                          _model
                                                              .dropDownTypeMValue!,
                                                          valueOrDefault<
                                                              String>(
                                                            _model.adresName ==
                                                                        null ||
                                                                    _model.adresName ==
                                                                        ''
                                                                ? valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.adresStroke,
                                                                    '')
                                                                : containerAdressUserRecord
                                                                    ?.adressStrok,
                                                            'нет',
                                                          ),
                                                          _model
                                                              .textFieldcommentTextController
                                                              .text,
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.emailReal,
                                                              ''),
                                                          widget!
                                                              .restoran!.name,
                                                        );

                                                        await SoundRecord
                                                                .createDoc(widget!
                                                                    .restoran!
                                                                    .reference)
                                                            .set(
                                                                createSoundRecordData(
                                                          count: 1,
                                                        ));
                                                        await PostMarkCall.call(
                                                          to: widget!
                                                              .restoran?.email,
                                                          subject:
                                                              'Вам поступил новый заказ №:${FFAppState().nuberOrder} от: ${dateTimeFormat(
                                                            "d/M H:mm",
                                                            FFAppState()
                                                                .DateOrder,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )}',
                                                          text:
                                                              'Заказ от: ${_model.textFieldNameMTextController.text}; Телефон: ${_model.textFieldPhoneMTextController.text}; Тип Заказа: ${_model.dropDownTypeMValue}. Для более детального просмотра заказ, пройдите в свой личный кабинет: https://sakh-market-fme2ud.flutterflow.app/',
                                                        );

                                                        context.goNamed(
                                                            'checkout');
                                                      }
                                                    } else {
                                                      if (functions
                                                          .isRestaurantOutsideWorkingHours(
                                                              widget!
                                                                  .restoran!)!) {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () =>
                                                                  FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    InfoClosedWidget(
                                                                  cariItem: widget!
                                                                      .currentCurtItem!
                                                                      .map((e) =>
                                                                          e.reference)
                                                                      .toList(),
                                                                  restoran: widget!
                                                                      .restoran!
                                                                      .reference,
                                                                  name: _model
                                                                      .textFieldNameMTextController
                                                                      .text,
                                                                  phone: _model
                                                                      .textFieldPhoneMTextController
                                                                      .text,
                                                                  type: _model
                                                                      .dropDownTypeMValue!,
                                                                  adress: widget!
                                                                      .restoran
                                                                      ?.adress,
                                                                  openTime: widget!
                                                                      .restoran!
                                                                      .timeStart!,
                                                                  comment: _model
                                                                      .textFieldcommentTextController
                                                                      .text,
                                                                  restoranEmail:
                                                                      widget!
                                                                          .restoran!
                                                                          .email,
                                                                  restName: widget!
                                                                      .restoran!
                                                                      .name,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      } else {
                                                        await actions
                                                            .profileNewOrder(
                                                          widget!
                                                              .currentCurtItem!
                                                              .map((e) =>
                                                                  e.reference)
                                                              .toList(),
                                                          widget!.restoran!
                                                              .reference,
                                                          FFAppState()
                                                              .SummOrder,
                                                          currentUserReference!,
                                                          _model
                                                              .textFieldNameMTextController
                                                              .text,
                                                          _model
                                                              .textFieldPhoneMTextController
                                                              .text,
                                                          _model
                                                              .dropDownTypeMValue!,
                                                          widget!
                                                              .restoran?.adress,
                                                          _model
                                                              .textFieldcommentTextController
                                                              .text,
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.emailReal,
                                                              ''),
                                                          widget!
                                                              .restoran!.name,
                                                        );

                                                        await SoundRecord
                                                                .createDoc(widget!
                                                                    .restoran!
                                                                    .reference)
                                                            .set(
                                                                createSoundRecordData(
                                                          count: 1,
                                                        ));
                                                        await PostMarkCall.call(
                                                          to: widget!
                                                              .restoran?.email,
                                                          subject:
                                                              'Вам поступил новый заказ №:${FFAppState().nuberOrder} от: ${dateTimeFormat(
                                                            "d/M H:mm",
                                                            FFAppState()
                                                                .DateOrder,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )}',
                                                          text:
                                                              'Заказ от: ${_model.textFieldNameMTextController.text}; Телефон: ${_model.textFieldPhoneMTextController.text}; Тип Заказа: ${_model.dropDownTypeMValue}. Для более детального просмотра заказ, пройдите в свой личный кабинет: https://sakh-market-fme2ud.flutterflow.app/',
                                                        );

                                                        context.goNamed(
                                                            'checkout');
                                                      }
                                                    }
                                                  }
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'Минимальная сумма заказа от: ${widget!.restoran?.minSumDelivery?.toString()}руб.'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                }
                                              },
                                              text: 'ОФОРМИТЬ ЗАКАЗ',
                                              options: FFButtonOptions(
                                                width: 240.0,
                                                height: 45.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
