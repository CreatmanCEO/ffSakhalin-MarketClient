import '/auth/base_auth_user_provider.dart';
import '/components/cart_veb_widget.dart';
import '/components/stop_go_login_widget.dart';
import '/components/veb_profil_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'header_widget.dart' show HeaderWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HeaderModel extends FlutterFlowModel<HeaderWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for searchTextHederField widget.
  FocusNode? searchTextHederFieldFocusNode;
  TextEditingController? searchTextHederFieldTextController;
  String? Function(BuildContext, String?)?
      searchTextHederFieldTextControllerValidator;
  // State field(s) for MouseRegionHome widget.
  bool mouseRegionHomeHovered = false;
  // State field(s) for MouseRegionFavor widget.
  bool mouseRegionFavorHovered = false;
  // State field(s) for MouseRegionProfil widget.
  bool mouseRegionProfilHovered = false;
  // State field(s) for MouseRegionCart widget.
  bool mouseRegionCartHovered = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchTextHederFieldFocusNode?.dispose();
    searchTextHederFieldTextController?.dispose();
  }
}
