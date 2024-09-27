import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/stop_login/stop_login_widget.dart';
import '/profile/add_dop_components/add_dop_components_widget.dart';
import '/profile/del_review_item/del_review_item_widget.dart';
import 'current_item_widget.dart' show CurrentItemWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class CurrentItemModel extends FlutterFlowModel<CurrentItemWidget> {
  ///  Local state fields for this page.

  bool itemInfo = true;

  bool itemReview = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
