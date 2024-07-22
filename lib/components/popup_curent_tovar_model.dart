import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/stop_go_login_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile/add_dop_components/add_dop_components_widget.dart';
import 'popup_curent_tovar_widget.dart' show PopupCurentTovarWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PopupCurentTovarModel extends FlutterFlowModel<PopupCurentTovarWidget> {
  ///  Local state fields for this component.

  bool itemInfo = true;

  bool itemReview = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
