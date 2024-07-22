// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:html' as html;

Future<void> updateStatusBarColor() async {
  // Удаляем предыдущий мета-тег, если он существует
  final existingMeta =
      html.document.head!.querySelector('meta[name="theme-color"]');
  if (existingMeta != null) {
    existingMeta.remove();
  }

  // Создаем и добавляем новый мета-тег
  final meta = html.MetaElement()
    ..name = 'theme-color'
    ..content = '#F8F8F8'; // Устанавливаем фиксированный цвет
  html.document.head!.append(meta);

  // Проверяем, добавлен ли мета-тег
  final addedMeta =
      html.document.head!.querySelector('meta[name="theme-color"]');
  if (addedMeta != null) {
    print('Meta tag added successfully');
  } else {
    print('Meta tag not added');
  }
}
