import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'del_review_place_widget.dart' show DelReviewPlaceWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DelReviewPlaceModel extends FlutterFlowModel<DelReviewPlaceWidget> {
  ///  State fields for stateful widgets in this component.

  List<ReviewsRecord>? containerPreviousSnapshot;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
