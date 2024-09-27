import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/cart_web/cart_web_widget.dart';
import '/main/item_web/item_web_widget.dart';
import '/main/place_component/place_component_widget.dart';
import '/main/stop_login/stop_login_widget.dart';
import '/profile/profil_web/profil_web_widget.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'favour_web_widget.dart' show FavourWebWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavourWebModel extends FlutterFlowModel<FavourWebWidget> {
  ///  Local state fields for this page.

  bool? shop = true;

  bool? item = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for MouseRegionHome widget.
  bool mouseRegionHomeHovered = false;
  // State field(s) for MouseRegionFavor widget.
  bool mouseRegionFavorHovered = false;
  // State field(s) for MouseRegionProfil widget.
  bool mouseRegionProfilHovered = false;
  // State field(s) for MouseRegionCart widget.
  bool mouseRegionCartHovered = false;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CartItemsRecord? createcartItem;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
