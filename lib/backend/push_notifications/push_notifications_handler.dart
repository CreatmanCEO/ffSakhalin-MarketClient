import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Color(0x00F84F0E),
          child: Image.asset(
            'assets/images/1_0_Splash.png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'profile': ParameterData.none(),
  'checkout': ParameterData.none(),
  'orderList': ParameterData.none(),
  'currentOrder': (data) async => ParameterData(
        allParams: {
          'currentOrder': await getDocumentParameter<OrderRecord>(
              data, 'currentOrder', OrderRecord.fromSnapshot),
          'restoran': await getDocumentParameter<RestoranRecord>(
              data, 'restoran', RestoranRecord.fromSnapshot),
          'ref': getParameter<bool>(data, 'ref'),
        },
      ),
  'myAddresses': ParameterData.none(),
  'newOrder': (data) async => ParameterData(
        allParams: {
          'restoran': await getDocumentParameter<RestoranRecord>(
              data, 'restoran', RestoranRecord.fromSnapshot),
        },
      ),
  'favour': ParameterData.none(),
  'cart': (data) async => ParameterData(
        allParams: {
          'back': getParameter<bool>(data, 'back'),
        },
      ),
  'myReviews': ParameterData.none(),
  'load': ParameterData.none(),
  'place': (data) async => ParameterData(
        allParams: {
          'restoran': await getDocumentParameter<RestoranRecord>(
              data, 'restoran', RestoranRecord.fromSnapshot),
          'otzyv': getParameter<bool>(data, 'otzyv'),
        },
      ),
  'main': ParameterData.none(),
  'category': (data) async => ParameterData(
        allParams: {
          'categoryName': getParameter<String>(data, 'categoryName'),
        },
      ),
  'search': ParameterData.none(),
  'allCategory': ParameterData.none(),
  'saleMob': ParameterData.none(),
  'allRating': ParameterData.none(),
  'allCategoryWeb': ParameterData.none(),
  'searchWeb': ParameterData.none(),
  'categoryWeb': (data) async => ParameterData(
        allParams: {
          'categoryName': getParameter<String>(data, 'categoryName'),
        },
      ),
  'installAppInfo': ParameterData.none(),
  'ratingWeb': ParameterData.none(),
  'sale': ParameterData.none(),
  'currentItem': (data) async => ParameterData(
        allParams: {
          'currentTovar': await getDocumentParameter<MenuRecord>(
              data, 'currentTovar', MenuRecord.fromSnapshot),
          'otzyv': getParameter<bool>(data, 'otzyv'),
        },
      ),
  'login': ParameterData.none(),
  'smsLogin': ParameterData.none(),
  'smsReg': ParameterData.none(),
  'privacy_policy': ParameterData.none(),
  'rules': ParameterData.none(),
  'favourWeb': ParameterData.none(),
  'qrPage': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
