import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/main/my_reviews_web/my_reviews_web_widget.dart';
import '/profile/admin_report/admin_report_widget.dart';
import '/profile/del_profil/del_profil_widget.dart';
import '/profile/edit_name/edit_name_widget.dart';
import '/profile/logout/logout_widget.dart';
import '/profile/my_orders/my_orders_widget.dart';
import '/profile/partner_report/partner_report_widget.dart';
import 'profil_web_widget.dart' show ProfilWebWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfilWebModel extends FlutterFlowModel<ProfilWebWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
