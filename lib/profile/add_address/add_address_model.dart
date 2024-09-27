import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_address_widget.dart' show AddAddressWidget;
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddAddressModel extends FlutterFlowModel<AddAddressWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldname widget.
  FocusNode? textFieldnameFocusNode;
  TextEditingController? textFieldnameTextController;
  String? Function(BuildContext, String?)? textFieldnameTextControllerValidator;
  String? _textFieldnameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Напишите название своего адреса';
    }

    if (val.length > 20) {
      return 'Не более 20 символов';
    }

    return null;
  }

  // State field(s) for TextFieldAdress widget.
  FocusNode? textFieldAdressFocusNode;
  TextEditingController? textFieldAdressTextController;
  String? Function(BuildContext, String?)?
      textFieldAdressTextControllerValidator;
  String? _textFieldAdressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Укажите свой адресс';
    }

    return null;
  }

  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for TextFieldPod widget.
  FocusNode? textFieldPodFocusNode;
  TextEditingController? textFieldPodTextController;
  String? Function(BuildContext, String?)? textFieldPodTextControllerValidator;
  // State field(s) for TextFieldKV widget.
  FocusNode? textFieldKVFocusNode;
  TextEditingController? textFieldKVTextController;
  String? Function(BuildContext, String?)? textFieldKVTextControllerValidator;
  // State field(s) for TextFieldDomFon widget.
  FocusNode? textFieldDomFonFocusNode;
  TextEditingController? textFieldDomFonTextController;
  String? Function(BuildContext, String?)?
      textFieldDomFonTextControllerValidator;

  @override
  void initState(BuildContext context) {
    textFieldnameTextControllerValidator =
        _textFieldnameTextControllerValidator;
    textFieldAdressTextControllerValidator =
        _textFieldAdressTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldnameFocusNode?.dispose();
    textFieldnameTextController?.dispose();

    textFieldAdressFocusNode?.dispose();
    textFieldAdressTextController?.dispose();

    textFieldPodFocusNode?.dispose();
    textFieldPodTextController?.dispose();

    textFieldKVFocusNode?.dispose();
    textFieldKVTextController?.dispose();

    textFieldDomFonFocusNode?.dispose();
    textFieldDomFonTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
