import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'del_review_place_model.dart';
export 'del_review_place_model.dart';

class DelReviewPlaceWidget extends StatefulWidget {
  const DelReviewPlaceWidget({
    super.key,
    required this.userrewies,
    required this.restRef,
  });

  final DocumentReference? userrewies;
  final RestoranRecord? restRef;

  @override
  State<DelReviewPlaceWidget> createState() => _DelReviewPlaceWidgetState();
}

class _DelReviewPlaceWidgetState extends State<DelReviewPlaceWidget> {
  late DelReviewPlaceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DelReviewPlaceModel());

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
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxWidth: 530.0,
            maxHeight: 300.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
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
              color: FlutterFlowTheme.of(context).primaryBackground,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: Text(
                    'Вы собираетесь удалить ваш отзыв.',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                StreamBuilder<List<ReviewsRecord>>(
                  stream: queryReviewsRecord(
                    queryBuilder: (reviewsRecord) => reviewsRecord
                        .where(
                          'RestoranID',
                          isEqualTo: widget!.restRef?.reference,
                        )
                        .where(
                          'Restoran',
                          isEqualTo: true,
                        ),
                  )..listen((snapshot) {
                      List<ReviewsRecord> containerReviewsRecordList = snapshot;
                      if (_model.containerPreviousSnapshot != null &&
                          !const ListEquality(ReviewsRecordDocumentEquality())
                              .equals(containerReviewsRecordList,
                                  _model.containerPreviousSnapshot)) {
                        () async {
                          await widget!.restRef!.reference
                              .update(createRestoranRecordData(
                            rating: valueOrDefault<double>(
                              (List<int> var1) {
                                return var1.isEmpty
                                    ? 0.0
                                    : double.parse(
                                        (var1.reduce((a, b) => a + b) /
                                                var1.length)
                                            .toStringAsFixed(1));
                              }(containerReviewsRecordList
                                  .map((e) => valueOrDefault<int>(
                                        e.rating,
                                        0,
                                      ))
                                  .toList()),
                              0.0,
                            ),
                            countRating: valueOrDefault<int>(
                              containerReviewsRecordList
                                  .map((e) => valueOrDefault<int>(
                                        e.rating,
                                        0,
                                      ))
                                  .toList()
                                  .length,
                              0,
                            ),
                          ));
                          await actions.showCustomSnackBarAction2(
                            context,
                            'готово',
                            FlutterFlowTheme.of(context).alternate,
                          );
                          Navigator.pop(context);
                          await actions.showCustomSnackBarAction2(
                            context,
                            'Отзыв удален',
                            FlutterFlowTheme.of(context).success,
                          );
                          Navigator.pop(context);

                          safeSetState(() {});
                        }();
                      }
                      _model.containerPreviousSnapshot = snapshot;
                    }),
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
                    List<ReviewsRecord> containerReviewsRecordList =
                        snapshot.data!;

                    return Container(
                      decoration: BoxDecoration(),
                      child: Padding(
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
                                },
                                text: 'Закрыть',
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 0.3,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).grayIcon,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await widget!.userrewies!.delete();

                                  await widget!.restRef!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'reviews': FieldValue.arrayRemove(
                                            [widget!.userrewies]),
                                      },
                                    ),
                                  });
                                },
                                text: 'Удалить',
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 0.3,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
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
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 15.0)),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
