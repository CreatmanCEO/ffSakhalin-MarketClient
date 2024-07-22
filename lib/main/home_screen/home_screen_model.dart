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
import '/flutter_flow/request_manager.dart';

import 'home_screen_widget.dart' show HomeScreenWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreenModel extends FlutterFlowModel<HomeScreenWidget> {
  ///  Local state fields for this page.

  bool? sort = false;

  bool? filtr = false;

  bool? sortRatinr = false;

  bool? sortName = false;

  bool? sortSum = false;

  bool? filtrCartPay = false;

  bool? filtrDelivery = false;

  bool? filtrSamovivoz = false;

  bool pageHome = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for test widget.
  FocusNode? testFocusNode;
  TextEditingController? testTextController;
  String? Function(BuildContext, String?)? testTextControllerValidator;
  // State field(s) for MouseRegionHome widget.
  bool mouseRegionHomeHovered = false;
  // State field(s) for MouseRegionFavor widget.
  bool mouseRegionFavorHovered = false;
  // State field(s) for MouseRegionProfil widget.
  bool mouseRegionProfilHovered = false;
  // State field(s) for MouseRegionCart widget.
  bool mouseRegionCartHovered = false;
  // State field(s) for searchTextField widget.
  FocusNode? searchTextFieldFocusNode1;
  TextEditingController? searchTextFieldTextController1;
  String? Function(BuildContext, String?)?
      searchTextFieldTextController1Validator;
  // State field(s) for Carousel widget.
  CarouselController? carouselController1;
  int carouselCurrentIndex1 = 1;

  // State field(s) for Carousel widget.
  CarouselController? carouselController2;
  int carouselCurrentIndex2 = 1;

  // State field(s) for searchTextField widget.
  FocusNode? searchTextFieldFocusNode2;
  TextEditingController? searchTextFieldTextController2;
  String? Function(BuildContext, String?)?
      searchTextFieldTextController2Validator;

  /// Query cache managers for this widget.

  final _restorsantsManager = StreamRequestManager<List<RestoranRecord>>();
  Stream<List<RestoranRecord>> restorsants({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<RestoranRecord>> Function() requestFn,
  }) =>
      _restorsantsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRestorsantsCache() => _restorsantsManager.clear();
  void clearRestorsantsCacheKey(String? uniqueKey) =>
      _restorsantsManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    testFocusNode?.dispose();
    testTextController?.dispose();

    searchTextFieldFocusNode1?.dispose();
    searchTextFieldTextController1?.dispose();

    searchTextFieldFocusNode2?.dispose();
    searchTextFieldTextController2?.dispose();

    /// Dispose query cache managers for this widget.

    clearRestorsantsCache();
  }
}
