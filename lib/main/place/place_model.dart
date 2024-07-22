import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/cart_veb_widget.dart';
import '/components/popup_curent_tovar_widget.dart';
import '/components/stop_go_login_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/cartmenu/cartmenu_widget.dart';
import '/main/search_menu_page/search_menu_page_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'place_widget.dart' show PlaceWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceModel extends FlutterFlowModel<PlaceWidget> {
  ///  Local state fields for this page.

  String? filtrCategory;

  bool menu = true;

  bool sale = false;

  bool info = false;

  bool otzivy = false;

  bool openOtzivy = false;

  DocumentReference? listReviesCurrentRest1;

  bool searh = false;

  List<String> categoryList = [];
  void addToCategoryList(String item) => categoryList.add(item);
  void removeFromCategoryList(String item) => categoryList.remove(item);
  void removeAtIndexFromCategoryList(int index) => categoryList.removeAt(index);
  void insertAtIndexInCategoryList(int index, String item) =>
      categoryList.insert(index, item);
  void updateCategoryListAtIndex(int index, Function(String) updateFn) =>
      categoryList[index] = updateFn(categoryList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
