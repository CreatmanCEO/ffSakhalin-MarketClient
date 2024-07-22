import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'all_categoey_copy_model.dart';
export 'all_categoey_copy_model.dart';

class AllCategoeyCopyWidget extends StatefulWidget {
  const AllCategoeyCopyWidget({
    super.key,
    required this.category,
  });

  final List<CategoryOfRestaurantCuisineRecord>? category;

  @override
  State<AllCategoeyCopyWidget> createState() => _AllCategoeyCopyWidgetState();
}

class _AllCategoeyCopyWidgetState extends State<AllCategoeyCopyWidget> {
  late AllCategoeyCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllCategoeyCopyModel());

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
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
        child: Container(
          height: double.infinity,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Stack(
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Container(
                              width: 40.0,
                              height: 5.0,
                              decoration: BoxDecoration(
                                color: Color(0xCBC3C3C3),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                    ))
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 12.0, 10.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close_rounded,
                                color: FlutterFlowTheme.of(context).grayIcon,
                                size: 30.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              if (responsiveVisibility(
                context: context,
                tabletLandscape: false,
                desktop: false,
              ))
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final categoryRestList = widget!.category!.toList();

                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 0.8,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: categoryRestList.length,
                            itemBuilder: (context, categoryRestListIndex) {
                              final categoryRestListItem =
                                  categoryRestList[categoryRestListIndex];
                              return Container(
                                height: double.infinity,
                                decoration: BoxDecoration(),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (FFAppState()
                                        .currentRestCategory
                                        .contains(
                                            categoryRestListItem.reference)) {
                                      FFAppState()
                                          .removeFromCurrentRestCategory(
                                              categoryRestListItem.reference);
                                      FFAppState().update(() {});
                                      FFAppState().removeFromKatagoryRestName(
                                          categoryRestListItem.name);
                                      FFAppState().update(() {});
                                    } else {
                                      FFAppState().addToCurrentRestCategory(
                                          categoryRestListItem.reference);
                                      setState(() {});
                                      FFAppState().addToKatagoryRestName(
                                          categoryRestListItem.name);
                                      setState(() {});
                                    }
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Material(
                                        color: Colors.transparent,
                                        elevation: FFAppState()
                                                .currentRestCategory
                                                .contains(categoryRestListItem
                                                    .reference)
                                            ? 4.0
                                            : 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            border: Border.all(
                                              color: FFAppState()
                                                      .currentRestCategory
                                                      .contains(
                                                          categoryRestListItem
                                                              .reference)
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : Color(0xFF6B7A85),
                                              width: 2.0,
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            child: Image.network(
                                              categoryRestListItem.cover,
                                              width: 65.0,
                                              height: 65.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          categoryRestListItem.name,
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Colors.black,
                                                fontSize: 11.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 10.0)),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                Expanded(
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 1440.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 15.0, 10.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final listCategory =
                                      widget!.category!.toList();

                                  return Wrap(
                                    spacing: 50.0,
                                    runSpacing: 50.0,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: List.generate(listCategory.length,
                                        (listCategoryIndex) {
                                      final listCategoryItem =
                                          listCategory[listCategoryIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (FFAppState()
                                              .currentRestCategory
                                              .contains(
                                                  listCategoryItem.reference)) {
                                            FFAppState()
                                                .removeFromCurrentRestCategory(
                                                    listCategoryItem.reference);
                                            FFAppState().update(() {});
                                            FFAppState()
                                                .removeFromKatagoryRestName(
                                                    listCategoryItem.name);
                                            FFAppState().update(() {});
                                          } else {
                                            FFAppState()
                                                .addToCurrentRestCategory(
                                                    listCategoryItem.reference);
                                            setState(() {});
                                            FFAppState().addToKatagoryRestName(
                                                listCategoryItem.name);
                                            setState(() {});
                                          }
                                        },
                                        child: Container(
                                          width: 150.0,
                                          height: 150.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 120.0,
                                                height: 120.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  listCategoryItem.cover,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  listCategoryItem.name,
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: 1400.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (FFAppState().currentRestCategory.isNotEmpty)
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              FFAppState().currentRestCategory = [];
                              FFAppState().update(() {});
                              FFAppState().katagoryRestName = [];
                              FFAppState().update(() {});
                            },
                            text: 'Сбросить',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).accent2,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'Применить',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 10.0)),
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
