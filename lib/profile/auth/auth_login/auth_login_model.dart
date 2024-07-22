import '/auth/firebase_auth/auth_util.dart';
import '/components/resetpassword_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'auth_login_widget.dart' show AuthLoginWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthLoginModel extends FlutterFlowModel<AuthLoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextFieldmailM widget.
  FocusNode? textFieldmailMFocusNode;
  TextEditingController? textFieldmailMTextController;
  String? Function(BuildContext, String?)?
      textFieldmailMTextControllerValidator;
  // State field(s) for TextFieldmail widget.
  FocusNode? textFieldmailFocusNode;
  TextEditingController? textFieldmailTextController;
  String? Function(BuildContext, String?)? textFieldmailTextControllerValidator;
  // State field(s) for TextFieldM widget.
  FocusNode? textFieldMFocusNode;
  TextEditingController? textFieldMTextController;
  late bool textFieldMVisibility;
  String? Function(BuildContext, String?)? textFieldMTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? passwordTextController2;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextController2Validator;

  @override
  void initState(BuildContext context) {
    textFieldMVisibility = false;
    passwordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldmailMFocusNode?.dispose();
    textFieldmailMTextController?.dispose();

    textFieldmailFocusNode?.dispose();
    textFieldmailTextController?.dispose();

    textFieldMFocusNode?.dispose();
    textFieldMTextController?.dispose();

    textFieldFocusNode?.dispose();
    passwordTextController2?.dispose();
  }
}
