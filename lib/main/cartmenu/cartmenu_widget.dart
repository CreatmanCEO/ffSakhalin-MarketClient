import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/stop_go_login_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile/add_dop_components/add_dop_components_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cartmenu_model.dart';
export 'cartmenu_model.dart';

class CartmenuWidget extends StatefulWidget {
  const CartmenuWidget({
    super.key,
    required this.blockMenu,
    required this.currentRestoran,
  });

  final MenuRecord? blockMenu;
  final RestoranRecord? currentRestoran;

  @override
  State<CartmenuWidget> createState() => _CartmenuWidgetState();
}

class _CartmenuWidgetState extends State<CartmenuWidget> {
  late CartmenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartmenuModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.46,
            constraints: BoxConstraints(
              maxWidth: 250.0,
              maxHeight: 290.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x33000000),
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(9.0),
                            topRight: Radius.circular(9.0),
                          ),
                          child: Image.network(
                            widget!.blockMenu!.image.first,
                            width: double.infinity,
                            height: 140.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        if (widget!.blockMenu?.sharp ?? true)
                          Align(
                            alignment: AlignmentDirectional(1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 6.0, 6.0, 0.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/Hot_Icon.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget!.blockMenu!.name,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Text(
                              'Вес: ${widget!.blockMenu?.ves} грамм',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Text(
                              widget!.blockMenu!.sostav,
                              maxLines: 2,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].divide(SizedBox(height: 3.0)),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 8.0)),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 6.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (widget!.blockMenu?.oldPrice.toString() != '0')
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    widget!.blockMenu?.oldPrice?.toString(),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .accent2,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                ),
                                Icon(
                                  Icons.currency_ruble,
                                  color: FlutterFlowTheme.of(context).accent2,
                                  size: 20.0,
                                ),
                              ].divide(SizedBox(width: 3.0)),
                            ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                widget!.blockMenu!.price.toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Icon(
                                Icons.currency_ruble,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 20.0,
                              ),
                            ].divide(SizedBox(width: 3.0)),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(1.0, 1.0),
                              child: StreamBuilder<List<CartItemsRecord>>(
                                stream: queryCartItemsRecord(
                                  queryBuilder: (cartItemsRecord) =>
                                      cartItemsRecord
                                          .where(
                                            'user',
                                            isEqualTo: currentUserReference,
                                          )
                                          .where(
                                            'product',
                                            isEqualTo:
                                                widget!.blockMenu?.reference,
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
                                    decoration: BoxDecoration(),
                                    alignment: AlignmentDirectional(1.0, 1.0),
                                    child: Align(
                                      alignment: AlignmentDirectional(1.0, 1.0),
                                      child: Stack(
                                        children: [
                                          if ((containerCartItemsRecord
                                                      ?.restoran !=
                                                  widget!.currentRestoran
                                                      ?.reference) ||
                                              ((containerCartItemsRecord
                                                          ?.restoran ==
                                                      widget!.currentRestoran
                                                          ?.reference) &&
                                                  (widget!.blockMenu!.options
                                                      .isNotEmpty)))
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  if (loggedIn) {
                                                    if (widget!.blockMenu!
                                                        .options.isNotEmpty) {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                AddDopComponentsWidget(
                                                              menu: widget!
                                                                  .blockMenu!,
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      var cartItemsRecordReference =
                                                          CartItemsRecord
                                                              .collection
                                                              .doc();
                                                      await cartItemsRecordReference
                                                          .set({
                                                        ...createCartItemsRecordData(
                                                          name: widget!
                                                              .blockMenu?.name,
                                                          discription: widget!
                                                              .blockMenu
                                                              ?.description,
                                                          price: widget!
                                                              .blockMenu?.price,
                                                          ves: widget!
                                                              .blockMenu?.ves,
                                                          kkal: widget!
                                                              .blockMenu?.kkal,
                                                          b: widget!
                                                              .blockMenu?.b,
                                                          zh: widget!
                                                              .blockMenu?.zh,
                                                          u: widget!
                                                              .blockMenu?.u,
                                                          oldPrise: widget!
                                                              .blockMenu
                                                              ?.oldPrice,
                                                          restoran: widget!
                                                              .currentRestoran
                                                              ?.reference,
                                                          product: widget!
                                                              .blockMenu
                                                              ?.reference,
                                                          quantity: 1,
                                                          restoranname: widget!
                                                              .currentRestoran
                                                              ?.name,
                                                          user:
                                                              currentUserReference,
                                                          totalPrise: widget!
                                                              .blockMenu?.price,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'allergies': widget!
                                                                .blockMenu
                                                                ?.allergies,
                                                            'CategoryBluda': widget!
                                                                .blockMenu
                                                                ?.categoryBluda,
                                                            'image': widget!
                                                                .blockMenu
                                                                ?.image,
                                                          },
                                                        ),
                                                      });
                                                      _model.createcartItem =
                                                          CartItemsRecord
                                                              .getDocumentFromData({
                                                        ...createCartItemsRecordData(
                                                          name: widget!
                                                              .blockMenu?.name,
                                                          discription: widget!
                                                              .blockMenu
                                                              ?.description,
                                                          price: widget!
                                                              .blockMenu?.price,
                                                          ves: widget!
                                                              .blockMenu?.ves,
                                                          kkal: widget!
                                                              .blockMenu?.kkal,
                                                          b: widget!
                                                              .blockMenu?.b,
                                                          zh: widget!
                                                              .blockMenu?.zh,
                                                          u: widget!
                                                              .blockMenu?.u,
                                                          oldPrise: widget!
                                                              .blockMenu
                                                              ?.oldPrice,
                                                          restoran: widget!
                                                              .currentRestoran
                                                              ?.reference,
                                                          product: widget!
                                                              .blockMenu
                                                              ?.reference,
                                                          quantity: 1,
                                                          restoranname: widget!
                                                              .currentRestoran
                                                              ?.name,
                                                          user:
                                                              currentUserReference,
                                                          totalPrise: widget!
                                                              .blockMenu?.price,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'allergies': widget!
                                                                .blockMenu
                                                                ?.allergies,
                                                            'CategoryBluda': widget!
                                                                .blockMenu
                                                                ?.categoryBluda,
                                                            'image': widget!
                                                                .blockMenu
                                                                ?.image,
                                                          },
                                                        ),
                                                      }, cartItemsRecordReference);

                                                      await widget!
                                                          .blockMenu!.reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'popular':
                                                                FieldValue
                                                                    .increment(
                                                                        1),
                                                          },
                                                        ),
                                                      });
                                                      FFAppState()
                                                          .addToProductInCart(
                                                              widget!.blockMenu!
                                                                  .reference);
                                                      setState(() {});
                                                    }
                                                  } else {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              StopGoLoginWidget(),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  }

                                                  setState(() {});
                                                },
                                                text: 'К заказу',
                                                options: FFButtonOptions(
                                                  height: 30.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          if ((containerCartItemsRecord
                                                      ?.restoran ==
                                                  widget!.currentRestoran
                                                      ?.reference) &&
                                              !(widget!.blockMenu!.options
                                                  .isNotEmpty))
                                            Container(
                                              width: double.infinity,
                                              height: 30.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 30.0,
                                                        maxHeight: 30.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  0.0),
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
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
                                                            final firestoreBatch =
                                                                FirebaseFirestore
                                                                    .instance
                                                                    .batch();
                                                            try {
                                                              if (containerCartItemsRecord!
                                                                      .quantity <=
                                                                  1) {
                                                                firestoreBatch.delete(
                                                                    containerCartItemsRecord!
                                                                        .reference);
                                                                FFAppState().removeFromProductInCart(
                                                                    containerCartItemsRecord!
                                                                        .product!);
                                                                setState(() {});
                                                              } else {
                                                                firestoreBatch.update(
                                                                    containerCartItemsRecord!
                                                                        .reference,
                                                                    {
                                                                      ...createCartItemsRecordData(
                                                                        totalPrise:
                                                                            widget!.blockMenu!.price *
                                                                                (containerCartItemsRecord!.quantity - 1),
                                                                      ),
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'quantity':
                                                                              FieldValue.increment(-(1)),
                                                                        },
                                                                      ),
                                                                    });
                                                              }
                                                            } finally {
                                                              await firestoreBatch
                                                                  .commit();
                                                            }
                                                          },
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .minus,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(6.0, 0.0,
                                                                6.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        containerCartItemsRecord
                                                            ?.quantity
                                                            ?.toString(),
                                                        '0',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 30.0,
                                                        maxHeight: 30.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                        ),
                                                      ),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await containerCartItemsRecord!
                                                              .reference
                                                              .update({
                                                            ...createCartItemsRecordData(
                                                              totalPrise: widget!
                                                                      .blockMenu!
                                                                      .price *
                                                                  (containerCartItemsRecord!
                                                                          .quantity +
                                                                      1),
                                                            ),
                                                            ...mapToFirestore(
                                                              {
                                                                'quantity':
                                                                    FieldValue
                                                                        .increment(
                                                                            1),
                                                              },
                                                            ),
                                                          });
                                                        },
                                                        child: Icon(
                                                          Icons.add_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
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
                                    ),
                                  );
                                },
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
        ),
      ],
    );
  }
}
