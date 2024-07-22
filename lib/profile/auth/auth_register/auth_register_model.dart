import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'auth_register_widget.dart' show AuthRegisterWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class AuthRegisterModel extends FlutterFlowModel<AuthRegisterWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextFieldname widget.
  FocusNode? textFieldnameFocusNode1;
  TextEditingController? textFieldnameTextController1;
  String? Function(BuildContext, String?)?
      textFieldnameTextController1Validator;
  // State field(s) for TextFieldEmail widget.
  FocusNode? textFieldEmailFocusNode1;
  TextEditingController? textFieldEmailTextController1;
  String? Function(BuildContext, String?)?
      textFieldEmailTextController1Validator;
  // State field(s) for TextFieldPhone widget.
  FocusNode? textFieldPhoneFocusNode1;
  TextEditingController? textFieldPhoneTextController1;
  final textFieldPhoneMask1 =
      MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)?
      textFieldPhoneTextController1Validator;
  // State field(s) for TextFieldPAssword widget.
  FocusNode? textFieldPAsswordFocusNode1;
  TextEditingController? textFieldPAsswordTextController1;
  late bool textFieldPAsswordVisibility1;
  String? Function(BuildContext, String?)?
      textFieldPAsswordTextController1Validator;
  // State field(s) for TextFieldname widget.
  FocusNode? textFieldnameFocusNode2;
  TextEditingController? textFieldnameTextController2;
  String? Function(BuildContext, String?)?
      textFieldnameTextController2Validator;
  // State field(s) for TextFieldEmail widget.
  FocusNode? textFieldEmailFocusNode2;
  TextEditingController? textFieldEmailTextController2;
  String? Function(BuildContext, String?)?
      textFieldEmailTextController2Validator;
  // State field(s) for TextFieldPhone widget.
  FocusNode? textFieldPhoneFocusNode2;
  TextEditingController? textFieldPhoneTextController2;
  final textFieldPhoneMask2 =
      MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)?
      textFieldPhoneTextController2Validator;
  // State field(s) for TextFieldPAssword widget.
  FocusNode? textFieldPAsswordFocusNode2;
  TextEditingController? textFieldPAsswordTextController2;
  late bool textFieldPAsswordVisibility2;
  String? Function(BuildContext, String?)?
      textFieldPAsswordTextController2Validator;

  @override
  void initState(BuildContext context) {
    textFieldPAsswordVisibility1 = false;
    textFieldPAsswordVisibility2 = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldnameFocusNode1?.dispose();
    textFieldnameTextController1?.dispose();

    textFieldEmailFocusNode1?.dispose();
    textFieldEmailTextController1?.dispose();

    textFieldPhoneFocusNode1?.dispose();
    textFieldPhoneTextController1?.dispose();

    textFieldPAsswordFocusNode1?.dispose();
    textFieldPAsswordTextController1?.dispose();

    textFieldnameFocusNode2?.dispose();
    textFieldnameTextController2?.dispose();

    textFieldEmailFocusNode2?.dispose();
    textFieldEmailTextController2?.dispose();

    textFieldPhoneFocusNode2?.dispose();
    textFieldPhoneTextController2?.dispose();

    textFieldPAsswordFocusNode2?.dispose();
    textFieldPAsswordTextController2?.dispose();
  }
}
