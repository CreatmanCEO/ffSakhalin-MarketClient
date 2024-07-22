import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'review_order_widget.dart' show ReviewOrderWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReviewOrderModel extends FlutterFlowModel<ReviewOrderWidget> {
  ///  Local state fields for this component.

  DocumentReference? product;

  String? tovarName;

  List<DocumentReference> listReviev = [];
  void addToListReviev(DocumentReference item) => listReviev.add(item);
  void removeFromListReviev(DocumentReference item) => listReviev.remove(item);
  void removeAtIndexFromListReviev(int index) => listReviev.removeAt(index);
  void insertAtIndexInListReviev(int index, DocumentReference item) =>
      listReviev.insert(index, item);
  void updateListRevievAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      listReviev[index] = updateFn(listReviev[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for TextOrderReview widget.
  FocusNode? textOrderReviewFocusNode;
  TextEditingController? textOrderReviewTextController;
  String? Function(BuildContext, String?)?
      textOrderReviewTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ReviewsRecord? action1Copy;
  // State field(s) for TextItemReview widget.
  FocusNode? textItemReviewFocusNode;
  TextEditingController? textItemReviewTextController;
  String? Function(BuildContext, String?)?
      textItemReviewTextControllerValidator;
  // State field(s) for RatingBarProd widget.
  double? ratingBarProdValue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ReviewsRecord? action;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textOrderReviewFocusNode?.dispose();
    textOrderReviewTextController?.dispose();

    textItemReviewFocusNode?.dispose();
    textItemReviewTextController?.dispose();
  }
}
