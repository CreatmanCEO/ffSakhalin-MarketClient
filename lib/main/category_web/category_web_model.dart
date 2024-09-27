import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/place_component/place_component_widget.dart';
import '/main/stop_login/stop_login_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'category_web_widget.dart' show CategoryWebWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryWebModel extends FlutterFlowModel<CategoryWebWidget> {
  ///  Local state fields for this page.

  bool? sortRatinr = false;

  bool? sortName = false;

  bool? filtrCartPay = false;

  bool? filtrSamovivos = false;

  bool pageHome = true;

  bool saerh = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
