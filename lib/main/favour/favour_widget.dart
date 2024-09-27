import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/place_component/place_component_widget.dart';
import '/main/stop_login/stop_login_widget.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'favour_model.dart';
export 'favour_model.dart';

class FavourWidget extends StatefulWidget {
  const FavourWidget({super.key});

  @override
  State<FavourWidget> createState() => _FavourWidgetState();
}

class _FavourWidgetState extends State<FavourWidget>
    with TickerProviderStateMixin {
  late FavourModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavourModel());

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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Stack(
              children: [
                if (loggedIn)
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 1265.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 1440.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (responsiveVisibility(
                                            context: context,
                                            tabletLandscape: false,
                                            desktop: false,
                                          ))
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 25.0, 0.0, 0.0),
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        'Избранное',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontSize: 20.0,
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
                                            ),
                                          Flexible(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 25.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(40.0, 0.0,
                                                                40.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Stack(
                                                        children: [
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            tablet: false,
                                                            tabletLandscape:
                                                                false,
                                                            desktop: false,
                                                          ))
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
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
                                                                        _model.shop =
                                                                            true;
                                                                        _model.item =
                                                                            false;
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.35,
                                                                        height:
                                                                            30.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: _model.shop!
                                                                              ? Color(0xFFFEFEE4)
                                                                              : FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(30.0),
                                                                          border:
                                                                              Border.all(
                                                                            color: _model.shop!
                                                                                ? FlutterFlowTheme.of(context).primary
                                                                                : Color(0xFFD3D1D8),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'ЗАВЕДЕНИЯ',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
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
                                                                        _model.shop =
                                                                            false;
                                                                        _model.item =
                                                                            true;
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.35,
                                                                        height:
                                                                            30.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: _model.item!
                                                                              ? Color(0xFFFEFEE4)
                                                                              : FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(30.0),
                                                                          border:
                                                                              Border.all(
                                                                            color: _model.item!
                                                                                ? FlutterFlowTheme.of(context).primary
                                                                                : Color(0xFFD3D1D8),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'ТОВАРЫ',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        35.0)),
                                                              ),
                                                            ),
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                          ))
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  Flexible(
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
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
                                                                          _model.shop =
                                                                              true;
                                                                          _model.item =
                                                                              false;
                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.3,
                                                                          height:
                                                                              40.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: _model.shop!
                                                                                ? Color(0xFFFEFEE4)
                                                                                : FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(30.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: _model.shop! ? FlutterFlowTheme.of(context).primary : Color(0xFFD3D1D8),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              'ЗАВЕДЕНИЯ',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
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
                                                                          _model.shop =
                                                                              false;
                                                                          _model.item =
                                                                              true;
                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.3,
                                                                          height:
                                                                              40.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: _model.item!
                                                                                ? Color(0xFFFEFEE4)
                                                                                : FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(30.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: _model.item! ? FlutterFlowTheme.of(context).primary : Color(0xFFD3D1D8),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              'ТОВАРЫ',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        40.0)),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  if ((_model.shop ?? true) &&
                                                      responsiveVisibility(
                                                        context: context,
                                                        tabletLandscape: false,
                                                        desktop: false,
                                                      ))
                                                    Flexible(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child:
                                                              AuthUserStreamWidget(
                                                            builder:
                                                                (context) =>
                                                                    Builder(
                                                              builder:
                                                                  (context) {
                                                                final listFavorit =
                                                                    (currentUserDocument?.favorit?.toList() ??
                                                                            [])
                                                                        .toList();

                                                                return ListView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      listFavorit
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          listFavoritIndex) {
                                                                    final listFavoritItem =
                                                                        listFavorit[
                                                                            listFavoritIndex];
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                      child: StreamBuilder<
                                                                          RestoranRecord>(
                                                                        stream:
                                                                            RestoranRecord.getDocument(listFavoritItem),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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

                                                                          final houseCardRestoranRecord =
                                                                              snapshot.data!;

                                                                          return Container(
                                                                            width:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.white,
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
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Visibility(
                                                                              visible: houseCardRestoranRecord.visible == true,
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  context.pushNamed(
                                                                                    'place',
                                                                                    queryParameters: {
                                                                                      'restoran': serializeParam(
                                                                                        houseCardRestoranRecord,
                                                                                        ParamType.Document,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                    extra: <String, dynamic>{
                                                                                      'restoran': houseCardRestoranRecord,
                                                                                    },
                                                                                  );
                                                                                },
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Stack(
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(0.0, 1.0),
                                                                                          child: Stack(
                                                                                            alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                            children: [
                                                                                              PlaceComponentWidget(
                                                                                                key: Key('Key5as_${listFavoritIndex}_of_${listFavorit.length}'),
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
                                                                                          alignment: AlignmentDirectional(0.0, -1.0),
                                                                                          child: Padding(
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
                                                                                                      child: FlutterFlowIconButton(
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
                                                                                                                    'Favorit': FieldValue.arrayRemove([houseCardRestoranRecord.reference]),
                                                                                                                  },
                                                                                                                ),
                                                                                                              });
                                                                                                            } else {
                                                                                                              await currentUserReference!.update({
                                                                                                                ...mapToFirestore(
                                                                                                                  {
                                                                                                                    'Favorit': FieldValue.arrayUnion([houseCardRestoranRecord.reference]),
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
                                                                                                  ].divide(SizedBox(width: 10.0)),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 8.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          if (functions.isRestaurantOutsideWorkingHours(houseCardRestoranRecord)! || (houseCardRestoranRecord.isClosedUntilTomorrow == true))
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
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (_model.item ?? true)
                                                    Flexible(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child:
                                                              AuthUserStreamWidget(
                                                            builder:
                                                                (context) =>
                                                                    Builder(
                                                              builder:
                                                                  (context) {
                                                                final favirotItem =
                                                                    (currentUserDocument?.favoritTovar?.toList() ??
                                                                            [])
                                                                        .toList();

                                                                return ListView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      favirotItem
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          favirotItemIndex) {
                                                                    final favirotItemItem =
                                                                        favirotItem[
                                                                            favirotItemIndex];
                                                                    return StreamBuilder<
                                                                        MenuRecord>(
                                                                      stream: MenuRecord
                                                                          .getDocument(
                                                                              favirotItemItem),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 60.0,
                                                                              height: 60.0,
                                                                              child: SpinKitPulse(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 60.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }

                                                                        final containerMenuRecord =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                20.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  containerMenuRecord.restoranName,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    context.pushNamed(
                                                                                      'currentItem',
                                                                                      queryParameters: {
                                                                                        'currentTovar': serializeParam(
                                                                                          containerMenuRecord,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'currentTovar': containerMenuRecord,
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    height: 140.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(10.0),
                                                                                        bottomRight: Radius.circular(0.0),
                                                                                        topLeft: Radius.circular(10.0),
                                                                                        topRight: Radius.circular(0.0),
                                                                                      ),
                                                                                    ),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                      children: [
                                                                                        Stack(
                                                                                          alignment: AlignmentDirectional(1.0, -1.0),
                                                                                          children: [
                                                                                            Container(
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                borderRadius: BorderRadius.only(
                                                                                                  bottomLeft: Radius.circular(10.0),
                                                                                                  bottomRight: Radius.circular(0.0),
                                                                                                  topLeft: Radius.circular(10.0),
                                                                                                  topRight: Radius.circular(0.0),
                                                                                                ),
                                                                                              ),
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.only(
                                                                                                  bottomLeft: Radius.circular(10.0),
                                                                                                  bottomRight: Radius.circular(0.0),
                                                                                                  topLeft: Radius.circular(10.0),
                                                                                                  topRight: Radius.circular(0.0),
                                                                                                ),
                                                                                                child: CachedNetworkImage(
                                                                                                  fadeInDuration: Duration(milliseconds: 500),
                                                                                                  fadeOutDuration: Duration(milliseconds: 500),
                                                                                                  imageUrl: containerMenuRecord.image.first,
                                                                                                  width: 140.0,
                                                                                                  height: 140.0,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                              child: FlutterFlowIconButton(
                                                                                                borderColor: (currentUserDocument?.favoritTovar?.toList() ?? []).contains(favirotItemItem) ? FlutterFlowTheme.of(context).error : Color(0xFF8A8A8A),
                                                                                                borderRadius: 15.0,
                                                                                                borderWidth: 2.0,
                                                                                                buttonSize: 35.0,
                                                                                                icon: Icon(
                                                                                                  Icons.favorite_rounded,
                                                                                                  color: (currentUserDocument?.favoritTovar?.toList() ?? []).contains(favirotItemItem) ? FlutterFlowTheme.of(context).error : Color(0xFF8A8A8A),
                                                                                                  size: 20.0,
                                                                                                ),
                                                                                                onPressed: () async {
                                                                                                  if (loggedIn) {
                                                                                                    if ((currentUserDocument?.favoritTovar?.toList() ?? []).contains(favirotItemItem)) {
                                                                                                      await currentUserReference!.update({
                                                                                                        ...mapToFirestore(
                                                                                                          {
                                                                                                            'FavoritTovar': FieldValue.arrayRemove([favirotItemItem]),
                                                                                                          },
                                                                                                        ),
                                                                                                      });
                                                                                                    } else {
                                                                                                      await currentUserReference!.update({
                                                                                                        ...mapToFirestore(
                                                                                                          {
                                                                                                            'FavoritTovar': FieldValue.arrayUnion([favirotItemItem]),
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
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 10.0, 12.0, 10.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      containerMenuRecord.name,
                                                                                                      textAlign: TextAlign.start,
                                                                                                      maxLines: 2,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Montserrat',
                                                                                                            fontSize: 14.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      '${containerMenuRecord.description}     ${containerMenuRecord.ves} г.',
                                                                                                      maxLines: 3,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Montserrat',
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 6.0)),
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        if (containerMenuRecord.oldPrice > 1.0)
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                formatNumber(
                                                                                                                  containerMenuRecord.oldPrice,
                                                                                                                  formatType: FormatType.custom,
                                                                                                                  format: '0',
                                                                                                                  locale: '',
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Montserrat',
                                                                                                                      color: FlutterFlowTheme.of(context).accent2,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                      decoration: TextDecoration.lineThrough,
                                                                                                                    ),
                                                                                                              ),
                                                                                                              Icon(
                                                                                                                Icons.currency_ruble,
                                                                                                                color: FlutterFlowTheme.of(context).accent2,
                                                                                                                size: 16.0,
                                                                                                              ),
                                                                                                            ].divide(SizedBox(width: 3.0)),
                                                                                                          ),
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              formatNumber(
                                                                                                                containerMenuRecord.price,
                                                                                                                formatType: FormatType.custom,
                                                                                                                format: '0',
                                                                                                                locale: '',
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Montserrat',
                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                    fontSize: 19.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Icon(
                                                                                                              Icons.currency_ruble,
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              size: 19.0,
                                                                                                            ),
                                                                                                          ].divide(SizedBox(width: 3.0)),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Expanded(
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                        child: StreamBuilder<List<CartItemsRecord>>(
                                                                                                          stream: queryCartItemsRecord(
                                                                                                            queryBuilder: (cartItemsRecord) => cartItemsRecord
                                                                                                                .where(
                                                                                                                  'user',
                                                                                                                  isEqualTo: currentUserReference,
                                                                                                                )
                                                                                                                .where(
                                                                                                                  'product',
                                                                                                                  isEqualTo: containerMenuRecord.reference,
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
                                                                                                            List<CartItemsRecord> containerCartItemsRecordList = snapshot.data!;
                                                                                                            final containerCartItemsRecord = containerCartItemsRecordList.isNotEmpty ? containerCartItemsRecordList.first : null;

                                                                                                            return Container(
                                                                                                              constraints: BoxConstraints(
                                                                                                                maxWidth: 200.0,
                                                                                                              ),
                                                                                                              decoration: BoxDecoration(),
                                                                                                              child: Stack(
                                                                                                                children: [
                                                                                                                  if (containerCartItemsRecord?.product != containerMenuRecord.reference)
                                                                                                                    Container(
                                                                                                                      width: double.infinity,
                                                                                                                      decoration: BoxDecoration(),
                                                                                                                      child: FFButtonWidget(
                                                                                                                        onPressed: () async {
                                                                                                                          var cartItemsRecordReference = CartItemsRecord.collection.doc();
                                                                                                                          await cartItemsRecordReference.set({
                                                                                                                            ...createCartItemsRecordData(
                                                                                                                              name: containerMenuRecord.name,
                                                                                                                              discription: containerMenuRecord.description,
                                                                                                                              price: containerMenuRecord.price,
                                                                                                                              ves: containerMenuRecord.ves,
                                                                                                                              kkal: containerMenuRecord.kkal,
                                                                                                                              b: containerMenuRecord.b,
                                                                                                                              zh: containerMenuRecord.zh,
                                                                                                                              u: containerMenuRecord.u,
                                                                                                                              oldPrise: containerMenuRecord.oldPrice,
                                                                                                                              restoran: containerMenuRecord.restoran,
                                                                                                                              product: containerMenuRecord.reference,
                                                                                                                              quantity: 1,
                                                                                                                              restoranname: containerMenuRecord.restoranName,
                                                                                                                              user: currentUserReference,
                                                                                                                              totalPrise: containerMenuRecord.price,
                                                                                                                            ),
                                                                                                                            ...mapToFirestore(
                                                                                                                              {
                                                                                                                                'CategoryBluda': containerMenuRecord.categoryBluda,
                                                                                                                                'image': containerMenuRecord.image,
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          });
                                                                                                                          _model.createcartItem = CartItemsRecord.getDocumentFromData({
                                                                                                                            ...createCartItemsRecordData(
                                                                                                                              name: containerMenuRecord.name,
                                                                                                                              discription: containerMenuRecord.description,
                                                                                                                              price: containerMenuRecord.price,
                                                                                                                              ves: containerMenuRecord.ves,
                                                                                                                              kkal: containerMenuRecord.kkal,
                                                                                                                              b: containerMenuRecord.b,
                                                                                                                              zh: containerMenuRecord.zh,
                                                                                                                              u: containerMenuRecord.u,
                                                                                                                              oldPrise: containerMenuRecord.oldPrice,
                                                                                                                              restoran: containerMenuRecord.restoran,
                                                                                                                              product: containerMenuRecord.reference,
                                                                                                                              quantity: 1,
                                                                                                                              restoranname: containerMenuRecord.restoranName,
                                                                                                                              user: currentUserReference,
                                                                                                                              totalPrise: containerMenuRecord.price,
                                                                                                                            ),
                                                                                                                            ...mapToFirestore(
                                                                                                                              {
                                                                                                                                'CategoryBluda': containerMenuRecord.categoryBluda,
                                                                                                                                'image': containerMenuRecord.image,
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          }, cartItemsRecordReference);

                                                                                                                          safeSetState(() {});
                                                                                                                        },
                                                                                                                        text: 'К заказу',
                                                                                                                        options: FFButtonOptions(
                                                                                                                          width: 80.0,
                                                                                                                          height: 30.0,
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                fontFamily: 'Montserrat',
                                                                                                                                color: Colors.white,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                          elevation: 3.0,
                                                                                                                          borderSide: BorderSide(
                                                                                                                            color: Colors.transparent,
                                                                                                                            width: 1.0,
                                                                                                                          ),
                                                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  if (containerCartItemsRecord?.product == containerMenuRecord.reference)
                                                                                                                    Container(
                                                                                                                      width: 80.0,
                                                                                                                      height: 30.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      ),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                        children: [
                                                                                                                          Align(
                                                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                            child: Container(
                                                                                                                              width: 100.0,
                                                                                                                              height: 100.0,
                                                                                                                              constraints: BoxConstraints(
                                                                                                                                maxWidth: 30.0,
                                                                                                                                maxHeight: 30.0,
                                                                                                                              ),
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                                borderRadius: BorderRadius.only(
                                                                                                                                  bottomLeft: Radius.circular(10.0),
                                                                                                                                  bottomRight: Radius.circular(0.0),
                                                                                                                                  topLeft: Radius.circular(10.0),
                                                                                                                                  topRight: Radius.circular(0.0),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              child: Align(
                                                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                                child: InkWell(
                                                                                                                                  splashColor: Colors.transparent,
                                                                                                                                  focusColor: Colors.transparent,
                                                                                                                                  hoverColor: Colors.transparent,
                                                                                                                                  highlightColor: Colors.transparent,
                                                                                                                                  onTap: () async {
                                                                                                                                    final firestoreBatch = FirebaseFirestore.instance.batch();
                                                                                                                                    try {
                                                                                                                                      if (containerCartItemsRecord!.quantity <= 1) {
                                                                                                                                        firestoreBatch.delete(containerCartItemsRecord!.reference);
                                                                                                                                      } else {
                                                                                                                                        firestoreBatch.update(containerCartItemsRecord!.reference, {
                                                                                                                                          ...createCartItemsRecordData(
                                                                                                                                            totalPrise: containerCartItemsRecord!.price * (containerCartItemsRecord!.quantity - 1),
                                                                                                                                          ),
                                                                                                                                          ...mapToFirestore(
                                                                                                                                            {
                                                                                                                                              'quantity': FieldValue.increment(-(1)),
                                                                                                                                            },
                                                                                                                                          ),
                                                                                                                                        });
                                                                                                                                      }
                                                                                                                                    } finally {
                                                                                                                                      await firestoreBatch.commit();
                                                                                                                                    }
                                                                                                                                  },
                                                                                                                                  child: FaIcon(
                                                                                                                                    FontAwesomeIcons.minus,
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                    size: 24.0,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                                                                                                                            child: AnimatedDefaultTextStyle(
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'Montserrat',
                                                                                                                                    fontSize: 20.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                                  ),
                                                                                                                              duration: Duration(milliseconds: 735),
                                                                                                                              curve: Curves.easeInOut,
                                                                                                                              child: Text(
                                                                                                                                formatNumber(
                                                                                                                                  containerCartItemsRecord!.quantity,
                                                                                                                                  formatType: FormatType.custom,
                                                                                                                                  format: '0',
                                                                                                                                  locale: '',
                                                                                                                                ).maybeHandleOverflow(maxChars: 1),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Align(
                                                                                                                            alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                                            child: Container(
                                                                                                                              width: 100.0,
                                                                                                                              height: 100.0,
                                                                                                                              constraints: BoxConstraints(
                                                                                                                                maxWidth: 30.0,
                                                                                                                                maxHeight: 30.0,
                                                                                                                              ),
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                                borderRadius: BorderRadius.only(
                                                                                                                                  bottomLeft: Radius.circular(0.0),
                                                                                                                                  bottomRight: Radius.circular(10.0),
                                                                                                                                  topLeft: Radius.circular(0.0),
                                                                                                                                  topRight: Radius.circular(10.0),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              child: InkWell(
                                                                                                                                splashColor: Colors.transparent,
                                                                                                                                focusColor: Colors.transparent,
                                                                                                                                hoverColor: Colors.transparent,
                                                                                                                                highlightColor: Colors.transparent,
                                                                                                                                onTap: () async {
                                                                                                                                  await containerCartItemsRecord!.reference.update({
                                                                                                                                    ...createCartItemsRecordData(
                                                                                                                                      totalPrise: containerCartItemsRecord!.price * (containerCartItemsRecord!.quantity + 1),
                                                                                                                                    ),
                                                                                                                                    ...mapToFirestore(
                                                                                                                                      {
                                                                                                                                        'quantity': FieldValue.increment(1),
                                                                                                                                      },
                                                                                                                                    ),
                                                                                                                                  });
                                                                                                                                },
                                                                                                                                child: Icon(
                                                                                                                                  Icons.add_sharp,
                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                  size: 24.0,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        ),
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
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(height: 8.0)),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
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
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (!loggedIn)
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                      child: Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: 530.0,
                          maxHeight: 400.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3.0,
                              color: Color(0x33000000),
                              offset: Offset(
                                0.0,
                                1.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Пожалуйста, войдите в свой аккаунт или зарегистрируйтесь.',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 4.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          Navigator.pop(context);
                                          context.safePop();
                                        },
                                        text: 'Закрыть',
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.3,
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed('login');
                                        },
                                        text: 'Войти',
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.3,
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.white,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
