import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/stop_login/stop_login_widget.dart';
import '/profile/add_dop_components/add_dop_components_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'item_comp_searche_web_model.dart';
export 'item_comp_searche_web_model.dart';

class ItemCompSearcheWebWidget extends StatefulWidget {
  const ItemCompSearcheWebWidget({
    super.key,
    required this.blockMenu,
  });

  final MenuRecord? blockMenu;

  @override
  State<ItemCompSearcheWebWidget> createState() =>
      _ItemCompSearcheWebWidgetState();
}

class _ItemCompSearcheWebWidgetState extends State<ItemCompSearcheWebWidget> {
  late ItemCompSearcheWebModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemCompSearcheWebModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
            width: MediaQuery.sizeOf(context).width * 0.4,
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
              border: Border.all(
                color: FlutterFlowTheme.of(context).itemBorder,
                width: 1.0,
              ),
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
                            if ((widget!.blockMenu?.ves != '0') &&
                                (widget!.blockMenu?.ves != null &&
                                    widget!.blockMenu?.ves != ''))
                              Text(
                                'Вес: ${widget!.blockMenu?.ves} гр.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 10.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            Text(
                              widget!.blockMenu!.description,
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Text(
                          widget!.blockMenu!.restoranName,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 6.0),
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
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                    ),
                                    Icon(
                                      Icons.currency_ruble,
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
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
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
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
                          StreamBuilder<List<CartItemsRecord>>(
                            stream: queryCartItemsRecord(
                              queryBuilder: (cartItemsRecord) => cartItemsRecord
                                  .where(
                                    'user',
                                    isEqualTo: currentUserReference,
                                  )
                                  .where(
                                    'name',
                                    isEqualTo: widget!.blockMenu?.name,
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 60.0,
                                    ),
                                  ),
                                );
                              }
                              List<CartItemsRecord>
                                  containerCartItemsRecordList = snapshot.data!;
                              final containerCartItemsRecord =
                                  containerCartItemsRecordList.isNotEmpty
                                      ? containerCartItemsRecordList.first
                                      : null;

                              return Container(
                                decoration: BoxDecoration(),
                                child: FlutterFlowIconButton(
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.add_shopping_cart,
                                    color: containerCartItemsRecord?.product !=
                                            widget!.blockMenu?.reference
                                        ? Colors.black
                                        : FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    if (loggedIn) {
                                      if (widget!.blockMenu?.reference !=
                                          containerCartItemsRecord?.product) {
                                        if (widget!
                                            .blockMenu!.options.isNotEmpty) {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: AddDopComponentsWidget(
                                                  menu: widget!.blockMenu!,
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
                                              name: widget!.blockMenu?.name,
                                              discription: widget!
                                                  .blockMenu?.description,
                                              price: widget!.blockMenu?.price,
                                              ves: widget!.blockMenu?.ves,
                                              kkal: widget!.blockMenu?.kkal,
                                              b: widget!.blockMenu?.b,
                                              zh: widget!.blockMenu?.zh,
                                              u: widget!.blockMenu?.u,
                                              oldPrise:
                                                  widget!.blockMenu?.oldPrice,
                                              restoran:
                                                  widget!.blockMenu?.restoran,
                                              product:
                                                  widget!.blockMenu?.reference,
                                              quantity: 1,
                                              user: currentUserReference,
                                              totalPrise:
                                                  widget!.blockMenu?.price,
                                              restoranname: widget!
                                                  .blockMenu?.restoranName,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'CategoryBluda': widget!
                                                    .blockMenu?.categoryBluda,
                                                'image':
                                                    widget!.blockMenu?.image,
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
                                            child: StopLoginWidget(),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    }
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ].divide(SizedBox(height: 10.0)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
