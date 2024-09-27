import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/item_comp_searche/item_comp_searche_widget.dart';
import '/main/place_component/place_component_widget.dart';
import '/main/stop_login/stop_login_widget.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_model.dart';
export 'search_model.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget>
    with TickerProviderStateMixin {
  late SearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'iconButtonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 15.0,
                            borderWidth: 2.0,
                            buttonSize: 40.0,
                            fillColor: Color(0x7EF1F4F8),
                            icon: Icon(
                              Icons.arrow_back_ios_sharp,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 25.0,
                            ),
                            onPressed: () async {
                              context.safePop();
                            },
                          ),
                          StreamBuilder<List<CartItemsRecord>>(
                            stream: FFAppState().caheCategory(
                              requestFn: () => queryCartItemsRecord(
                                queryBuilder: (cartItemsRecord) =>
                                    cartItemsRecord.where(
                                  'user',
                                  isEqualTo: currentUserReference,
                                ),
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 60.0,
                                    height: 60.0,
                                    child: SpinKitPulse(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 60.0,
                                    ),
                                  ),
                                );
                              }
                              List<CartItemsRecord>
                                  containerCartItemsRecordList = snapshot.data!;

                              return Container(
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if (loggedIn &&
                                        (containerCartItemsRecordList
                                            .isNotEmpty))
                                      Text(
                                        containerCartItemsRecordList.length
                                            .toString(),
                                        textAlign: TextAlign.end,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  containerCartItemsRecordList
                                                          .isNotEmpty
                                                      ? Colors.black
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    Stack(
                                      children: [
                                        if (loggedIn)
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              Icons.shopping_cart_outlined,
                                              color:
                                                  containerCartItemsRecordList
                                                          .isNotEmpty
                                                      ? Colors.black
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              context.pushNamed(
                                                'cart',
                                                queryParameters: {
                                                  'back': serializeParam(
                                                    true,
                                                    ParamType.bool,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                          ),
                                      ],
                                    ),
                                  ].divide(SizedBox(width: 10.0)),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      constraints: BoxConstraints(
                        maxWidth: 1300.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 2000),
                                  () async {
                                    FFAppState().searchTextMenu =
                                        _model.textController.text;
                                    safeSetState(() {});
                                  },
                                ),
                                autofocus: true,
                                textInputAction: TextInputAction.search,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelText: 'Что хотите найти?',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 0.0,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  prefixIcon: Icon(
                                    Icons.search_rounded,
                                  ),
                                  suffixIcon: _model
                                          .textController!.text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.textController?.clear();
                                            FFAppState().searchTextMenu =
                                                _model.textController.text;
                                            safeSetState(() {});
                                            safeSetState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                            size: 24.0,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      letterSpacing: 0.0,
                                    ),
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (_model.textController.text != null &&
                                          _model.textController.text != '')
                                        FutureBuilder<List<MenuRecord>>(
                                          future: queryMenuRecordOnce(),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 60.0,
                                                  height: 60.0,
                                                  child: SpinKitPulse(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 60.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<MenuRecord>
                                                menuMenuRecordList =
                                                snapshot.data!;

                                            return Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft:
                                                      Radius.circular(10.0),
                                                  topRight:
                                                      Radius.circular(10.0),
                                                ),
                                              ),
                                              child: Builder(
                                                builder: (context) {
                                                  final listRearch = functions
                                                          .filtrMenuSearch(
                                                              _model
                                                                  .textController
                                                                  .text,
                                                              menuMenuRecordList
                                                                  .toList())
                                                          ?.toList() ??
                                                      [];

                                                  return Wrap(
                                                    spacing: 6.0,
                                                    runSpacing: 10.0,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior: Clip.none,
                                                    children: List.generate(
                                                        listRearch.length,
                                                        (listRearchIndex) {
                                                      final listRearchItem =
                                                          listRearch[
                                                              listRearchIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            'currentItem',
                                                            queryParameters: {
                                                              'currentTovar':
                                                                  serializeParam(
                                                                listRearchItem,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'currentTovar':
                                                                  listRearchItem,
                                                            },
                                                          );
                                                        },
                                                        child:
                                                            ItemCompSearcheWidget(
                                                          key: Key(
                                                              'Key16c_${listRearchIndex}_of_${listRearch.length}'),
                                                          blockMenu:
                                                              listRearchItem,
                                                        ),
                                                      );
                                                    }),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      if (_model.textController.text != null &&
                                          _model.textController.text != '')
                                        FutureBuilder<List<RestoranRecord>>(
                                          future: queryRestoranRecordOnce(
                                            queryBuilder: (restoranRecord) =>
                                                restoranRecord.where(
                                              'visible',
                                              isEqualTo: true,
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 60.0,
                                                  height: 60.0,
                                                  child: SpinKitPulse(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 60.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<RestoranRecord>
                                                containerRestoranRecordList =
                                                snapshot.data!;

                                            return Container(
                                              decoration: BoxDecoration(),
                                              child: Builder(
                                                builder: (context) {
                                                  final listRest = (functions
                                                              .filtrRestoran(
                                                                  _model
                                                                      .textController
                                                                      .text,
                                                                  containerRestoranRecordList
                                                                      .toList())
                                                              ?.toList() ??
                                                          [])
                                                      .take(6)
                                                      .toList();

                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        listRest.length,
                                                        (listRestIndex) {
                                                      final listRestItem =
                                                          listRest[
                                                              listRestIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    10.0),
                                                        child: StreamBuilder<
                                                            RestoranRecord>(
                                                          stream: RestoranRecord
                                                              .getDocument(
                                                                  listRestItem
                                                                      .reference),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 60.0,
                                                                  height: 60.0,
                                                                  child:
                                                                      SpinKitPulse(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 60.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }

                                                            final houseCardRestoranRecord =
                                                                snapshot.data!;

                                                            return Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        4.0,
                                                                    color: Color(
                                                                        0x32000000),
                                                                    offset:
                                                                        Offset(
                                                                      0.0,
                                                                      2.0,
                                                                    ),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Visibility(
                                                                visible:
                                                                    houseCardRestoranRecord
                                                                            .visible ==
                                                                        true,
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'place',
                                                                      queryParameters:
                                                                          {
                                                                        'restoran':
                                                                            serializeParam(
                                                                          houseCardRestoranRecord,
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <String,
                                                                          dynamic>{
                                                                        'restoran':
                                                                            houseCardRestoranRecord,
                                                                      },
                                                                    );
                                                                  },
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Stack(
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 1.0),
                                                                            child:
                                                                                Stack(
                                                                              alignment: AlignmentDirectional(-1.0, 1.0),
                                                                              children: [
                                                                                PlaceComponentWidget(
                                                                                  key: Key('Key6ls_${listRestIndex}_of_${listRest.length}'),
                                                                                  restoran: houseCardRestoranRecord,
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 10.0),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: Image.network(
                                                                                        '',
                                                                                        width: 60.0,
                                                                                        height: 60.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 15.0, 10.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: AuthUserStreamWidget(
                                                                                          builder: (context) => FlutterFlowIconButton(
                                                                                            borderColor: (currentUserDocument?.favorit?.toList() ?? []).contains(houseCardRestoranRecord.reference) ? Color(0xFFFD2A4F) : Color(0xFFE1A3A3),
                                                                                            borderRadius: 15.0,
                                                                                            borderWidth: 2.0,
                                                                                            buttonSize: 40.0,
                                                                                            hoverIconColor: (currentUserDocument?.favorit?.toList() ?? []).contains(houseCardRestoranRecord.reference) ? Color(0xFFFD2A4F) : Color(0xFFFF4E4E),
                                                                                            icon: Icon(
                                                                                              Icons.favorite_rounded,
                                                                                              color: (currentUserDocument?.favorit?.toList() ?? []).contains(houseCardRestoranRecord.reference) ? Color(0xFFFD2A4F) : Color(0xFFE1A3A3),
                                                                                              size: 25.0,
                                                                                            ),
                                                                                            onPressed: () async {
                                                                                              if (loggedIn) {
                                                                                                if ((currentUserDocument?.favorit?.toList() ?? []).contains(houseCardRestoranRecord.reference)) {
                                                                                                  await currentUserReference!.update({
                                                                                                    ...mapToFirestore(
                                                                                                      {
                                                                                                        'Favorit': FieldValue.arrayRemove([
                                                                                                          houseCardRestoranRecord.reference
                                                                                                        ]),
                                                                                                      },
                                                                                                    ),
                                                                                                  });
                                                                                                } else {
                                                                                                  await currentUserReference!.update({
                                                                                                    ...mapToFirestore(
                                                                                                      {
                                                                                                        'Favorit': FieldValue.arrayUnion([
                                                                                                          houseCardRestoranRecord.reference
                                                                                                        ]),
                                                                                                      },
                                                                                                    ),
                                                                                                  });
                                                                                                }
                                                                                              } else {
                                                                                                await showModalBottomSheet(
                                                                                                  isScrollControlled: true,
                                                                                                  backgroundColor: Colors.transparent,
                                                                                                  enableDrag: false,
                                                                                                  context: context,
                                                                                                  builder: (context) {
                                                                                                    return GestureDetector(
                                                                                                      onTap: () => FocusScope.of(context).unfocus(),
                                                                                                      child: Padding(
                                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                                        child: StopLoginWidget(),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ).then((value) => safeSetState(() {}));
                                                                                              }
                                                                                            },
                                                                                          ).animateOnPageLoad(animationsMap['iconButtonOnPageLoadAnimation']!),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 10.0)),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            12.0,
                                                                            16.0,
                                                                            8.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            if ((functions.isRestaurantOutsideWorkingHours(listRestItem) == true) &&
                                                                                listRestItem.isClosedUntilTomorrow)
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                                                                  height: 35.0,
                                                                                  constraints: BoxConstraints(
                                                                                    minWidth: 100.0,
                                                                                  ),
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                    ),
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    'Закрыт до: ${dateTimeFormat(
                                                                                      "HH:mm",
                                                                                      houseCardRestoranRecord.timeStart,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    )}',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        houseCardRestoranRecord.name.maybeHandleOverflow(
                                                                                          maxChars: 36,
                                                                                          replacement: '…',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Color(0xFF101213),
                                                                                              fontSize: 20.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        houseCardRestoranRecord.minDiskription,
                                                                                        textAlign: TextAlign.start,
                                                                                        maxLines: 2,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 5.0)),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.star_border,
                                                                                            color: Color(0xFFFFBE00),
                                                                                            size: 22.0,
                                                                                          ),
                                                                                          Text(
                                                                                            formatNumber(
                                                                                              houseCardRestoranRecord.rating,
                                                                                              formatType: FormatType.custom,
                                                                                              format: '0.0',
                                                                                              locale: '',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 5.0)),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.chat,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            size: 22.0,
                                                                                          ),
                                                                                          Text(
                                                                                            houseCardRestoranRecord.countRating.toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 5.0)),
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 5.0)),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Icon(
                                                                                      Icons.currency_ruble,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 20.0,
                                                                                    ),
                                                                                    Text(
                                                                                      'от ${formatNumber(
                                                                                        houseCardRestoranRecord.minSumDelivery,
                                                                                        formatType: FormatType.custom,
                                                                                        format: '0',
                                                                                        locale: '',
                                                                                      )} руб.',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    if (houseCardRestoranRecord.cartPay)
                                                                                      FaIcon(
                                                                                        FontAwesomeIcons.solidCreditCard,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: 22.0,
                                                                                      ),
                                                                                    if (houseCardRestoranRecord.cash)
                                                                                      FaIcon(
                                                                                        FontAwesomeIcons.wallet,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: 22.0,
                                                                                      ),
                                                                                    if (houseCardRestoranRecord.pickup)
                                                                                      FaIcon(
                                                                                        FontAwesomeIcons.shoppingBasket,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: 20.0,
                                                                                      ),
                                                                                    if (houseCardRestoranRecord.qrCode)
                                                                                      Icon(
                                                                                        Icons.qr_code,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: 23.0,
                                                                                      ),
                                                                                  ].divide(SizedBox(width: 5.0)),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ].divide(SizedBox(height: 8.0)),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    }),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                    ].divide(SizedBox(height: 10.0)),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 20.0)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
