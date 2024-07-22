import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _productInCart = prefs
              .getStringList('ff_productInCart')
              ?.map((path) => path.ref)
              .toList() ??
          _productInCart;
    });
    _safeInit(() {
      _StateManagement = prefs
              .getStringList('ff_StateManagement')
              ?.map((path) => path.ref)
              .toList() ??
          _StateManagement;
    });
    _safeInit(() {
      _cartItems = prefs.getStringList('ff_cartItems')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _cartItems;
    });
    _safeInit(() {
      _uniqueRestaurants =
          prefs.getStringList('ff_uniqueRestaurants')?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _uniqueRestaurants;
    });
    _safeInit(() {
      _SummOrder = prefs.getDouble('ff_SummOrder') ?? _SummOrder;
    });
    _safeInit(() {
      _numListItems = prefs.getInt('ff_numListItems') ?? _numListItems;
    });
    _safeInit(() {
      _currentUserAdress =
          prefs.getString('ff_currentUserAdress')?.ref ?? _currentUserAdress;
    });
    _safeInit(() {
      _OptionTXT = prefs.getStringList('ff_OptionTXT') ?? _OptionTXT;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<DocumentReference> _currentRestCategory = [];
  List<DocumentReference> get currentRestCategory => _currentRestCategory;
  set currentRestCategory(List<DocumentReference> value) {
    _currentRestCategory = value;
  }

  void addToCurrentRestCategory(DocumentReference value) {
    currentRestCategory.add(value);
  }

  void removeFromCurrentRestCategory(DocumentReference value) {
    currentRestCategory.remove(value);
  }

  void removeAtIndexFromCurrentRestCategory(int index) {
    currentRestCategory.removeAt(index);
  }

  void updateCurrentRestCategoryAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    currentRestCategory[index] = updateFn(_currentRestCategory[index]);
  }

  void insertAtIndexInCurrentRestCategory(int index, DocumentReference value) {
    currentRestCategory.insert(index, value);
  }

  List<String> _katagoryRestName = [];
  List<String> get katagoryRestName => _katagoryRestName;
  set katagoryRestName(List<String> value) {
    _katagoryRestName = value;
  }

  void addToKatagoryRestName(String value) {
    katagoryRestName.add(value);
  }

  void removeFromKatagoryRestName(String value) {
    katagoryRestName.remove(value);
  }

  void removeAtIndexFromKatagoryRestName(int index) {
    katagoryRestName.removeAt(index);
  }

  void updateKatagoryRestNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    katagoryRestName[index] = updateFn(_katagoryRestName[index]);
  }

  void insertAtIndexInKatagoryRestName(int index, String value) {
    katagoryRestName.insert(index, value);
  }

  String _filtrCategoryCurrentRest = '';
  String get filtrCategoryCurrentRest => _filtrCategoryCurrentRest;
  set filtrCategoryCurrentRest(String value) {
    _filtrCategoryCurrentRest = value;
  }

  List<DocumentReference> _productInCart = [];
  List<DocumentReference> get productInCart => _productInCart;
  set productInCart(List<DocumentReference> value) {
    _productInCart = value;
    prefs.setStringList('ff_productInCart', value.map((x) => x.path).toList());
  }

  void addToProductInCart(DocumentReference value) {
    productInCart.add(value);
    prefs.setStringList(
        'ff_productInCart', _productInCart.map((x) => x.path).toList());
  }

  void removeFromProductInCart(DocumentReference value) {
    productInCart.remove(value);
    prefs.setStringList(
        'ff_productInCart', _productInCart.map((x) => x.path).toList());
  }

  void removeAtIndexFromProductInCart(int index) {
    productInCart.removeAt(index);
    prefs.setStringList(
        'ff_productInCart', _productInCart.map((x) => x.path).toList());
  }

  void updateProductInCartAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    productInCart[index] = updateFn(_productInCart[index]);
    prefs.setStringList(
        'ff_productInCart', _productInCart.map((x) => x.path).toList());
  }

  void insertAtIndexInProductInCart(int index, DocumentReference value) {
    productInCart.insert(index, value);
    prefs.setStringList(
        'ff_productInCart', _productInCart.map((x) => x.path).toList());
  }

  List<DocumentReference> _StateManagement = [];
  List<DocumentReference> get StateManagement => _StateManagement;
  set StateManagement(List<DocumentReference> value) {
    _StateManagement = value;
    prefs.setStringList(
        'ff_StateManagement', value.map((x) => x.path).toList());
  }

  void addToStateManagement(DocumentReference value) {
    StateManagement.add(value);
    prefs.setStringList(
        'ff_StateManagement', _StateManagement.map((x) => x.path).toList());
  }

  void removeFromStateManagement(DocumentReference value) {
    StateManagement.remove(value);
    prefs.setStringList(
        'ff_StateManagement', _StateManagement.map((x) => x.path).toList());
  }

  void removeAtIndexFromStateManagement(int index) {
    StateManagement.removeAt(index);
    prefs.setStringList(
        'ff_StateManagement', _StateManagement.map((x) => x.path).toList());
  }

  void updateStateManagementAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    StateManagement[index] = updateFn(_StateManagement[index]);
    prefs.setStringList(
        'ff_StateManagement', _StateManagement.map((x) => x.path).toList());
  }

  void insertAtIndexInStateManagement(int index, DocumentReference value) {
    StateManagement.insert(index, value);
    prefs.setStringList(
        'ff_StateManagement', _StateManagement.map((x) => x.path).toList());
  }

  List<dynamic> _cartItems = [];
  List<dynamic> get cartItems => _cartItems;
  set cartItems(List<dynamic> value) {
    _cartItems = value;
    prefs.setStringList(
        'ff_cartItems', value.map((x) => jsonEncode(x)).toList());
  }

  void addToCartItems(dynamic value) {
    cartItems.add(value);
    prefs.setStringList(
        'ff_cartItems', _cartItems.map((x) => jsonEncode(x)).toList());
  }

  void removeFromCartItems(dynamic value) {
    cartItems.remove(value);
    prefs.setStringList(
        'ff_cartItems', _cartItems.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromCartItems(int index) {
    cartItems.removeAt(index);
    prefs.setStringList(
        'ff_cartItems', _cartItems.map((x) => jsonEncode(x)).toList());
  }

  void updateCartItemsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    cartItems[index] = updateFn(_cartItems[index]);
    prefs.setStringList(
        'ff_cartItems', _cartItems.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInCartItems(int index, dynamic value) {
    cartItems.insert(index, value);
    prefs.setStringList(
        'ff_cartItems', _cartItems.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _uniqueRestaurants = [];
  List<dynamic> get uniqueRestaurants => _uniqueRestaurants;
  set uniqueRestaurants(List<dynamic> value) {
    _uniqueRestaurants = value;
    prefs.setStringList(
        'ff_uniqueRestaurants', value.map((x) => jsonEncode(x)).toList());
  }

  void addToUniqueRestaurants(dynamic value) {
    uniqueRestaurants.add(value);
    prefs.setStringList('ff_uniqueRestaurants',
        _uniqueRestaurants.map((x) => jsonEncode(x)).toList());
  }

  void removeFromUniqueRestaurants(dynamic value) {
    uniqueRestaurants.remove(value);
    prefs.setStringList('ff_uniqueRestaurants',
        _uniqueRestaurants.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromUniqueRestaurants(int index) {
    uniqueRestaurants.removeAt(index);
    prefs.setStringList('ff_uniqueRestaurants',
        _uniqueRestaurants.map((x) => jsonEncode(x)).toList());
  }

  void updateUniqueRestaurantsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    uniqueRestaurants[index] = updateFn(_uniqueRestaurants[index]);
    prefs.setStringList('ff_uniqueRestaurants',
        _uniqueRestaurants.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInUniqueRestaurants(int index, dynamic value) {
    uniqueRestaurants.insert(index, value);
    prefs.setStringList('ff_uniqueRestaurants',
        _uniqueRestaurants.map((x) => jsonEncode(x)).toList());
  }

  double _SummOrder = 0.0;
  double get SummOrder => _SummOrder;
  set SummOrder(double value) {
    _SummOrder = value;
    prefs.setDouble('ff_SummOrder', value);
  }

  int _numListItems = 0;
  int get numListItems => _numListItems;
  set numListItems(int value) {
    _numListItems = value;
    prefs.setInt('ff_numListItems', value);
  }

  String _currentPageNavBar = '';
  String get currentPageNavBar => _currentPageNavBar;
  set currentPageNavBar(String value) {
    _currentPageNavBar = value;
  }

  String _AdressUser = '';
  String get AdressUser => _AdressUser;
  set AdressUser(String value) {
    _AdressUser = value;
  }

  DocumentReference? _currentUserAdress;
  DocumentReference? get currentUserAdress => _currentUserAdress;
  set currentUserAdress(DocumentReference? value) {
    _currentUserAdress = value;
    value != null
        ? prefs.setString('ff_currentUserAdress', value.path)
        : prefs.remove('ff_currentUserAdress');
  }

  String _searchText = '';
  String get searchText => _searchText;
  set searchText(String value) {
    _searchText = value;
  }

  String _searchTextMenu = '';
  String get searchTextMenu => _searchTextMenu;
  set searchTextMenu(String value) {
    _searchTextMenu = value;
  }

  List<double> _summOptionItem = [];
  List<double> get summOptionItem => _summOptionItem;
  set summOptionItem(List<double> value) {
    _summOptionItem = value;
  }

  void addToSummOptionItem(double value) {
    summOptionItem.add(value);
  }

  void removeFromSummOptionItem(double value) {
    summOptionItem.remove(value);
  }

  void removeAtIndexFromSummOptionItem(int index) {
    summOptionItem.removeAt(index);
  }

  void updateSummOptionItemAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    summOptionItem[index] = updateFn(_summOptionItem[index]);
  }

  void insertAtIndexInSummOptionItem(int index, double value) {
    summOptionItem.insert(index, value);
  }

  List<DocumentReference> _refOptionItem = [];
  List<DocumentReference> get refOptionItem => _refOptionItem;
  set refOptionItem(List<DocumentReference> value) {
    _refOptionItem = value;
  }

  void addToRefOptionItem(DocumentReference value) {
    refOptionItem.add(value);
  }

  void removeFromRefOptionItem(DocumentReference value) {
    refOptionItem.remove(value);
  }

  void removeAtIndexFromRefOptionItem(int index) {
    refOptionItem.removeAt(index);
  }

  void updateRefOptionItemAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    refOptionItem[index] = updateFn(_refOptionItem[index]);
  }

  void insertAtIndexInRefOptionItem(int index, DocumentReference value) {
    refOptionItem.insert(index, value);
  }

  List<String> _OptionTXT = [];
  List<String> get OptionTXT => _OptionTXT;
  set OptionTXT(List<String> value) {
    _OptionTXT = value;
    prefs.setStringList('ff_OptionTXT', value);
  }

  void addToOptionTXT(String value) {
    OptionTXT.add(value);
    prefs.setStringList('ff_OptionTXT', _OptionTXT);
  }

  void removeFromOptionTXT(String value) {
    OptionTXT.remove(value);
    prefs.setStringList('ff_OptionTXT', _OptionTXT);
  }

  void removeAtIndexFromOptionTXT(int index) {
    OptionTXT.removeAt(index);
    prefs.setStringList('ff_OptionTXT', _OptionTXT);
  }

  void updateOptionTXTAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    OptionTXT[index] = updateFn(_OptionTXT[index]);
    prefs.setStringList('ff_OptionTXT', _OptionTXT);
  }

  void insertAtIndexInOptionTXT(int index, String value) {
    OptionTXT.insert(index, value);
    prefs.setStringList('ff_OptionTXT', _OptionTXT);
  }

  String _UserPhoto = '';
  String get UserPhoto => _UserPhoto;
  set UserPhoto(String value) {
    _UserPhoto = value;
  }

  bool _terms = false;
  bool get terms => _terms;
  set terms(bool value) {
    _terms = value;
  }

  DocumentReference? _test;
  DocumentReference? get test => _test;
  set test(DocumentReference? value) {
    _test = value;
  }

  String _nuberOrder = '';
  String get nuberOrder => _nuberOrder;
  set nuberOrder(String value) {
    _nuberOrder = value;
  }

  DateTime? _DateOrder;
  DateTime? get DateOrder => _DateOrder;
  set DateOrder(DateTime? value) {
    _DateOrder = value;
  }

  String _nameUser = '';
  String get nameUser => _nameUser;
  set nameUser(String value) {
    _nameUser = value;
  }

  String _PhoneUser = '';
  String get PhoneUser => _PhoneUser;
  set PhoneUser(String value) {
    _PhoneUser = value;
  }

  String _delyverySamovivos = '';
  String get delyverySamovivos => _delyverySamovivos;
  set delyverySamovivos(String value) {
    _delyverySamovivos = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
