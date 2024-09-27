import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  Local state fields for this page.

  String? adtess;

  bool codeReg = false;

  bool codeLogin = false;

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextFieldVhod widget.
  FocusNode? textFieldVhodFocusNode;
  TextEditingController? textFieldVhodTextController;
  final textFieldVhodMask = MaskTextInputFormatter(mask: '##########');
  String? Function(BuildContext, String?)? textFieldVhodTextControllerValidator;
  String? _textFieldVhodTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле не может быть пустым';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (ZvonokFlashCall)] action in Button widget.
  ApiCallResponse? apiResultv1r;
  // State field(s) for TextFieldReg widget.
  FocusNode? textFieldRegFocusNode;
  TextEditingController? textFieldRegTextController;
  final textFieldRegMask = MaskTextInputFormatter(mask: '##########');
  String? Function(BuildContext, String?)? textFieldRegTextControllerValidator;
  String? _textFieldRegTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле не может быть пустым';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле не может быть пустым';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (ZvonokFlashCall)] action in Button widget.
  ApiCallResponse? apiResultv1r11;

  @override
  void initState(BuildContext context) {
    textFieldVhodTextControllerValidator =
        _textFieldVhodTextControllerValidator;
    textFieldRegTextControllerValidator = _textFieldRegTextControllerValidator;
    textController3Validator = _textController3Validator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    textFieldVhodFocusNode?.dispose();
    textFieldVhodTextController?.dispose();

    textFieldRegFocusNode?.dispose();
    textFieldRegTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();
  }
}
