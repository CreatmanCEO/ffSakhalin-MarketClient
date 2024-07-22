import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/stop_go_login_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile/add_dop_components/add_dop_components_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'popup_curent_tovar_model.dart';
export 'popup_curent_tovar_model.dart';

class PopupCurentTovarWidget extends StatefulWidget {
  const PopupCurentTovarWidget({
    super.key,
    required this.currentTovar,
    this.otzyv,
  });

  final MenuRecord? currentTovar;
  final bool? otzyv;

  @override
  State<PopupCurentTovarWidget> createState() => _PopupCurentTovarWidgetState();
}

class _PopupCurentTovarWidgetState extends State<PopupCurentTovarWidget> {
  late PopupCurentTovarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupCurentTovarModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.otzyv!) {
        _model.itemInfo = false;
        _model.itemReview = true;
        setState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.sizeOf(context).height * 1.0,
          maxWidth: 600.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 10.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 500),
                          fadeOutDuration: Duration(milliseconds: 500),
                          imageUrl: widget!.currentTovar!.image.first,
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.27,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (widget!.currentTovar?.sharp ?? true)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/Hot_Icon.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            if (!widget!.currentTovar!.sharp)
                              Container(
                                width: 10.0,
                                height: 10.0,
                                decoration: BoxDecoration(),
                              ),
                            Align(
                              alignment: AlignmentDirectional(1.0, -1.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => FlutterFlowIconButton(
                                  borderColor: (currentUserDocument
                                                  ?.favoritTovar
                                                  ?.toList() ??
                                              [])
                                          .contains(
                                              widget!.currentTovar?.reference)
                                      ? FlutterFlowTheme.of(context).error
                                      : Color(0xFF8A8A8A),
                                  borderRadius: 15.0,
                                  borderWidth: 2.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.favorite_rounded,
                                    color: (currentUserDocument?.favoritTovar
                                                    ?.toList() ??
                                                [])
                                            .contains(
                                                widget!.currentTovar?.reference)
                                        ? FlutterFlowTheme.of(context).error
                                        : Color(0xFF8A8A8A),
                                    size: 25.0,
                                  ),
                                  onPressed: () async {
                                    if (loggedIn) {
                                      if ((currentUserDocument?.favoritTovar
                                                  ?.toList() ??
                                              [])
                                          .contains(widget!
                                              .currentTovar?.reference)) {
                                        await currentUserReference!.update({
                                          ...mapToFirestore(
                                            {
                                              'FavoritTovar':
                                                  FieldValue.arrayRemove([
                                                widget!.currentTovar?.reference
                                              ]),
                                            },
                                          ),
                                        });
                                      } else {
                                        await currentUserReference!.update({
                                          ...mapToFirestore(
                                            {
                                              'FavoritTovar':
                                                  FieldValue.arrayUnion([
                                                widget!.currentTovar?.reference
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
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: StopGoLoginWidget(),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(0.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          width: 1.0,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 15.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              widget!.currentTovar!.name,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 24.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 6.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  widget!.currentTovar!.price
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                Icon(
                                                  Icons.currency_ruble,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 22.0,
                                                ),
                                              ].divide(SizedBox(width: 5.0)),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Icon(
                                                        Icons.star_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .warning,
                                                        size: 24.0,
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      2.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              ((List<int>
                                                                      var1) {
                                                                return var1
                                                                        .isEmpty
                                                                    ? 0
                                                                    : var1.reduce((a,
                                                                                b) =>
                                                                            a +
                                                                            b) /
                                                                        var1.length;
                                                              }(widget!
                                                                      .currentTovar!
                                                                      .summaRatinTovar
                                                                      .toList()))
                                                                  .toString(),
                                                              '0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
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
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .reviews_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 24.0,
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                widget!
                                                                    .currentTovar
                                                                    ?.summaRatinTovar
                                                                    ?.length
                                                                    ?.toString(),
                                                                '0',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
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
                                    ].divide(SizedBox(height: 5.0)),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            _model.itemInfo = true;
                                            _model.itemReview = false;
                                            setState(() {});
                                          },
                                          text: 'Описание',
                                          options: FFButtonOptions(
                                            height: 45.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: _model.itemInfo
                                                ? Color(0xFFFEFEE4)
                                                : Color(0x00000000),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: _model.itemInfo
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : Color(0xFFD3D1D8),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            _model.itemInfo = false;
                                            _model.itemReview = true;
                                            setState(() {});
                                          },
                                          text: 'Отзывы',
                                          options: FFButtonOptions(
                                            height: 45.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: _model.itemReview
                                                ? Color(0xFFFEFEE4)
                                                : Color(0x00000000),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: _model.itemReview
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : Color(0xFFD3D1D8),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 15.0)),
                                  ),
                                  if (_model.itemInfo)
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Вес: ${widget!.currentTovar?.ves} грамм',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                              if (widget!.currentTovar?.kkal !=
                                                  null)
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Ккал: ${widget!.currentTovar?.kkal?.toString()}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      'Б: ${widget!.currentTovar?.b?.toString()}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      'Ж: ${widget!.currentTovar?.zh?.toString()}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      'У: ${widget!.currentTovar?.u?.toString()}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
                                                ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Описание',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Text(
                                                widget!
                                                    .currentTovar!.description,
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 5.0)),
                                          ),
                                          if (widget!.currentTovar?.sostav !=
                                                  null &&
                                              widget!.currentTovar?.sostav !=
                                                  '')
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Состав',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Text(
                                                  widget!.currentTovar!.sostav,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 5.0)),
                                            ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                    ),
                                  if (_model.itemReview)
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final itemReviews = widget!
                                                    .currentTovar?.reviews
                                                    ?.toList() ??
                                                [];

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: List.generate(
                                                  itemReviews.length,
                                                  (itemReviewsIndex) {
                                                final itemReviewsItem =
                                                    itemReviews[
                                                        itemReviewsIndex];
                                                return FutureBuilder<
                                                    ReviewsRecord>(
                                                  future: ReviewsRecord
                                                      .getDocumentOnce(
                                                          itemReviewsItem),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child: SpinKitPulse(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      );
                                                    }

                                                    final containerReviewsRecord =
                                                        snapshot.data!;

                                                    return Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 4.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                              1.0,
                                                              2.0,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFD3D1D8),
                                                          width: 0.3,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    10.0,
                                                                    8.0,
                                                                    10.0),
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
                                                                          2.0,
                                                                          0.0,
                                                                          2.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
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
                                                                            .end,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            '${containerReviewsRecord.userName}',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: Colors.black,
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            dateTimeFormat('dd.mm.yyyy HH:MM',
                                                                                containerReviewsRecord.data!),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: Color(0xFF737477),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 4.0)),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  RatingBarIndicator(
                                                                    itemBuilder:
                                                                        (context,
                                                                                index) =>
                                                                            Icon(
                                                                      Icons
                                                                          .star_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .warning,
                                                                    ),
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    rating: containerReviewsRecord
                                                                        .rating
                                                                        .toDouble(),
                                                                    unratedColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .accent3,
                                                                    itemCount:
                                                                        5,
                                                                    itemSize:
                                                                        24.0,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Text(
                                                                containerReviewsRecord
                                                                    .text,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Sen',
                                                                      color: Color(
                                                                          0xFF50555C),
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 8.0)),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              }).divide(SizedBox(height: 10.0)),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                ].divide(SizedBox(height: 20.0)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 40.0),
                            child: StreamBuilder<List<CartItemsRecord>>(
                              stream: queryCartItemsRecord(
                                queryBuilder: (cartItemsRecord) =>
                                    cartItemsRecord
                                        .where(
                                          'user',
                                          isEqualTo: currentUserReference,
                                        )
                                        .where(
                                          'name',
                                          isEqualTo: widget!.currentTovar?.name,
                                        ),
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<CartItemsRecord>
                                    containerCartItemsRecordList =
                                    snapshot.data!;

                                final containerCartItemsRecord =
                                    containerCartItemsRecordList.isNotEmpty
                                        ? containerCartItemsRecordList.first
                                        : null;
                                return Container(
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  constraints: BoxConstraints(
                                    maxWidth: 400.0,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (loggedIn) {
                                        if (widget!.currentTovar?.reference !=
                                            containerCartItemsRecord?.product) {
                                          if (widget!.currentTovar!.options
                                              .isNotEmpty) {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: AddDopComponentsWidget(
                                                    menu: widget!.currentTovar!,
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          } else {
                                            await CartItemsRecord.collection
                                                .doc()
                                                .set({
                                              ...createCartItemsRecordData(
                                                name:
                                                    widget!.currentTovar?.name,
                                                discription: widget!
                                                    .currentTovar?.description,
                                                price:
                                                    widget!.currentTovar?.price,
                                                ves: widget!.currentTovar?.ves,
                                                kkal:
                                                    widget!.currentTovar?.kkal,
                                                b: widget!.currentTovar?.b,
                                                zh: widget!.currentTovar?.zh,
                                                u: widget!.currentTovar?.u,
                                                oldPrise: widget!
                                                    .currentTovar?.oldPrice,
                                                restoran: widget!
                                                    .currentTovar?.restoran,
                                                product: widget!
                                                    .currentTovar?.reference,
                                                quantity: 1,
                                                user: currentUserReference,
                                                totalPrise:
                                                    widget!.currentTovar?.price,
                                                restoranname: widget!
                                                    .currentTovar?.restoranName,
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'CategoryBluda': widget!
                                                      .currentTovar
                                                      ?.categoryBluda,
                                                  'image': widget!
                                                      .currentTovar?.image,
                                                },
                                              ),
                                            });
                                          }
                                        } else {
                                          await containerCartItemsRecord!
                                              .reference
                                              .delete();
                                        }
                                      } else {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: StopGoLoginWidget(),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      }
                                    },
                                    text: containerCartItemsRecord?.product !=
                                            widget!.currentTovar?.reference
                                        ? 'ДОБАВИТЬ В ЗАКАЗ'
                                        : 'УБРАТЬ ИЗ ЗАКАЗА',
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.35,
                                      height: 45.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: containerCartItemsRecord
                                                  ?.product !=
                                              widget!.currentTovar?.reference
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: containerCartItemsRecord
                                                        ?.product !=
                                                    widget!
                                                        .currentTovar?.reference
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 1.0,
                                      borderSide: BorderSide(
                                        color: containerCartItemsRecord
                                                    ?.product !=
                                                widget!.currentTovar?.reference
                                            ? Colors.transparent
                                            : FlutterFlowTheme.of(context)
                                                .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
