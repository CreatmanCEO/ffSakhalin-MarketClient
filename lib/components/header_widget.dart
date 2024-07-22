import '/auth/base_auth_user_provider.dart';
import '/components/cart_veb_widget.dart';
import '/components/stop_go_login_widget.dart';
import '/components/veb_profil_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'header_model.dart';
export 'header_model.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({
    super.key,
    required this.position,
  });

  final String? position;

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  late HeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderModel());

    _model.searchTextHederFieldTextController ??= TextEditingController();
    _model.searchTextHederFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.0,
      constraints: BoxConstraints(
        maxWidth: 1440.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('homeScreen');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/Frame_25.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            if ((widget!.position != 'Profil') && (widget!.position != 'cart'))
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: TextFormField(
                      controller: _model.searchTextHederFieldTextController,
                      focusNode: _model.searchTextHederFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.searchTextHederFieldTextController',
                        Duration(milliseconds: 2000),
                        () async {
                          FFAppState().searchText = '2';
                          setState(() {});
                        },
                      ),
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Поиск',
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Montserrat',
                                  letterSpacing: 0.0,
                                  lineHeight: 1.0,
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Montserrat',
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x37000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x37000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                        ),
                        suffixIcon: _model.searchTextHederFieldTextController!
                                .text.isNotEmpty
                            ? InkWell(
                                onTap: () async {
                                  _model.searchTextHederFieldTextController
                                      ?.clear();
                                  FFAppState().searchText = '2';
                                  setState(() {});
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.clear,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 25.0,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            letterSpacing: 0.0,
                            lineHeight: 1.0,
                          ),
                      maxLines: null,
                      validator: _model
                          .searchTextHederFieldTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  MouseRegion(
                    opaque: false,
                    cursor: MouseCursor.defer ?? MouseCursor.defer,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'homeScreen',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: Text(
                        'Главная',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              color: () {
                                if (widget!.position == 'home') {
                                  return FlutterFlowTheme.of(context).primary;
                                } else if (_model.mouseRegionHomeHovered!) {
                                  return Color(0x67F84F0E);
                                } else {
                                  return FlutterFlowTheme.of(context)
                                      .primaryText;
                                }
                              }(),
                              fontSize:
                                  widget!.position == 'home' ? 17.0 : 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    onEnter: ((event) async {
                      setState(() => _model.mouseRegionHomeHovered = true);
                    }),
                    onExit: ((event) async {
                      setState(() => _model.mouseRegionHomeHovered = false);
                    }),
                  ),
                  MouseRegion(
                    opaque: false,
                    cursor: MouseCursor.defer ?? MouseCursor.defer,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (loggedIn) {
                          context.goNamed('favour');
                        } else {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: StopGoLoginWidget(),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        }
                      },
                      child: Text(
                        'Избранное',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              color: () {
                                if (widget!.position == 'favorit') {
                                  return FlutterFlowTheme.of(context).primary;
                                } else if (_model.mouseRegionFavorHovered!) {
                                  return Color(0x67F84F0E);
                                } else {
                                  return FlutterFlowTheme.of(context)
                                      .primaryText;
                                }
                              }(),
                              fontSize:
                                  widget!.position == 'favorit' ? 17.0 : 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    onEnter: ((event) async {
                      setState(() => _model.mouseRegionFavorHovered = true);
                    }),
                    onExit: ((event) async {
                      setState(() => _model.mouseRegionFavorHovered = false);
                    }),
                  ),
                  MouseRegion(
                    opaque: false,
                    cursor: MouseCursor.defer ?? MouseCursor.defer,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (loggedIn) {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: VebProfilWidget(),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        } else {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: StopGoLoginWidget(),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        }
                      },
                      child: Text(
                        'Профиль',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              color: () {
                                if (widget!.position == 'Profil') {
                                  return FlutterFlowTheme.of(context).primary;
                                } else if (_model.mouseRegionProfilHovered!) {
                                  return Color(0x67F84F0E);
                                } else {
                                  return FlutterFlowTheme.of(context)
                                      .primaryText;
                                }
                              }(),
                              fontSize:
                                  widget!.position == 'Profil' ? 17.0 : 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    onEnter: ((event) async {
                      setState(() => _model.mouseRegionProfilHovered = true);
                    }),
                    onExit: ((event) async {
                      setState(() => _model.mouseRegionProfilHovered = false);
                    }),
                  ),
                  MouseRegion(
                    opaque: false,
                    cursor: MouseCursor.defer ?? MouseCursor.defer,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (loggedIn) {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: CartVebWidget(),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        } else {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: StopGoLoginWidget(),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        }
                      },
                      child: Text(
                        'Корзина',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              color: () {
                                if (widget!.position == 'cart') {
                                  return FlutterFlowTheme.of(context).primary;
                                } else if (_model.mouseRegionCartHovered!) {
                                  return Color(0x66F84F0E);
                                } else {
                                  return FlutterFlowTheme.of(context)
                                      .primaryText;
                                }
                              }(),
                              fontSize:
                                  widget!.position == 'cart' ? 17.0 : 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    onEnter: ((event) async {
                      setState(() => _model.mouseRegionCartHovered = true);
                    }),
                    onExit: ((event) async {
                      setState(() => _model.mouseRegionCartHovered = false);
                    }),
                  ),
                ].divide(SizedBox(width: 50.0)),
              ),
            ),
          ].divide(SizedBox(width: 50.0)),
        ),
      ),
    );
  }
}
