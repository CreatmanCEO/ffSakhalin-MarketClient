import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/cart_web/cart_web_widget.dart';
import '/main/item_comp_searche/item_comp_searche_widget.dart';
import '/main/item_web/item_web_widget.dart';
import '/main/place_component/place_component_widget.dart';
import '/main/stop_login/stop_login_widget.dart';
import '/profile/profil_web/profil_web_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'main_widget.dart' show MainWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainModel extends FlutterFlowModel<MainWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  // State field(s) for MouseRegionHome widget.
  bool mouseRegionHomeHovered = false;
  // State field(s) for MouseRegionFavor widget.
  bool mouseRegionFavorHovered = false;
  // State field(s) for MouseRegionProfil widget.
  bool mouseRegionProfilHovered = false;
  // State field(s) for MouseRegionCart widget.
  bool mouseRegionCartHovered = false;

  /// Query cache managers for this widget.

  final _saleTovarManager = StreamRequestManager<List<MenuRecord>>();
  Stream<List<MenuRecord>> saleTovar({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<MenuRecord>> Function() requestFn,
  }) =>
      _saleTovarManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSaleTovarCache() => _saleTovarManager.clear();
  void clearSaleTovarCacheKey(String? uniqueKey) =>
      _saleTovarManager.clearRequest(uniqueKey);

  final _popularTovarManager = StreamRequestManager<List<MenuRecord>>();
  Stream<List<MenuRecord>> popularTovar({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<MenuRecord>> Function() requestFn,
  }) =>
      _popularTovarManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPopularTovarCache() => _popularTovarManager.clear();
  void clearPopularTovarCacheKey(String? uniqueKey) =>
      _popularTovarManager.clearRequest(uniqueKey);

  final _banner1Manager = StreamRequestManager<List<Banner1Record>>();
  Stream<List<Banner1Record>> banner1({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<Banner1Record>> Function() requestFn,
  }) =>
      _banner1Manager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBanner1Cache() => _banner1Manager.clear();
  void clearBanner1CacheKey(String? uniqueKey) =>
      _banner1Manager.clearRequest(uniqueKey);

  final _banner2Manager = StreamRequestManager<List<Banner2Record>>();
  Stream<List<Banner2Record>> banner2({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<Banner2Record>> Function() requestFn,
  }) =>
      _banner2Manager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBanner2Cache() => _banner2Manager.clear();
  void clearBanner2CacheKey(String? uniqueKey) =>
      _banner2Manager.clearRequest(uniqueKey);

  final _banner31Manager = StreamRequestManager<List<Banner3Record>>();
  Stream<List<Banner3Record>> banner31({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<Banner3Record>> Function() requestFn,
  }) =>
      _banner31Manager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBanner31Cache() => _banner31Manager.clear();
  void clearBanner31CacheKey(String? uniqueKey) =>
      _banner31Manager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearSaleTovarCache();

    clearPopularTovarCache();

    clearBanner1Cache();

    clearBanner2Cache();

    clearBanner31Cache();
  }
}
