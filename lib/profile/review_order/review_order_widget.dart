import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'review_order_model.dart';
export 'review_order_model.dart';

class ReviewOrderWidget extends StatefulWidget {
  const ReviewOrderWidget({
    super.key,
    required this.order,
    required this.restoran,
  });

  final OrderRecord? order;
  final DocumentReference? restoran;

  @override
  State<ReviewOrderWidget> createState() => _ReviewOrderWidgetState();
}

class _ReviewOrderWidgetState extends State<ReviewOrderWidget> {
  late ReviewOrderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewOrderModel());

    _model.textOrderReviewTextController ??= TextEditingController();
    _model.textOrderReviewFocusNode ??= FocusNode();

    _model.textItemReviewTextController ??= TextEditingController();
    _model.textItemReviewFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
        child: StreamBuilder<List<ReviewsRecord>>(
          stream: queryReviewsRecord(
            queryBuilder: (reviewsRecord) => reviewsRecord
                .where(
                  'RestoranID',
                  isEqualTo: widget!.restoran,
                )
                .where(
                  'user',
                  isEqualTo: currentUserReference,
                )
                .where(
                  'numberOrder',
                  isEqualTo: widget!.order?.number,
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
            List<ReviewsRecord> containerReviewsRecordList = snapshot.data!;
            final containerReviewsRecord = containerReviewsRecordList.isNotEmpty
                ? containerReviewsRecordList.first
                : null;

            return Container(
              constraints: BoxConstraints(
                maxWidth: 800.0,
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
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 16.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: Stack(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Text(
                                      'Добавление отзыва',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.0, -1.0),
                                child: FlutterFlowIconButton(
                                  borderRadius: 15.0,
                                  borderWidth: 2.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.close_sharp,
                                    size: 20.0,
                                  ),
                                  onPressed: () async {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'Вы можете оставить отзыв и оценку ко всему заказу, а так же отдельно к каждому товару в нем.',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Заказ #${widget!.order?.number?.toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Пожалуйста оцените ваш заказ!',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    RatingBar.builder(
                                      onRatingUpdate: (newValue) =>
                                          safeSetState(() =>
                                              _model.ratingBarValue = newValue),
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .warning,
                                      ),
                                      direction: Axis.horizontal,
                                      initialRating: _model.ratingBarValue ??=
                                          0.0,
                                      unratedColor:
                                          FlutterFlowTheme.of(context).accent3,
                                      itemCount: 5,
                                      itemSize: 46.0,
                                      glowColor:
                                          FlutterFlowTheme.of(context).warning,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _model
                                            .textOrderReviewTextController,
                                        focusNode:
                                            _model.textOrderReviewFocusNode,
                                        autofocus: true,
                                        readOnly: containerReviewsRecord
                                                ?.numberOrder ==
                                            widget!.order?.number,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText:
                                              'Оставьте комментарий здесь',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        maxLines: 5,
                                        minLines: 1,
                                        maxLength: 400,
                                        validator: _model
                                            .textOrderReviewTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        StreamBuilder<List<ReviewsRecord>>(
                                          stream: queryReviewsRecord(
                                            queryBuilder: (reviewsRecord) =>
                                                reviewsRecord
                                                    .where(
                                                      'RestoranID',
                                                      isEqualTo:
                                                          containerReviewsRecord
                                                              ?.restoranID,
                                                    )
                                                    .where(
                                                      'Restoran',
                                                      isEqualTo: true,
                                                    ),
                                          )..listen((snapshot) {
                                              List<ReviewsRecord>
                                                  containerReviewsRecordList =
                                                  snapshot;
                                              if (_model.containerPreviousSnapshot !=
                                                      null &&
                                                  !const ListEquality(
                                                          ReviewsRecordDocumentEquality())
                                                      .equals(
                                                          containerReviewsRecordList,
                                                          _model
                                                              .containerPreviousSnapshot)) {
                                                () async {
                                                  await widget!.restoran!.update(
                                                      createRestoranRecordData(
                                                    rating:
                                                        valueOrDefault<double>(
                                                      (List<int> var1) {
                                                        return var1.isEmpty
                                                            ? 0.0
                                                            : double.parse((var1
                                                                        .reduce((a,
                                                                                b) =>
                                                                            a +
                                                                            b) /
                                                                    var1.length)
                                                                .toStringAsFixed(
                                                                    1));
                                                      }(containerReviewsRecordList
                                                          .map((e) => e.rating)
                                                          .toList()),
                                                      0.0,
                                                    ),
                                                    countRating:
                                                        containerReviewsRecordList
                                                            .map(
                                                                (e) => e.rating)
                                                            .toList()
                                                            .length,
                                                  ));

                                                  safeSetState(() {});
                                                }();
                                              }
                                              _model.containerPreviousSnapshot =
                                                  snapshot;
                                            }),
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
                                            List<ReviewsRecord>
                                                containerReviewsRecordList =
                                                snapshot.data!;

                                            return Container(
                                              decoration: BoxDecoration(),
                                              child: Stack(
                                                children: [
                                                  if (containerReviewsRecord
                                                          ?.numberOrder !=
                                                      widget!.order?.number)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          if (_model
                                                                  .ratingBarValue! >=
                                                              1.0) {
                                                            var reviewsRecordReference =
                                                                ReviewsRecord
                                                                    .collection
                                                                    .doc();
                                                            await reviewsRecordReference
                                                                .set(
                                                                    createReviewsRecordData(
                                                              restoranID:
                                                                  widget!
                                                                      .restoran,
                                                              text: _model
                                                                  .textOrderReviewTextController
                                                                  .text,
                                                              rating: _model
                                                                  .ratingBarValue
                                                                  ?.round(),
                                                              user:
                                                                  currentUserReference,
                                                              data:
                                                                  getCurrentTimestamp,
                                                              userName: widget!
                                                                  .order
                                                                  ?.recipient,
                                                              numberOrder:
                                                                  widget!.order
                                                                      ?.number,
                                                              restoranName: widget!
                                                                  .order
                                                                  ?.restoranName,
                                                              restoran: true,
                                                            ));
                                                            _model.action1Copy =
                                                                ReviewsRecord
                                                                    .getDocumentFromData(
                                                                        createReviewsRecordData(
                                                                          restoranID:
                                                                              widget!.restoran,
                                                                          text: _model
                                                                              .textOrderReviewTextController
                                                                              .text,
                                                                          rating: _model
                                                                              .ratingBarValue
                                                                              ?.round(),
                                                                          user:
                                                                              currentUserReference,
                                                                          data:
                                                                              getCurrentTimestamp,
                                                                          userName: widget!
                                                                              .order
                                                                              ?.recipient,
                                                                          numberOrder: widget!
                                                                              .order
                                                                              ?.number,
                                                                          restoranName: widget!
                                                                              .order
                                                                              ?.restoranName,
                                                                          restoran:
                                                                              true,
                                                                        ),
                                                                        reviewsRecordReference);

                                                            await widget!.order!
                                                                .reference
                                                                .update(
                                                                    createOrderRecordData(
                                                              revivew: _model
                                                                  .action
                                                                  ?.reference,
                                                            ));

                                                            await widget!
                                                                .restoran!
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'reviews':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    _model
                                                                        .action1Copy
                                                                        ?.reference
                                                                  ]),
                                                                },
                                                              ),
                                                            });
                                                            await actions
                                                                .showCustomSnackBarAction2(
                                                              context,
                                                              'Озыв успешно сохранен',
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .success,
                                                            );
                                                            _model.product =
                                                                null;
                                                            _model.listReviev =
                                                                [];
                                                            safeSetState(() {});
                                                            Navigator.pop(
                                                                context);
                                                          } else {
                                                            await actions
                                                                .showCustomSnackBarAction2(
                                                              context,
                                                              'Укажите оценку',
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            );
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        text:
                                                            'Оценить ресторан',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 200.0,
                                                          height: 45.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                      ),
                                                    ),
                                                  if (containerReviewsRecord
                                                          ?.numberOrder ==
                                                      widget!.order?.number)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        width: 200.0,
                                                        height: 45.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                          ),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'Спасибо за оценку!',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
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
                                    if (containerReviewsRecord?.numberOrder ==
                                        widget!.order?.number)
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: Text(
                                              'Ниже вы можете оставить отзыв о каждой позиции в заказе',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    ' Состав заказа: ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                ],
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  final orderItem = widget!
                                                          .order?.item
                                                          ?.toList() ??
                                                      [];

                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        orderItem.length,
                                                        (orderItemIndex) {
                                                      final orderItemItem =
                                                          orderItem[
                                                              orderItemIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    15.0),
                                                        child: StreamBuilder<
                                                            OrderItemRecord>(
                                                          stream: OrderItemRecord
                                                              .getDocument(
                                                                  orderItemItem),
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

                                                            final rowOrderItemRecord =
                                                                snapshot.data!;

                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          MediaQuery.sizeOf(context).width *
                                                                              0.75,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      rowOrderItemRecord
                                                                          .name,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color: _model.product == rowOrderItemRecord.product
                                                                                ? FlutterFlowTheme.of(context).primary
                                                                                : FlutterFlowTheme.of(context).primaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            decoration:
                                                                                TextDecoration.underline,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                StreamBuilder<
                                                                    List<
                                                                        ReviewsRecord>>(
                                                                  stream:
                                                                      queryReviewsRecord(
                                                                    queryBuilder: (reviewsRecord) =>
                                                                        reviewsRecord
                                                                            .where(
                                                                              'tovarName',
                                                                              isEqualTo: rowOrderItemRecord.name,
                                                                            )
                                                                            .where(
                                                                              'user',
                                                                              isEqualTo: currentUserReference,
                                                                            )
                                                                            .where(
                                                                              'numberOrder',
                                                                              isEqualTo: widget!.order?.number,
                                                                            ),
                                                                    singleRecord:
                                                                        true,
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
                                                                    List<ReviewsRecord>
                                                                        containerReviewsRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    final containerReviewsRecord = containerReviewsRecordList
                                                                            .isNotEmpty
                                                                        ? containerReviewsRecordList
                                                                            .first
                                                                        : null;

                                                                    return Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          if (containerReviewsRecord?.tovarName !=
                                                                              rowOrderItemRecord.name)
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                _model.product = rowOrderItemRecord.product;
                                                                                _model.tovarName = rowOrderItemRecord.name;
                                                                                safeSetState(() {});
                                                                              },
                                                                              child: Text(
                                                                                'Оценить',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          if (containerReviewsRecord?.tovarName ==
                                                                              rowOrderItemRecord.name)
                                                                            Text(
                                                                              'Принято',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    }),
                                                  );
                                                },
                                              ),
                                              if (_model.product != null)
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
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
                                                                _model.product =
                                                                    null;
                                                                safeSetState(
                                                                    () {});
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .textItemReviewTextController
                                                                      ?.clear();
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .close_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textItemReviewTextController,
                                                          focusNode: _model
                                                              .textItemReviewFocusNode,
                                                          autofocus: true,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                'Оставьте комментарий о товаре здесь',
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lineColor,
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
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                          maxLines: 5,
                                                          minLines: 1,
                                                          maxLength: 250,
                                                          validator: _model
                                                              .textItemReviewTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    4.0),
                                                        child:
                                                            RatingBar.builder(
                                                          onRatingUpdate: (newValue) =>
                                                              safeSetState(() =>
                                                                  _model.ratingBarProdValue =
                                                                      newValue),
                                                          itemBuilder: (context,
                                                                  index) =>
                                                              Icon(
                                                            Icons.star_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .warning,
                                                          ),
                                                          direction:
                                                              Axis.horizontal,
                                                          initialRating: _model
                                                                  .ratingBarProdValue ??=
                                                              0.0,
                                                          unratedColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent3,
                                                          itemCount: 5,
                                                          itemSize: 46.0,
                                                          glowColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .warning,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            await Future.wait([
                                                              Future(() async {
                                                                var reviewsRecordReference =
                                                                    ReviewsRecord
                                                                        .collection
                                                                        .doc();
                                                                await reviewsRecordReference
                                                                    .set(
                                                                        createReviewsRecordData(
                                                                  menuID: _model
                                                                      .product,
                                                                  text: _model
                                                                      .textItemReviewTextController
                                                                      .text,
                                                                  data:
                                                                      getCurrentTimestamp,
                                                                  rating: _model
                                                                      .ratingBarProdValue
                                                                      ?.round(),
                                                                  user:
                                                                      currentUserReference,
                                                                  tovarName: _model
                                                                      .tovarName,
                                                                  userName:
                                                                      currentUserDisplayName,
                                                                  numberOrder:
                                                                      widget!
                                                                          .order
                                                                          ?.number,
                                                                  restoranName:
                                                                      widget!
                                                                          .order
                                                                          ?.restoranName,
                                                                  restoranID:
                                                                      widget!
                                                                          .restoran,
                                                                  menu: true,
                                                                  restoran:
                                                                      false,
                                                                ));
                                                                _model.action =
                                                                    ReviewsRecord
                                                                        .getDocumentFromData(
                                                                            createReviewsRecordData(
                                                                              menuID: _model.product,
                                                                              text: _model.textItemReviewTextController.text,
                                                                              data: getCurrentTimestamp,
                                                                              rating: _model.ratingBarProdValue?.round(),
                                                                              user: currentUserReference,
                                                                              tovarName: _model.tovarName,
                                                                              userName: currentUserDisplayName,
                                                                              numberOrder: widget!.order?.number,
                                                                              restoranName: widget!.order?.restoranName,
                                                                              restoranID: widget!.restoran,
                                                                              menu: true,
                                                                              restoran: false,
                                                                            ),
                                                                            reviewsRecordReference);

                                                                await _model
                                                                    .product!
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'reviews':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        _model
                                                                            .action
                                                                            ?.reference
                                                                      ]),
                                                                      'summaRatinTovar':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        _model
                                                                            .ratingBarProdValue
                                                                            ?.round()
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                                _model.addToListReviev(
                                                                    _model
                                                                        .action!
                                                                        .reference);
                                                                safeSetState(
                                                                    () {});
                                                                _model.product =
                                                                    null;
                                                                safeSetState(
                                                                    () {});
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .textItemReviewTextController
                                                                      ?.clear();
                                                                });
                                                                await actions
                                                                    .showCustomSnackBarAction2(
                                                                  context,
                                                                  'Оценка сохранена!',
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                                );
                                                              }),
                                                            ]);

                                                            safeSetState(() {});
                                                          },
                                                          text:
                                                              'Сохранить оценку товара',
                                                          options:
                                                              FFButtonOptions(
                                                            width: 200.0,
                                                            height: 45.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                            elevation: 3.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            ].divide(SizedBox(height: 8.0)),
                                          ),
                                        ],
                                      ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
