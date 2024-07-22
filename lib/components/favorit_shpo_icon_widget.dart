import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'favorit_shpo_icon_model.dart';
export 'favorit_shpo_icon_model.dart';

class FavoritShpoIconWidget extends StatefulWidget {
  const FavoritShpoIconWidget({
    super.key,
    this.restoran,
  });

  final DocumentReference? restoran;

  @override
  State<FavoritShpoIconWidget> createState() => _FavoritShpoIconWidgetState();
}

class _FavoritShpoIconWidgetState extends State<FavoritShpoIconWidget> {
  late FavoritShpoIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoritShpoIconModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      builder: (context) => FlutterFlowIconButton(
        borderColor: (currentUserDocument?.favorit?.toList() ?? [])
                .contains(widget!.restoran)
            ? FlutterFlowTheme.of(context).error
            : Color(0xFF8A8A8A),
        borderRadius: 15.0,
        borderWidth: 2.0,
        buttonSize: 40.0,
        icon: Icon(
          Icons.favorite_rounded,
          color: (currentUserDocument?.favorit?.toList() ?? [])
                  .contains(widget!.restoran)
              ? FlutterFlowTheme.of(context).error
              : Color(0xFF8A8A8A),
          size: 25.0,
        ),
        onPressed: () {
          print('IconButton pressed ...');
        },
      ),
    );
  }
}
