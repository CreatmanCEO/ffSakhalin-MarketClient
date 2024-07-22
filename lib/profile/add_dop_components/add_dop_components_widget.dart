import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_dop_components_model.dart';
export 'add_dop_components_model.dart';

class AddDopComponentsWidget extends StatefulWidget {
  const AddDopComponentsWidget({
    super.key,
    required this.menu,
  });

  final MenuRecord? menu;

  @override
  State<AddDopComponentsWidget> createState() => _AddDopComponentsWidgetState();
}

class _AddDopComponentsWidgetState extends State<AddDopComponentsWidget> {
  late AddDopComponentsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddDopComponentsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().test = widget!.menu?.reference;
      setState(() {});
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
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxWidth: 600.0,
          maxHeight: MediaQuery.sizeOf(context).height * 1.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlutterFlowIconButton(
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.close_sharp,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      FFAppState().summOptionItem = [];
                      FFAppState().refOptionItem = [];
                      FFAppState().OptionTXT = [];
                      setState(() {});
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: 1440.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 10.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Text(
                                    'Вы можете добавить к \"${widget!.menu?.name}\" следующие дополнительные компоненты',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 25.0, 0.0, 0.0),
                            child: FutureBuilder<List<OptionItemRecord>>(
                              future: queryOptionItemRecordOnce(
                                queryBuilder: (optionItemRecord) =>
                                    optionItemRecord.where(
                                  'menu',
                                  arrayContains: widget!.menu?.reference,
                                ),
                                limit: 25,
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
                                List<OptionItemRecord>
                                    columnOptionItemRecordList = snapshot.data!;

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                      columnOptionItemRecordList.length,
                                      (columnIndex) {
                                    final columnOptionItemRecord =
                                        columnOptionItemRecordList[columnIndex];
                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              valueOrDefault<String>(
                                                '${columnOptionItemRecord.name}, ${columnOptionItemRecord.ves.toString()}гр.',
                                                '0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '+ ${columnOptionItemRecord.price.toString()} ₽',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Montserrat',
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        6.0, 0.0, 0.0, 0.0),
                                                child: Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      visualDensity:
                                                          VisualDensity.compact,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                    ),
                                                    unselectedWidgetColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                                .checkboxValueMap[
                                                            columnOptionItemRecord] ??=
                                                        false,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() => _model
                                                                  .checkboxValueMap[
                                                              columnOptionItemRecord] =
                                                          newValue!);
                                                      if (newValue!) {
                                                        FFAppState()
                                                            .addToSummOptionItem(
                                                                columnOptionItemRecord
                                                                    .price);
                                                        FFAppState()
                                                            .addToRefOptionItem(
                                                                columnOptionItemRecord
                                                                    .reference);
                                                        FFAppState().addToOptionTXT(
                                                            '${columnOptionItemRecord.name}, ${columnOptionItemRecord.ves.toString()}гр. ${columnOptionItemRecord.price.toString()}руб;');
                                                        setState(() {});
                                                      } else {
                                                        FFAppState()
                                                            .removeFromSummOptionItem(
                                                                columnOptionItemRecord
                                                                    .price);
                                                        FFAppState()
                                                            .removeFromRefOptionItem(
                                                                columnOptionItemRecord
                                                                    .reference);
                                                        FFAppState()
                                                            .removeAtIndexFromOptionTXT(
                                                                columnIndex);
                                                        setState(() {});
                                                      }
                                                    },
                                                    side: BorderSide(
                                                      width: 2,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    checkColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }).divide(SizedBox(height: 20.0)),
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'СТОИМОСТЬ: ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  '${((List<double>? var1, double var2) {
                                    return var2 +
                                        ((var1 != null && var1.isNotEmpty)
                                            ? var1.reduce((a, b) => a + b)
                                            : 0);
                                  }(FFAppState().summOptionItem.toList(), widget!.menu!.price)).toString()} руб.',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
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
            ),
            Container(
              width: double.infinity,
              constraints: BoxConstraints(
                maxWidth: 1440.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    var cartItemsRecordReference =
                        CartItemsRecord.collection.doc();
                    await cartItemsRecordReference.set({
                      ...createCartItemsRecordData(
                        name: widget!.menu?.name,
                        discription: widget!.menu?.description,
                        price: (List<double>? var1, double var2) {
                          return var2 +
                              ((var1 != null && var1.isNotEmpty)
                                  ? var1.fold<double>(0, (a, b) => a + b)
                                  : 0);
                        }(FFAppState().summOptionItem.toList(),
                            widget!.menu!.price),
                        ves: widget!.menu?.ves,
                        kkal: widget!.menu?.kkal,
                        b: widget!.menu?.b,
                        zh: widget!.menu?.zh,
                        u: widget!.menu?.u,
                        oldPrise: widget!.menu?.oldPrice,
                        restoran: widget!.menu?.restoran,
                        product: widget!.menu?.reference,
                        quantity: 1,
                        restoranname: widget!.menu?.restoranName,
                        user: currentUserReference,
                        totalPrise: (List<double>? var1, double var2) {
                          return var2 +
                              ((var1 != null && var1.isNotEmpty)
                                  ? var1.fold<double>(0, (a, b) => a + b)
                                  : 0);
                        }(FFAppState().summOptionItem.toList(),
                            widget!.menu!.price),
                      ),
                      ...mapToFirestore(
                        {
                          'CategoryBluda': widget!.menu?.categoryBluda,
                          'image': widget!.menu?.image,
                          'Option': FFAppState().refOptionItem,
                          'OptionTXT': FFAppState().OptionTXT,
                        },
                      ),
                    });
                    _model.createcartItem =
                        CartItemsRecord.getDocumentFromData({
                      ...createCartItemsRecordData(
                        name: widget!.menu?.name,
                        discription: widget!.menu?.description,
                        price: (List<double>? var1, double var2) {
                          return var2 +
                              ((var1 != null && var1.isNotEmpty)
                                  ? var1.fold<double>(0, (a, b) => a + b)
                                  : 0);
                        }(FFAppState().summOptionItem.toList(),
                            widget!.menu!.price),
                        ves: widget!.menu?.ves,
                        kkal: widget!.menu?.kkal,
                        b: widget!.menu?.b,
                        zh: widget!.menu?.zh,
                        u: widget!.menu?.u,
                        oldPrise: widget!.menu?.oldPrice,
                        restoran: widget!.menu?.restoran,
                        product: widget!.menu?.reference,
                        quantity: 1,
                        restoranname: widget!.menu?.restoranName,
                        user: currentUserReference,
                        totalPrise: (List<double>? var1, double var2) {
                          return var2 +
                              ((var1 != null && var1.isNotEmpty)
                                  ? var1.fold<double>(0, (a, b) => a + b)
                                  : 0);
                        }(FFAppState().summOptionItem.toList(),
                            widget!.menu!.price),
                      ),
                      ...mapToFirestore(
                        {
                          'CategoryBluda': widget!.menu?.categoryBluda,
                          'image': widget!.menu?.image,
                          'Option': FFAppState().refOptionItem,
                          'OptionTXT': FFAppState().OptionTXT,
                        },
                      ),
                    }, cartItemsRecordReference);

                    await widget!.menu!.reference.update({
                      ...mapToFirestore(
                        {
                          'popular': FieldValue.increment(1),
                        },
                      ),
                    });
                    FFAppState().summOptionItem = [];
                    FFAppState().refOptionItem = [];
                    FFAppState().OptionTXT = [];
                    setState(() {});
                    Navigator.pop(context);

                    setState(() {});
                  },
                  text: 'ДОБАВИТЬ К ЗАКАЗУ',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
