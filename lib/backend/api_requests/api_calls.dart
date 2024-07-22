import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class DadataCall {
  static Future<ApiCallResponse> call({
    String? adress = '',
  }) async {
    final ffApiRequestBody = '''
{"query": "${adress}"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'dadata',
      apiUrl:
          'https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Token d93b751b450cd35b305e4206416be2d9af0c7863',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? adress(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PostMarkCall {
  static Future<ApiCallResponse> call({
    String? to = '',
    String? subject = '',
    String? zakaz = '',
    String? text = '',
  }) async {
    final ffApiRequestBody = '''
{
  "From": "info@sakhalin-market.ru",
  "To": "${to}",
  "Subject": "${subject}",
  "TextBody": "Hello dear Postmark user.",
  "HtmlBody": "<html><body><strong>${zakaz}</strong> ${text}.</body></html>",
  "MessageStream": "outbound"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PostMark',
      apiUrl: 'https://api.postmarkapp.com/email',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Postmark-Server-Token': 'a2c100a2-5ec8-4bb1-a106-170bcd296279',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
