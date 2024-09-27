import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/main/info_closed/info_closed_widget.dart';
import '/profile/add_address/add_address_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'new_order_widget.dart' show NewOrderWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class NewOrderModel extends FlutterFlowModel<NewOrderWidget> {
  ///  Local state fields for this page.

  List<CartItemsRecord> cart = [];
  void addToCart(CartItemsRecord item) => cart.add(item);
  void removeFromCart(CartItemsRecord item) => cart.remove(item);
  void removeAtIndexFromCart(int index) => cart.removeAt(index);
  void insertAtIndexInCart(int index, CartItemsRecord item) =>
      cart.insert(index, item);
  void updateCartAtIndex(int index, Function(CartItemsRecord) updateFn) =>
      cart[index] = updateFn(cart[index]);

  String? adresName;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final formKey6 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey5 = GlobalKey<FormState>();
  // State field(s) for DropDownTypeM widget.
  String? dropDownTypeMValue;
  FormFieldController<String>? dropDownTypeMValueController;
  // State field(s) for DropDownAdresM widget.
  String? dropDownAdresMValue;
  FormFieldController<String>? dropDownAdresMValueController;
  // State field(s) for TextFieldNameM widget.
  FocusNode? textFieldNameMFocusNode;
  TextEditingController? textFieldNameMTextController;
  String? Function(BuildContext, String?)?
      textFieldNameMTextControllerValidator;
  String? _textFieldNameMTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Укажите имя';
    }

    return null;
  }

  // State field(s) for TextFieldPhoneM widget.
  FocusNode? textFieldPhoneMFocusNode;
  TextEditingController? textFieldPhoneMTextController;
  final textFieldPhoneMMask =
      MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)?
      textFieldPhoneMTextControllerValidator;
  String? _textFieldPhoneMTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Укажите номер телефона';
    }

    return null;
  }

  // State field(s) for DropDownM widget.
  String? dropDownMValue;
  FormFieldController<String>? dropDownMValueController;
  // State field(s) for TextFieldcomment widget.
  FocusNode? textFieldcommentFocusNode;
  TextEditingController? textFieldcommentTextController;
  String? Function(BuildContext, String?)?
      textFieldcommentTextControllerValidator;
  // State field(s) for DropDownType widget.
  String? dropDownTypeValue;
  FormFieldController<String>? dropDownTypeValueController;
  // State field(s) for DropDownAdresV widget.
  String? dropDownAdresVValue;
  FormFieldController<String>? dropDownAdresVValueController;
  // State field(s) for TextFieldName widget.
  FocusNode? textFieldNameFocusNode;
  TextEditingController? textFieldNameTextController;
  String? Function(BuildContext, String?)? textFieldNameTextControllerValidator;
  String? _textFieldNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Укажите имя';
    }

    return null;
  }

  // State field(s) for TextFieldPhone widget.
  FocusNode? textFieldPhoneFocusNode;
  TextEditingController? textFieldPhoneTextController;
  final textFieldPhoneMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)?
      textFieldPhoneTextControllerValidator;
  String? _textFieldPhoneTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Укажите номер телефона';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextFieldkomentVEB widget.
  FocusNode? textFieldkomentVEBFocusNode;
  TextEditingController? textFieldkomentVEBTextController;
  String? Function(BuildContext, String?)?
      textFieldkomentVEBTextControllerValidator;

  @override
  void initState(BuildContext context) {
    textFieldNameMTextControllerValidator =
        _textFieldNameMTextControllerValidator;
    textFieldPhoneMTextControllerValidator =
        _textFieldPhoneMTextControllerValidator;
    textFieldNameTextControllerValidator =
        _textFieldNameTextControllerValidator;
    textFieldPhoneTextControllerValidator =
        _textFieldPhoneTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldNameMFocusNode?.dispose();
    textFieldNameMTextController?.dispose();

    textFieldPhoneMFocusNode?.dispose();
    textFieldPhoneMTextController?.dispose();

    textFieldcommentFocusNode?.dispose();
    textFieldcommentTextController?.dispose();

    textFieldNameFocusNode?.dispose();
    textFieldNameTextController?.dispose();

    textFieldPhoneFocusNode?.dispose();
    textFieldPhoneTextController?.dispose();

    textFieldkomentVEBFocusNode?.dispose();
    textFieldkomentVEBTextController?.dispose();
  }
}
