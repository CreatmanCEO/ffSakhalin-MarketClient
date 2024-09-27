import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/del_history_order/del_history_order_widget.dart';
import '/profile/order_info/order_info_widget.dart';
import 'my_orders_widget.dart' show MyOrdersWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyOrdersModel extends FlutterFlowModel<MyOrdersWidget> {
  ///  Local state fields for this component.

  bool itemInfo = true;

  bool itemReview = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
