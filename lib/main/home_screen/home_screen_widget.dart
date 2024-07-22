import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/cart_veb_widget.dart';
import '/components/header_widget.dart';
import '/components/stop_go_login_widget.dart';
import '/components/veb_profil_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/all_categoey_copy/all_categoey_copy_widget.dart';
import '/main/carousel_component/carousel_component_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_screen_model.dart';
export 'home_screen_model.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  late HomeScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().currentPageNavBar = 'homeScreen';
      setState(() {});
    });

    _model.testTextController ??= TextEditingController();
    _model.testFocusNode ??= FocusNode();

    _model.searchTextFieldTextController1 ??= TextEditingController();
    _model.searchTextFieldFocusNode1 ??= FocusNode();

    _model.searchTextFieldTextController2 ??= TextEditingController();
    _model.searchTextFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<CategoryOfRestaurantCuisineRecord>>(
      future: queryCategoryOfRestaurantCuisineRecordOnce(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitPulse(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<CategoryOfRestaurantCuisineRecord>
            homeScreenCategoryOfRestaurantCuisineRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: SafeArea(
                top: true,
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: StreamBuilder<List<RestoranRecord>>(
                    stream: _model.restorsants(
                      requestFn: () => queryRestoranRecord(
                        queryBuilder: (restoranRecord) => restoranRecord.where(
                          'visible',
                          isEqualTo: true,
                        ),
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitPulse(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      List<RestoranRecord> containerRestoranRecordList =
                          snapshot.data!;

                      return Container(
                        height: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: 1305.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: StreamBuilder<List<BannerRecord>>(
                          stream: queryBannerRecord(
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitPulse(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            List<BannerRecord> columnBannerRecordList =
                                snapshot.data!;

                            final columnBannerRecord =
                                columnBannerRecordList.isNotEmpty
                                    ? columnBannerRecordList.first
                                    : null;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tablet: false,
                                ))
                                  Container(
                                    width: double.infinity,
                                    height: 200.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                          child: wrapWithModel(
                                            model: _model.headerModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: HeaderWidget(
                                              position: 'home',
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 150.0,
                                          constraints: BoxConstraints(
                                            maxWidth: 1440.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
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
                                                        'homeScreen');
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/Frame_25.png',
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .testTextController,
                                                        focusNode: _model
                                                            .testFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.testTextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () async {
                                                            FFAppState()
                                                                    .searchText =
                                                                '2';
                                                            setState(() {});
                                                          },
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'Поиск',
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    lineHeight:
                                                                        1.0,
                                                                  ),
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x37000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x37000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .search_rounded,
                                                          ),
                                                          suffixIcon: _model
                                                                  .testTextController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .testTextController
                                                                        ?.clear();
                                                                    FFAppState()
                                                                            .searchText =
                                                                        '2';
                                                                    setState(
                                                                        () {});
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 25.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              letterSpacing:
                                                                  0.0,
                                                              lineHeight: 1.0,
                                                            ),
                                                        maxLines: null,
                                                        validator: _model
                                                            .testTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      MouseRegion(
                                                        opaque: false,
                                                        cursor: MouseCursor
                                                                .defer ??
                                                            MouseCursor.defer,
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'homeScreen',
                                                              extra: <String,
                                                                  dynamic>{
                                                                kTransitionInfoKey:
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          0),
                                                                ),
                                                              },
                                                            );
                                                          },
                                                          child: Text(
                                                            'Главная',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                        onEnter:
                                                            ((event) async {
                                                          setState(() => _model
                                                                  .mouseRegionHomeHovered =
                                                              true);
                                                        }),
                                                        onExit: ((event) async {
                                                          setState(() => _model
                                                                  .mouseRegionHomeHovered =
                                                              false);
                                                        }),
                                                      ),
                                                      MouseRegion(
                                                        opaque: false,
                                                        cursor: MouseCursor
                                                                .defer ??
                                                            MouseCursor.defer,
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (loggedIn) {
                                                              context.goNamed(
                                                                  'favour');
                                                            } else {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return GestureDetector(
                                                                    onTap: () => _model
                                                                            .unfocusNode
                                                                            .canRequestFocus
                                                                        ? FocusScope.of(context).requestFocus(_model
                                                                            .unfocusNode)
                                                                        : FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          StopGoLoginWidget(),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            }
                                                          },
                                                          child: Text(
                                                            'Избранное',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                        onEnter:
                                                            ((event) async {
                                                          setState(() => _model
                                                                  .mouseRegionFavorHovered =
                                                              true);
                                                        }),
                                                        onExit: ((event) async {
                                                          setState(() => _model
                                                                  .mouseRegionFavorHovered =
                                                              false);
                                                        }),
                                                      ),
                                                      MouseRegion(
                                                        opaque: false,
                                                        cursor: MouseCursor
                                                                .defer ??
                                                            MouseCursor.defer,
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (loggedIn) {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return GestureDetector(
                                                                    onTap: () => _model
                                                                            .unfocusNode
                                                                            .canRequestFocus
                                                                        ? FocusScope.of(context).requestFocus(_model
                                                                            .unfocusNode)
                                                                        : FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          VebProfilWidget(),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            } else {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return GestureDetector(
                                                                    onTap: () => _model
                                                                            .unfocusNode
                                                                            .canRequestFocus
                                                                        ? FocusScope.of(context).requestFocus(_model
                                                                            .unfocusNode)
                                                                        : FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          StopGoLoginWidget(),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            }
                                                          },
                                                          child: Text(
                                                            'Профиль',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                        onEnter:
                                                            ((event) async {
                                                          setState(() => _model
                                                                  .mouseRegionProfilHovered =
                                                              true);
                                                        }),
                                                        onExit: ((event) async {
                                                          setState(() => _model
                                                                  .mouseRegionProfilHovered =
                                                              false);
                                                        }),
                                                      ),
                                                      MouseRegion(
                                                        opaque: false,
                                                        cursor: MouseCursor
                                                                .defer ??
                                                            MouseCursor.defer,
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (loggedIn) {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return GestureDetector(
                                                                    onTap: () => _model
                                                                            .unfocusNode
                                                                            .canRequestFocus
                                                                        ? FocusScope.of(context).requestFocus(_model
                                                                            .unfocusNode)
                                                                        : FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          CartVebWidget(),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            } else {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return GestureDetector(
                                                                    onTap: () => _model
                                                                            .unfocusNode
                                                                            .canRequestFocus
                                                                        ? FocusScope.of(context).requestFocus(_model
                                                                            .unfocusNode)
                                                                        : FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          StopGoLoginWidget(),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            }
                                                          },
                                                          child: Text(
                                                            'Корзина',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                        onEnter:
                                                            ((event) async {
                                                          setState(() => _model
                                                                  .mouseRegionCartHovered =
                                                              true);
                                                        }),
                                                        onExit: ((event) async {
                                                          setState(() => _model
                                                                  .mouseRegionCartHovered =
                                                              false);
                                                        }),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 50.0)),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 50.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (responsiveVisibility(
                                  context: context,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Flexible(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 16.0, 8.0, 0.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                4.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .arrow_drop_down,
                                                                  color: Color(
                                                                      0x7F757575),
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Text(
                                                                  'Южно-сахалинск',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            14.0,
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
                                                        Stack(
                                                          children: [
                                                            if ((currentUserPhoto !=
                                                                        null &&
                                                                    currentUserPhoto !=
                                                                        '') &&
                                                                responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  tablet: false,
                                                                  tabletLandscape:
                                                                      false,
                                                                  desktop:
                                                                      false,
                                                                ))
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                child:
                                                                    AuthUserStreamWidget(
                                                                  builder:
                                                                      (context) =>
                                                                          Container(
                                                                    width: 40.0,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              24.0),
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
                                                                              24.0),
                                                                      child: Image
                                                                          .network(
                                                                        currentUserPhoto,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            if (!currentUserEmailVerified)
                                                              AuthUserStreamWidget(
                                                                builder:
                                                                    (context) =>
                                                                        FlutterFlowIconButton(
                                                                  borderRadius:
                                                                      20.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .login_sharp,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    context.pushNamed(
                                                                        'Auth_login');
                                                                  },
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .searchTextFieldTextController1,
                                                              focusNode: _model
                                                                  .searchTextFieldFocusNode1,
                                                              onChanged: (_) =>
                                                                  EasyDebounce
                                                                      .debounce(
                                                                '_model.searchTextFieldTextController1',
                                                                Duration(
                                                                    milliseconds:
                                                                        2000),
                                                                () async {
                                                                  FFAppState()
                                                                          .searchText =
                                                                      '1';
                                                                  setState(
                                                                      () {});
                                                                },
                                                              ),
                                                              autofocus: false,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'Поиск',
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      lineHeight:
                                                                          1.0,
                                                                    ),
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x37000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x37000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                ),
                                                                prefixIcon:
                                                                    Icon(
                                                                  Icons
                                                                      .search_rounded,
                                                                ),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    lineHeight:
                                                                        1.0,
                                                                  ),
                                                              maxLines: null,
                                                              validator: _model
                                                                  .searchTextFieldTextController1Validator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      if (_model.searchTextFieldTextController1
                                                                  .text !=
                                                              null &&
                                                          _model.searchTextFieldTextController1
                                                                  .text !=
                                                              '')
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            setState(() {
                                                              _model
                                                                  .searchTextFieldTextController1
                                                                  ?.clear();
                                                            });
                                                          },
                                                          child: Icon(
                                                            Icons.close_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        if (MediaQuery.sizeOf(
                                                                    context)
                                                                .height >=
                                                            20.0)
                                                          SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                if (FFAppState()
                                                                    .currentRestCategory
                                                                    .isNotEmpty)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        FFAppState().currentRestCategory =
                                                                            [];
                                                                        FFAppState()
                                                                            .update(() {});
                                                                        FFAppState().katagoryRestName =
                                                                            [];
                                                                        FFAppState()
                                                                            .update(() {});
                                                                      },
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                65.0,
                                                                            height:
                                                                                65.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.white,
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                'X',
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      fontSize: 36.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              'Очистить',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: Colors.black,
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 8.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Container(
                                                                  width: 600.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final category = homeScreenCategoryOfRestaurantCuisineRecordList
                                                                          .toList()
                                                                          .take(
                                                                              8)
                                                                          .toList();

                                                                      return Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: List.generate(
                                                                            category.length,
                                                                            (categoryIndex) {
                                                                          final categoryItem =
                                                                              category[categoryIndex];
                                                                          return Flexible(
                                                                            child:
                                                                                Container(
                                                                              width: 75.0,
                                                                              decoration: BoxDecoration(),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  if (FFAppState().currentRestCategory.contains(categoryItem.reference)) {
                                                                                    FFAppState().removeFromCurrentRestCategory(categoryItem.reference);
                                                                                    setState(() {});
                                                                                    FFAppState().removeFromKatagoryRestName(categoryItem.name);
                                                                                    setState(() {});
                                                                                  } else {
                                                                                    FFAppState().addToCurrentRestCategory(categoryItem.reference);
                                                                                    setState(() {});
                                                                                    FFAppState().addToKatagoryRestName(categoryItem.name);
                                                                                    setState(() {});
                                                                                  }
                                                                                },
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Material(
                                                                                      color: Colors.transparent,
                                                                                      elevation: FFAppState().currentRestCategory.contains(categoryItem.reference) ? 4.0 : 0.0,
                                                                                      shape: RoundedRectangleBorder(
                                                                                        borderRadius: BorderRadius.circular(100.0),
                                                                                      ),
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(100.0),
                                                                                          border: Border.all(
                                                                                            color: FFAppState().currentRestCategory.contains(categoryItem.reference) ? FlutterFlowTheme.of(context).primary : Color(0xFF687781),
                                                                                            width: 2.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(100.0),
                                                                                          child: Image.network(
                                                                                            categoryItem.cover,
                                                                                            width: 65.0,
                                                                                            height: 65.0,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Text(
                                                                                        categoryItem.name,
                                                                                        textAlign: TextAlign.center,
                                                                                        maxLines: 2,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: Colors.black,
                                                                                              fontSize: 10.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }).divide(SizedBox(
                                                                            width:
                                                                                8.0)),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return GestureDetector(
                                                                            onTap: () => _model.unfocusNode.canRequestFocus
                                                                                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                                : FocusScope.of(context).unfocus(),
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: AllCategoeyCopyWidget(
                                                                                category: homeScreenCategoryOfRestaurantCuisineRecordList,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(100.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/IconSakhMarket.png',
                                                                            width:
                                                                                65.0,
                                                                            height:
                                                                                65.0,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Еще',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: Colors.black,
                                                                                  fontSize: 10.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 8.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                      ].divide(SizedBox(
                                                          height: 8.0)),
                                                    ),
                                                  ),
                                                  if (columnBannerRecord
                                                              ?.imageList !=
                                                          null &&
                                                      (columnBannerRecord
                                                              ?.imageList)!
                                                          .isNotEmpty)
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Builder(
                                                          builder: (context) {
                                                            final imageCar =
                                                                columnBannerRecord
                                                                        ?.imageList
                                                                        ?.toList() ??
                                                                    [];

                                                            return Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 200.0,
                                                              child:
                                                                  CarouselSlider
                                                                      .builder(
                                                                itemCount:
                                                                    imageCar
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        imageCarIndex,
                                                                        _) {
                                                                  final imageCarItem =
                                                                      imageCar[
                                                                          imageCarIndex];
                                                                  return Container(
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxHeight:
                                                                          200.0,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        imageCarItem,
                                                                        width: double
                                                                            .infinity,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                carouselController:
                                                                    _model.carouselController1 ??=
                                                                        CarouselController(),
                                                                options:
                                                                    CarouselOptions(
                                                                  initialPage: max(
                                                                      0,
                                                                      min(
                                                                          1,
                                                                          imageCar.length -
                                                                              1)),
                                                                  viewportFraction:
                                                                      1.0,
                                                                  disableCenter:
                                                                      true,
                                                                  enlargeCenterPage:
                                                                      false,
                                                                  enlargeFactor:
                                                                      0.0,
                                                                  enableInfiniteScroll:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  autoPlay:
                                                                      true,
                                                                  autoPlayAnimationDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              1),
                                                                  autoPlayInterval:
                                                                      Duration(
                                                                          milliseconds:
                                                                              (1 + 5000)),
                                                                  autoPlayCurve:
                                                                      Curves
                                                                          .linear,
                                                                  pauseAutoPlayInFiniteScroll:
                                                                      true,
                                                                  onPageChanged: (index,
                                                                          _) =>
                                                                      _model.carouselCurrentIndex1 =
                                                                          index,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 8.0)),
                                                    ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    6.0,
                                                                    0.0,
                                                                    6.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                InkWell(
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
                                                                    if (_model
                                                                        .sort!) {
                                                                      _model.sort =
                                                                          false;
                                                                      setState(
                                                                          () {});
                                                                      _model.sortRatinr =
                                                                          false;
                                                                      setState(
                                                                          () {});
                                                                      _model.sortName =
                                                                          false;
                                                                      setState(
                                                                          () {});
                                                                      _model.sortSum =
                                                                          false;
                                                                      setState(
                                                                          () {});
                                                                    } else {
                                                                      _model.sort =
                                                                          true;
                                                                      setState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (_model
                                                                              .sort ??
                                                                          true)
                                                                        Icon(
                                                                          Icons
                                                                              .expand_less,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      if (!_model
                                                                          .sort!)
                                                                        Icon(
                                                                          Icons
                                                                              .expand_more,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      Text(
                                                                        'Сортировка',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Montserrat',
                                                                              color: _model.sort! ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                InkWell(
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
                                                                    if (_model
                                                                        .filtr!) {
                                                                      _model.filtr =
                                                                          false;
                                                                      setState(
                                                                          () {});
                                                                    } else {
                                                                      _model.filtr =
                                                                          true;
                                                                      setState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        'Фильтр',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Montserrat',
                                                                              color: _model.filtr! ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      if (_model
                                                                              .filtr ??
                                                                          true)
                                                                        Icon(
                                                                          Icons
                                                                              .expand_less,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      if (!_model
                                                                          .filtr!)
                                                                        Icon(
                                                                          Icons
                                                                              .expand_more,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            if (_model.sort ??
                                                                true)
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      if (_model
                                                                          .sortRatinr!) {
                                                                        _model.sortRatinr =
                                                                            false;
                                                                        setState(
                                                                            () {});
                                                                      } else {
                                                                        _model.sortRatinr =
                                                                            true;
                                                                        _model.sortName =
                                                                            false;
                                                                        _model.sortSum =
                                                                            false;
                                                                        setState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                    child: Text(
                                                                      'рейтинг',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color: _model.sortRatinr!
                                                                                ? FlutterFlowTheme.of(context).primary
                                                                                : FlutterFlowTheme.of(context).primaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      if (_model
                                                                          .sortName!) {
                                                                        _model.sortName =
                                                                            false;
                                                                        setState(
                                                                            () {});
                                                                      } else {
                                                                        _model.sortName =
                                                                            true;
                                                                        _model.sortRatinr =
                                                                            false;
                                                                        _model.sortSum =
                                                                            false;
                                                                        setState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                    child: Text(
                                                                      'название',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color: _model.sortName!
                                                                                ? FlutterFlowTheme.of(context).primary
                                                                                : FlutterFlowTheme.of(context).primaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      if (_model
                                                                          .sortSum!) {
                                                                        _model.sortSum =
                                                                            false;
                                                                        setState(
                                                                            () {});
                                                                      } else {
                                                                        _model.sortSum =
                                                                            true;
                                                                        _model.sortName =
                                                                            false;
                                                                        _model.sortRatinr =
                                                                            false;
                                                                        setState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                    child: Text(
                                                                      'сумма заказа',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color: _model.sortSum!
                                                                                ? FlutterFlowTheme.of(context).primary
                                                                                : FlutterFlowTheme.of(context).primaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            if (_model.filtr ??
                                                                true)
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      if (_model
                                                                          .filtrCartPay!) {
                                                                        _model.filtrCartPay =
                                                                            false;
                                                                        setState(
                                                                            () {});
                                                                      } else {
                                                                        _model.filtrCartPay =
                                                                            true;
                                                                        setState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                    child: Text(
                                                                      'оплата картой',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color: _model.filtrCartPay!
                                                                                ? FlutterFlowTheme.of(context).primary
                                                                                : FlutterFlowTheme.of(context).primaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      if (_model
                                                                          .filtrDelivery!) {
                                                                        _model.filtrDelivery =
                                                                            false;
                                                                        setState(
                                                                            () {});
                                                                      } else {
                                                                        _model.filtrDelivery =
                                                                            true;
                                                                        setState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                    child: Text(
                                                                      'QR - код',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color: _model.filtrDelivery!
                                                                                ? FlutterFlowTheme.of(context).primary
                                                                                : FlutterFlowTheme.of(context).primaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      if (_model
                                                                          .filtrSamovivoz!) {
                                                                        _model.filtrSamovivoz =
                                                                            false;
                                                                        setState(
                                                                            () {});
                                                                      } else {
                                                                        _model.filtrSamovivoz =
                                                                            true;
                                                                        setState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                    child: Text(
                                                                      'самовывоз',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color: _model.filtrSamovivoz!
                                                                                ? FlutterFlowTheme.of(context).primary
                                                                                : FlutterFlowTheme.of(context).primaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                          ].divide(SizedBox(
                                                              height: 5.0)),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Рестораны',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                      Builder(
                                                        builder: (context) {
                                                          final listRest = functions
                                                              .filterRestaurantsByName(
                                                                  containerRestoranRecordList
                                                                      .toList(),
                                                                  _model
                                                                      .searchTextFieldTextController1
                                                                      .text,
                                                                  FFAppState()
                                                                      .katagoryRestName
                                                                      .unique(
                                                                          (e) =>
                                                                              e)
                                                                      .toList(),
                                                                  _model
                                                                      .sortName!,
                                                                  _model
                                                                      .sortRatinr!,
                                                                  _model
                                                                      .sortSum!,
                                                                  _model
                                                                      .filtrCartPay!,
                                                                  _model
                                                                      .filtrDelivery!,
                                                                  _model
                                                                      .filtrSamovivoz!)
                                                              .toList();

                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                child:
                                                                    Container(
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
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        'Place',
                                                                        queryParameters:
                                                                            {
                                                                          'restoran':
                                                                              serializeParam(
                                                                            listRestItem,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'restoran':
                                                                              listRestItem,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Stack(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              -1.0),
                                                                          children: [
                                                                            Stack(
                                                                              alignment: AlignmentDirectional(0.0, 1.0),
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: CarouselComponentWidget(
                                                                                    key: Key('Key0du_${listRestIndex}_of_${listRest.length}'),
                                                                                    restoran: listRestItem,
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 10.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                      ),
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        child: Image.network(
                                                                                          listRestItem.logo,
                                                                                          width: 60.0,
                                                                                          height: 60.0,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 16.0, 0.0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    AuthUserStreamWidget(
                                                                                      builder: (context) => FlutterFlowIconButton(
                                                                                        borderColor: (currentUserDocument?.favorit?.toList() ?? []).contains(listRestItem.reference) ? FlutterFlowTheme.of(context).error : Color(0xFF8A8A8A),
                                                                                        borderRadius: 15.0,
                                                                                        borderWidth: 2.0,
                                                                                        buttonSize: 40.0,
                                                                                        icon: Icon(
                                                                                          Icons.favorite_rounded,
                                                                                          color: (currentUserDocument?.favorit?.toList() ?? []).contains(listRestItem.reference) ? FlutterFlowTheme.of(context).error : Color(0xFF8A8A8A),
                                                                                          size: 25.0,
                                                                                        ),
                                                                                        onPressed: () async {
                                                                                          if (loggedIn) {
                                                                                            if ((currentUserDocument?.favorit?.toList() ?? []).contains(listRestItem.reference)) {
                                                                                              await currentUserReference!.update({
                                                                                                ...mapToFirestore(
                                                                                                  {
                                                                                                    'Favorit': FieldValue.arrayRemove([
                                                                                                      listRestItem.reference
                                                                                                    ]),
                                                                                                  },
                                                                                                ),
                                                                                              });
                                                                                            } else {
                                                                                              await currentUserReference!.update({
                                                                                                ...mapToFirestore(
                                                                                                  {
                                                                                                    'Favorit': FieldValue.arrayUnion([
                                                                                                      listRestItem.reference
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
                                                                                                  onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                  child: Padding(
                                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                                    child: StopGoLoginWidget(),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ).then((value) => safeSetState(() {}));
                                                                                          }
                                                                                        },
                                                                                      ),
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
                                                                                          listRestItem.name.maybeHandleOverflow(
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
                                                                                          listRestItem.minDiskription,
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
                                                                                  Column(
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
                                                                                            valueOrDefault<String>(
                                                                                              ((List<int> var1) {
                                                                                                return var1.isEmpty ? 0 : var1.reduce((a, b) => a + b) / var1.length;
                                                                                              }(listRestItem.summaRating.toList()))
                                                                                                  .toString(),
                                                                                              '0',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 5.0)),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.reviews_outlined,
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            size: 22.0,
                                                                                          ),
                                                                                          Text(
                                                                                            listRestItem.reviews.length.toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 5.0)),
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 5.0)),
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
                                                                                        'от ${listRestItem.minSumDelivery.toString()} руб.',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      if (listRestItem.cartPay)
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.solidCreditCard,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 22.0,
                                                                                        ),
                                                                                      if (listRestItem.cash)
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.wallet,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 22.0,
                                                                                        ),
                                                                                      if (listRestItem.pickup)
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.shoppingBasket,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 20.0,
                                                                                        ),
                                                                                      if (listRestItem.qrCode)
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
                                                            }),
                                                          );
                                                        },
                                                      ),
                                                      Builder(
                                                        builder: (context) {
                                                          final listRest = functions
                                                              .filterRestaurantsByNameClose(
                                                                  containerRestoranRecordList
                                                                      .toList(),
                                                                  _model
                                                                      .searchTextFieldTextController1
                                                                      .text,
                                                                  FFAppState()
                                                                      .katagoryRestName
                                                                      .unique(
                                                                          (e) =>
                                                                              e)
                                                                      .toList(),
                                                                  _model
                                                                      .sortName!,
                                                                  _model
                                                                      .sortRatinr!,
                                                                  _model
                                                                      .sortSum!,
                                                                  _model
                                                                      .filtrCartPay!,
                                                                  _model
                                                                      .filtrDelivery!,
                                                                  _model
                                                                      .filtrSamovivoz!)
                                                              .toList();

                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                child:
                                                                    Container(
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
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        'Place',
                                                                        queryParameters:
                                                                            {
                                                                          'restoran':
                                                                              serializeParam(
                                                                            listRestItem,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'restoran':
                                                                              listRestItem,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        ClipRect(
                                                                          child:
                                                                              ImageFiltered(
                                                                            imageFilter:
                                                                                ImageFilter.blur(
                                                                              sigmaX: 2.0,
                                                                              sigmaY: 2.0,
                                                                            ),
                                                                            child:
                                                                                Stack(
                                                                              alignment: AlignmentDirectional(1.0, -1.0),
                                                                              children: [
                                                                                Stack(
                                                                                  alignment: AlignmentDirectional(0.0, 1.0),
                                                                                  children: [
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: CarouselComponentWidget(
                                                                                        key: Key('Keyb0u_${listRestIndex}_of_${listRest.length}'),
                                                                                        restoran: listRestItem,
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 10.0),
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                            child: Image.network(
                                                                                              listRestItem.logo,
                                                                                              width: 60.0,
                                                                                              height: 60.0,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 16.0, 0.0),
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        AuthUserStreamWidget(
                                                                                          builder: (context) => FlutterFlowIconButton(
                                                                                            borderColor: (currentUserDocument?.favorit?.toList() ?? []).contains(listRestItem.reference) ? FlutterFlowTheme.of(context).error : Color(0xFF8A8A8A),
                                                                                            borderRadius: 15.0,
                                                                                            borderWidth: 2.0,
                                                                                            buttonSize: 40.0,
                                                                                            icon: Icon(
                                                                                              Icons.favorite_rounded,
                                                                                              color: (currentUserDocument?.favorit?.toList() ?? []).contains(listRestItem.reference) ? FlutterFlowTheme.of(context).error : Color(0xFF8A8A8A),
                                                                                              size: 25.0,
                                                                                            ),
                                                                                            onPressed: () async {
                                                                                              if (loggedIn) {
                                                                                                if ((currentUserDocument?.favorit?.toList() ?? []).contains(listRestItem.reference)) {
                                                                                                  await currentUserReference!.update({
                                                                                                    ...mapToFirestore(
                                                                                                      {
                                                                                                        'Favorit': FieldValue.arrayRemove([listRestItem.reference]),
                                                                                                      },
                                                                                                    ),
                                                                                                  });
                                                                                                } else {
                                                                                                  await currentUserReference!.update({
                                                                                                    ...mapToFirestore(
                                                                                                      {
                                                                                                        'Favorit': FieldValue.arrayUnion([listRestItem.reference]),
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
                                                                                                      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                      child: Padding(
                                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                                        child: StopGoLoginWidget(),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ).then((value) => safeSetState(() {}));
                                                                                              }
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
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
                                                                                    'Закрыт до: ${dateTimeFormat('HH:mm', listRestItem.timeStart)}',
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
                                                                                          listRestItem.name.maybeHandleOverflow(
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
                                                                                          listRestItem.minDiskription,
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
                                                                                  Column(
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
                                                                                            valueOrDefault<String>(
                                                                                              ((List<int> var1) {
                                                                                                return var1.isEmpty ? 0 : var1.reduce((a, b) => a + b) / var1.length;
                                                                                              }(listRestItem.summaRating.toList()))
                                                                                                  .toString(),
                                                                                              '0',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 5.0)),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.reviews_outlined,
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            size: 22.0,
                                                                                          ),
                                                                                          Text(
                                                                                            listRestItem.reviews.length.toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 5.0)),
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 5.0)),
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
                                                                                        'от ${listRestItem.minSumDelivery.toString()} руб.',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      if (listRestItem.cartPay)
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.solidCreditCard,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 22.0,
                                                                                        ),
                                                                                      if (listRestItem.cash)
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.wallet,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 22.0,
                                                                                        ),
                                                                                      if (listRestItem.pickup)
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.shoppingBasket,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 20.0,
                                                                                        ),
                                                                                      if (listRestItem.qrCode)
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
                                                            }),
                                                          );
                                                        },
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 8.0)),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 15.0)),
                                              ),
                                            ),
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
                                  Flexible(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 5.0, 8.0, 0.0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      tabletLandscape: false,
                                                      desktop: false,
                                                    ))
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .arrow_drop_down,
                                                                      color: Color(
                                                                          0x7F757575),
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      'Южно-сахалинск',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                14.0,
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
                                                          ],
                                                        ),
                                                      ),
                                                    if (columnBannerRecord
                                                                ?.imageList !=
                                                            null &&
                                                        (columnBannerRecord
                                                                ?.imageList)!
                                                            .isNotEmpty)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                final imageCar =
                                                                    columnBannerRecord
                                                                            ?.imageList
                                                                            ?.toList() ??
                                                                        [];

                                                                return Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 300.0,
                                                                  child: CarouselSlider
                                                                      .builder(
                                                                    itemCount:
                                                                        imageCar
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            imageCarIndex,
                                                                            _) {
                                                                      final imageCarItem =
                                                                          imageCar[
                                                                              imageCarIndex];
                                                                      return Container(
                                                                        constraints:
                                                                            BoxConstraints(
                                                                          maxHeight:
                                                                              400.0,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            imageCarItem,
                                                                            width:
                                                                                double.infinity,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                    carouselController:
                                                                        _model.carouselController2 ??=
                                                                            CarouselController(),
                                                                    options:
                                                                        CarouselOptions(
                                                                      initialPage: max(
                                                                          0,
                                                                          min(1,
                                                                              imageCar.length - 1)),
                                                                      viewportFraction:
                                                                          1.0,
                                                                      disableCenter:
                                                                          true,
                                                                      enlargeCenterPage:
                                                                          false,
                                                                      enlargeFactor:
                                                                          0.0,
                                                                      enableInfiniteScroll:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      autoPlay:
                                                                          true,
                                                                      autoPlayAnimationDuration:
                                                                          Duration(
                                                                              milliseconds: 1),
                                                                      autoPlayInterval:
                                                                          Duration(
                                                                              milliseconds: (1 + 5000)),
                                                                      autoPlayCurve:
                                                                          Curves
                                                                              .linear,
                                                                      pauseAutoPlayInFiniteScroll:
                                                                          true,
                                                                      onPageChanged: (index,
                                                                              _) =>
                                                                          _model.carouselCurrentIndex2 =
                                                                              index,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 8.0)),
                                                        ),
                                                      ),
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      tabletLandscape: false,
                                                      desktop: false,
                                                    ))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .searchTextFieldTextController2,
                                                                  focusNode: _model
                                                                      .searchTextFieldFocusNode2,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.searchTextFieldTextController2',
                                                                    Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    () async {
                                                                      FFAppState()
                                                                              .searchText =
                                                                          _model
                                                                              .searchTextFieldTextController2
                                                                              .text;
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                  ),
                                                                  autofocus:
                                                                      false,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Поиск',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          letterSpacing:
                                                                              0.0,
                                                                          lineHeight:
                                                                              1.0,
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x37000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x37000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15.0),
                                                                    ),
                                                                    prefixIcon:
                                                                        Icon(
                                                                      Icons
                                                                          .search_rounded,
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        lineHeight:
                                                                            1.0,
                                                                      ),
                                                                  maxLines:
                                                                      null,
                                                                  validator: _model
                                                                      .searchTextFieldTextController2Validator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          if (_model.searchTextFieldTextController2
                                                                      .text !=
                                                                  null &&
                                                              _model.searchTextFieldTextController2
                                                                      .text !=
                                                                  '')
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                setState(() {
                                                                  _model
                                                                      .searchTextFieldTextController2
                                                                      ?.clear();
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .close_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    Container(
                                                      width: double.infinity,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                if (FFAppState()
                                                                    .currentRestCategory
                                                                    .isNotEmpty)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        FFAppState().currentRestCategory =
                                                                            [];
                                                                        FFAppState()
                                                                            .update(() {});
                                                                        FFAppState().katagoryRestName =
                                                                            [];
                                                                        FFAppState()
                                                                            .update(() {});
                                                                      },
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                65.0,
                                                                            height:
                                                                                65.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.white,
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                'X',
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      fontSize: 36.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              'Очистить',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: Colors.black,
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 8.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final category = homeScreenCategoryOfRestaurantCuisineRecordList
                                                                          .toList()
                                                                          .take(
                                                                              25)
                                                                          .toList();

                                                                      return Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: List.generate(
                                                                            category.length,
                                                                            (categoryIndex) {
                                                                          final categoryItem =
                                                                              category[categoryIndex];
                                                                          return Container(
                                                                            width:
                                                                                75.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                if (FFAppState().currentRestCategory.contains(categoryItem.reference)) {
                                                                                  FFAppState().removeFromCurrentRestCategory(categoryItem.reference);
                                                                                  setState(() {});
                                                                                  FFAppState().removeFromKatagoryRestName(categoryItem.name);
                                                                                  setState(() {});
                                                                                } else {
                                                                                  FFAppState().addToCurrentRestCategory(categoryItem.reference);
                                                                                  setState(() {});
                                                                                  FFAppState().addToKatagoryRestName(categoryItem.name);
                                                                                  setState(() {});
                                                                                }
                                                                              },
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Material(
                                                                                    color: Colors.transparent,
                                                                                    elevation: FFAppState().currentRestCategory.contains(categoryItem.reference) ? 4.0 : 0.0,
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(100.0),
                                                                                    ),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(100.0),
                                                                                        border: Border.all(
                                                                                          color: FFAppState().currentRestCategory.contains(categoryItem.reference) ? FlutterFlowTheme.of(context).primary : Color(0xFF687781),
                                                                                          width: 2.0,
                                                                                        ),
                                                                                      ),
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(100.0),
                                                                                        child: Image.network(
                                                                                          categoryItem.cover,
                                                                                          width: 65.0,
                                                                                          height: 65.0,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Text(
                                                                                      categoryItem.name,
                                                                                      textAlign: TextAlign.center,
                                                                                      maxLines: 2,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: Colors.black,
                                                                                            fontSize: 10.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 8.0)),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }).divide(SizedBox(
                                                                            width:
                                                                                8.0)),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return GestureDetector(
                                                                            onTap: () => _model.unfocusNode.canRequestFocus
                                                                                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                                : FocusScope.of(context).unfocus(),
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: AllCategoeyCopyWidget(
                                                                                category: homeScreenCategoryOfRestaurantCuisineRecordList,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(100.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/IconSakhMarket.png',
                                                                            width:
                                                                                65.0,
                                                                            height:
                                                                                65.0,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Еще',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: Colors.black,
                                                                                  fontSize: 10.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 8.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 8.0)),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        6.0,
                                                                        0.0,
                                                                        6.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        if (_model
                                                                            .sort!) {
                                                                          _model.sort =
                                                                              false;
                                                                          setState(
                                                                              () {});
                                                                          _model.sortRatinr =
                                                                              false;
                                                                          setState(
                                                                              () {});
                                                                          _model.sortName =
                                                                              false;
                                                                          setState(
                                                                              () {});
                                                                          _model.sortSum =
                                                                              false;
                                                                          setState(
                                                                              () {});
                                                                        } else {
                                                                          _model.sort =
                                                                              true;
                                                                          setState(
                                                                              () {});
                                                                        }
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          if (_model.sort ??
                                                                              true)
                                                                            Icon(
                                                                              Icons.expand_less,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 24.0,
                                                                            ),
                                                                          if (!_model
                                                                              .sort!)
                                                                            Icon(
                                                                              Icons.expand_more,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                          Text(
                                                                            'Сортировка',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: _model.sort! ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        if (_model
                                                                            .filtr!) {
                                                                          _model.filtr =
                                                                              false;
                                                                          setState(
                                                                              () {});
                                                                        } else {
                                                                          _model.filtr =
                                                                              true;
                                                                          setState(
                                                                              () {});
                                                                        }
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            'Фильтр',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: _model.filtr! ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          if (_model.filtr ??
                                                                              true)
                                                                            Icon(
                                                                              Icons.expand_less,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 24.0,
                                                                            ),
                                                                          if (!_model
                                                                              .filtr!)
                                                                            Icon(
                                                                              Icons.expand_more,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                if (_model
                                                                        .sort ??
                                                                    true)
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          350.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              if (_model.sortRatinr!) {
                                                                                _model.sortRatinr = false;
                                                                                setState(() {});
                                                                              } else {
                                                                                _model.sortRatinr = true;
                                                                                _model.sortName = false;
                                                                                _model.sortSum = false;
                                                                                setState(() {});
                                                                              }
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              'рейтинг',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: _model.sortRatinr! ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              if (_model.sortName!) {
                                                                                _model.sortName = false;
                                                                                setState(() {});
                                                                              } else {
                                                                                _model.sortName = true;
                                                                                _model.sortRatinr = false;
                                                                                _model.sortSum = false;
                                                                                setState(() {});
                                                                              }
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              'название',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: _model.sortName! ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              if (_model.sortSum!) {
                                                                                _model.sortSum = false;
                                                                                setState(() {});
                                                                              } else {
                                                                                _model.sortSum = true;
                                                                                _model.sortName = false;
                                                                                _model.sortRatinr = false;
                                                                                setState(() {});
                                                                              }
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              'сумма заказа',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: _model.sortSum! ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (_model
                                                                        .filtr ??
                                                                    true)
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          350.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              if (_model.filtrCartPay!) {
                                                                                _model.filtrCartPay = false;
                                                                                setState(() {});
                                                                              } else {
                                                                                _model.filtrCartPay = true;
                                                                                setState(() {});
                                                                              }
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              'оплата картой',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: _model.filtrCartPay! ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              if (_model.filtrDelivery!) {
                                                                                _model.filtrDelivery = false;
                                                                                setState(() {});
                                                                              } else {
                                                                                _model.filtrDelivery = true;
                                                                                setState(() {});
                                                                              }
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              'QR - код',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: _model.filtrDelivery! ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              if (_model.filtrSamovivoz!) {
                                                                                _model.filtrSamovivoz = false;
                                                                                setState(() {});
                                                                              } else {
                                                                                _model.filtrSamovivoz = true;
                                                                                setState(() {});
                                                                              }
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              'самовывоз',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: _model.filtrSamovivoz! ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ].divide(SizedBox(
                                                                  height: 5.0)),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Рестораны',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .stretch,
                                                            children: [
                                                              Builder(
                                                                builder:
                                                                    (context) {
                                                                  final listRest = functions
                                                                      .filterRestaurantsByName(
                                                                          containerRestoranRecordList
                                                                              .toList(),
                                                                          _model
                                                                              .testTextController
                                                                              .text,
                                                                          FFAppState()
                                                                              .katagoryRestName
                                                                              .unique((e) =>
                                                                                  e)
                                                                              .toList(),
                                                                          _model
                                                                              .sortName!,
                                                                          _model
                                                                              .sortRatinr!,
                                                                          _model
                                                                              .sortSum!,
                                                                          _model
                                                                              .filtrCartPay!,
                                                                          _model
                                                                              .filtrDelivery!,
                                                                          _model
                                                                              .filtrSamovivoz!)
                                                                      .toList();

                                                                  return Wrap(
                                                                    spacing:
                                                                        29.0,
                                                                    runSpacing:
                                                                        20.0,
                                                                    alignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        WrapCrossAlignment
                                                                            .start,
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    runAlignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    verticalDirection:
                                                                        VerticalDirection
                                                                            .down,
                                                                    clipBehavior:
                                                                        Clip.none,
                                                                    children: List.generate(
                                                                        listRest
                                                                            .length,
                                                                        (listRestIndex) {
                                                                      final listRestItem =
                                                                          listRest[
                                                                              listRestIndex];
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              345.0,
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            maxWidth:
                                                                                300.0,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 4.0,
                                                                                color: Color(0x32000000),
                                                                                offset: Offset(
                                                                                  0.0,
                                                                                  2.0,
                                                                                ),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed(
                                                                                'Place',
                                                                                queryParameters: {
                                                                                  'restoran': serializeParam(
                                                                                    listRestItem,
                                                                                    ParamType.Document,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                                extra: <String, dynamic>{
                                                                                  'restoran': listRestItem,
                                                                                },
                                                                              );
                                                                            },
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Stack(
                                                                                      alignment: AlignmentDirectional(1.0, -1.0),
                                                                                      children: [
                                                                                        Stack(
                                                                                          alignment: AlignmentDirectional(0.0, 1.0),
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: CarouselComponentWidget(
                                                                                                key: Key('Key86n_${listRestIndex}_of_${listRest.length}'),
                                                                                                restoran: listRestItem,
                                                                                              ),
                                                                                            ),
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 10.0),
                                                                                                child: ClipRRect(
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                  child: Image.network(
                                                                                                    listRestItem.logo,
                                                                                                    width: 60.0,
                                                                                                    height: 60.0,
                                                                                                    fit: BoxFit.cover,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 16.0, 0.0),
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(),
                                                                                            child: AuthUserStreamWidget(
                                                                                              builder: (context) => FlutterFlowIconButton(
                                                                                                borderColor: (currentUserDocument?.favorit?.toList() ?? []).contains(listRestItem.reference) ? FlutterFlowTheme.of(context).error : Color(0xFF8A8A8A),
                                                                                                borderRadius: 15.0,
                                                                                                borderWidth: 2.0,
                                                                                                buttonSize: 40.0,
                                                                                                icon: Icon(
                                                                                                  Icons.favorite_rounded,
                                                                                                  color: (currentUserDocument?.favorit?.toList() ?? []).contains(listRestItem.reference) ? FlutterFlowTheme.of(context).error : Color(0xFF8A8A8A),
                                                                                                  size: 25.0,
                                                                                                ),
                                                                                                onPressed: () async {
                                                                                                  if (loggedIn) {
                                                                                                    if ((currentUserDocument?.favorit?.toList() ?? []).contains(listRestItem.reference)) {
                                                                                                      await currentUserReference!.update({
                                                                                                        ...mapToFirestore(
                                                                                                          {
                                                                                                            'Favorit': FieldValue.arrayRemove([listRestItem.reference]),
                                                                                                          },
                                                                                                        ),
                                                                                                      });
                                                                                                    } else {
                                                                                                      await currentUserReference!.update({
                                                                                                        ...mapToFirestore(
                                                                                                          {
                                                                                                            'Favorit': FieldValue.arrayUnion([listRestItem.reference]),
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
                                                                                                          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                          child: Padding(
                                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                                            child: StopGoLoginWidget(),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ).then((value) => safeSetState(() {}));
                                                                                                  }
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  listRestItem.name.maybeHandleOverflow(
                                                                                                    maxChars: 36,
                                                                                                    replacement: '…',
                                                                                                  ),
                                                                                                  maxLines: 2,
                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                        fontFamily: 'Outfit',
                                                                                                        color: Color(0xFF101213),
                                                                                                        fontSize: 20.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                      ),
                                                                                                ),
                                                                                                Text(
                                                                                                  listRestItem.minDiskription,
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
                                                                                          Column(
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
                                                                                                    valueOrDefault<String>(
                                                                                                      ((List<int> var1) {
                                                                                                        return var1.isEmpty ? 0 : var1.reduce((a, b) => a + b) / var1.length;
                                                                                                      }(listRestItem.summaRating.toList()))
                                                                                                          .toString(),
                                                                                                      '0',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Montserrat',
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Icon(
                                                                                                    Icons.reviews_outlined,
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    size: 22.0,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    listRestItem.reviews.length.toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Montserrat',
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                              ),
                                                                                            ].divide(SizedBox(height: 5.0)),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 10.0)),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 8.0),
                                                                                  child: Row(
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
                                                                                            'от ${listRestItem.minSumDelivery.toString()} руб.',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          if (listRestItem.cartPay)
                                                                                            FaIcon(
                                                                                              FontAwesomeIcons.solidCreditCard,
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              size: 22.0,
                                                                                            ),
                                                                                          if (listRestItem.cash)
                                                                                            FaIcon(
                                                                                              FontAwesomeIcons.wallet,
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              size: 22.0,
                                                                                            ),
                                                                                          if (listRestItem.pickup)
                                                                                            FaIcon(
                                                                                              FontAwesomeIcons.shoppingBasket,
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              size: 20.0,
                                                                                            ),
                                                                                          if (listRestItem.qrCode)
                                                                                            Icon(
                                                                                              Icons.qr_code,
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              size: 23.0,
                                                                                            ),
                                                                                        ].divide(SizedBox(width: 5.0)),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(height: 5.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }),
                                                                  );
                                                                },
                                                              ),
                                                              Builder(
                                                                builder:
                                                                    (context) {
                                                                  final listRest = functions
                                                                      .filterRestaurantsByNameClose(
                                                                          containerRestoranRecordList
                                                                              .toList(),
                                                                          _model
                                                                              .testTextController
                                                                              .text,
                                                                          FFAppState()
                                                                              .katagoryRestName
                                                                              .unique((e) =>
                                                                                  e)
                                                                              .toList(),
                                                                          _model
                                                                              .sortName!,
                                                                          _model
                                                                              .sortRatinr!,
                                                                          _model
                                                                              .sortSum!,
                                                                          _model
                                                                              .filtrCartPay!,
                                                                          _model
                                                                              .filtrDelivery!,
                                                                          _model
                                                                              .filtrSamovivoz!)
                                                                      .toList();

                                                                  return Wrap(
                                                                    spacing:
                                                                        29.0,
                                                                    runSpacing:
                                                                        20.0,
                                                                    alignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        WrapCrossAlignment
                                                                            .start,
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    runAlignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    verticalDirection:
                                                                        VerticalDirection
                                                                            .down,
                                                                    clipBehavior:
                                                                        Clip.none,
                                                                    children: List.generate(
                                                                        listRest
                                                                            .length,
                                                                        (listRestIndex) {
                                                                      final listRestItem =
                                                                          listRest[
                                                                              listRestIndex];
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              385.0,
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            maxWidth:
                                                                                300.0,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 4.0,
                                                                                color: Color(0x32000000),
                                                                                offset: Offset(
                                                                                  0.0,
                                                                                  2.0,
                                                                                ),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed(
                                                                                'Place',
                                                                                queryParameters: {
                                                                                  'restoran': serializeParam(
                                                                                    listRestItem,
                                                                                    ParamType.Document,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                                extra: <String, dynamic>{
                                                                                  'restoran': listRestItem,
                                                                                },
                                                                              );
                                                                            },
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Stack(
                                                                                      alignment: AlignmentDirectional(1.0, -1.0),
                                                                                      children: [
                                                                                        Stack(
                                                                                          alignment: AlignmentDirectional(0.0, 1.0),
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: CarouselComponentWidget(
                                                                                                key: Key('Keyvl2_${listRestIndex}_of_${listRest.length}'),
                                                                                                restoran: listRestItem,
                                                                                              ),
                                                                                            ),
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 10.0),
                                                                                                child: ClipRRect(
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                  child: Image.network(
                                                                                                    listRestItem.logo,
                                                                                                    width: 60.0,
                                                                                                    height: 60.0,
                                                                                                    fit: BoxFit.cover,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 16.0, 0.0),
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(),
                                                                                            child: AuthUserStreamWidget(
                                                                                              builder: (context) => FlutterFlowIconButton(
                                                                                                borderColor: (currentUserDocument?.favorit?.toList() ?? []).contains(listRestItem.reference) ? FlutterFlowTheme.of(context).error : Color(0xFF8A8A8A),
                                                                                                borderRadius: 15.0,
                                                                                                borderWidth: 2.0,
                                                                                                buttonSize: 40.0,
                                                                                                icon: Icon(
                                                                                                  Icons.favorite_rounded,
                                                                                                  color: (currentUserDocument?.favorit?.toList() ?? []).contains(listRestItem.reference) ? FlutterFlowTheme.of(context).error : Color(0xFF8A8A8A),
                                                                                                  size: 25.0,
                                                                                                ),
                                                                                                onPressed: () async {
                                                                                                  if (loggedIn) {
                                                                                                    if ((currentUserDocument?.favorit?.toList() ?? []).contains(listRestItem.reference)) {
                                                                                                      await currentUserReference!.update({
                                                                                                        ...mapToFirestore(
                                                                                                          {
                                                                                                            'Favorit': FieldValue.arrayRemove([listRestItem.reference]),
                                                                                                          },
                                                                                                        ),
                                                                                                      });
                                                                                                    } else {
                                                                                                      await currentUserReference!.update({
                                                                                                        ...mapToFirestore(
                                                                                                          {
                                                                                                            'Favorit': FieldValue.arrayUnion([listRestItem.reference]),
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
                                                                                                          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                          child: Padding(
                                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                                            child: StopGoLoginWidget(),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ).then((value) => safeSetState(() {}));
                                                                                                  }
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
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
                                                                                            'Закрыт до: ${dateTimeFormat('HH:mm', listRestItem.timeStart)}',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  listRestItem.name.maybeHandleOverflow(
                                                                                                    maxChars: 36,
                                                                                                    replacement: '…',
                                                                                                  ),
                                                                                                  maxLines: 2,
                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                        fontFamily: 'Outfit',
                                                                                                        color: Color(0xFF101213),
                                                                                                        fontSize: 20.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                      ),
                                                                                                ),
                                                                                                Text(
                                                                                                  listRestItem.minDiskription,
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
                                                                                          Column(
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
                                                                                                    listRestItem.rating.toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Montserrat',
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Icon(
                                                                                                    Icons.reviews_outlined,
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    size: 22.0,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    '24',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Montserrat',
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                              ),
                                                                                            ].divide(SizedBox(height: 5.0)),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 10.0)),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 8.0),
                                                                                  child: Row(
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
                                                                                            'от ${listRestItem.minSumDelivery.toString()} руб.',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          if (listRestItem.cartPay)
                                                                                            FaIcon(
                                                                                              FontAwesomeIcons.solidCreditCard,
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              size: 22.0,
                                                                                            ),
                                                                                          if (listRestItem.cash)
                                                                                            FaIcon(
                                                                                              FontAwesomeIcons.wallet,
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              size: 22.0,
                                                                                            ),
                                                                                          if (listRestItem.pickup)
                                                                                            FaIcon(
                                                                                              FontAwesomeIcons.shoppingBasket,
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              size: 20.0,
                                                                                            ),
                                                                                          if (listRestItem.qrCode)
                                                                                            Icon(
                                                                                              Icons.qr_code,
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              size: 23.0,
                                                                                            ),
                                                                                        ].divide(SizedBox(width: 5.0)),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }),
                                                                  );
                                                                },
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 15.0)),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 8.0)),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 20.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
