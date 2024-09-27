import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'fav_item_icon_model.dart';
export 'fav_item_icon_model.dart';

class FavItemIconWidget extends StatefulWidget {
  const FavItemIconWidget({
    super.key,
    this.product,
  });

  final DocumentReference? product;

  @override
  State<FavItemIconWidget> createState() => _FavItemIconWidgetState();
}

class _FavItemIconWidgetState extends State<FavItemIconWidget> {
  late FavItemIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavItemIconModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
                .contains(widget!.product)
            ? FlutterFlowTheme.of(context).error
            : Color(0xFF8A8A8A),
        borderRadius: 15.0,
        borderWidth: 2.0,
        buttonSize: 40.0,
        icon: Icon(
          Icons.favorite_rounded,
          color: (currentUserDocument?.favorit?.toList() ?? [])
                  .contains(widget!.product)
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
