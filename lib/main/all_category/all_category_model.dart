import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/request_manager.dart';

import 'all_category_widget.dart' show AllCategoryWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllCategoryModel extends FlutterFlowModel<AllCategoryWidget> {
  ///  Local state fields for this page.

  List<CategoryOfRestaurantCuisineRecord> allCategor = [];
  void addToAllCategor(CategoryOfRestaurantCuisineRecord item) =>
      allCategor.add(item);
  void removeFromAllCategor(CategoryOfRestaurantCuisineRecord item) =>
      allCategor.remove(item);
  void removeAtIndexFromAllCategor(int index) => allCategor.removeAt(index);
  void insertAtIndexInAllCategor(
          int index, CategoryOfRestaurantCuisineRecord item) =>
      allCategor.insert(index, item);
  void updateAllCategorAtIndex(
          int index, Function(CategoryOfRestaurantCuisineRecord) updateFn) =>
      allCategor[index] = updateFn(allCategor[index]);

  /// Query cache managers for this widget.

  final _allCategoryManager =
      FutureRequestManager<List<CategoryOfRestaurantCuisineRecord>>();
  Future<List<CategoryOfRestaurantCuisineRecord>> allCategory({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<CategoryOfRestaurantCuisineRecord>> Function()
        requestFn,
  }) =>
      _allCategoryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAllCategoryCache() => _allCategoryManager.clear();
  void clearAllCategoryCacheKey(String? uniqueKey) =>
      _allCategoryManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearAllCategoryCache();
  }
}
