import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile/review_order/review_order_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'order_info_widget.dart' show OrderInfoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderInfoModel extends FlutterFlowModel<OrderInfoWidget> {
  ///  Local state fields for this component.

  bool itemInfo = true;

  bool itemReview = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
