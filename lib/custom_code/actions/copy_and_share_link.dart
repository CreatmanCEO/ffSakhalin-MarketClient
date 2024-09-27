// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart'; // Для работы с буфером обмена
import 'package:share_plus/share_plus.dart'; // Для открытия системного меню шаринга

Future<void> copyAndShareLink(BuildContext context, String pageUrl) async {
  try {
    // Копируем ссылку в буфер обмена
    await Clipboard.setData(ClipboardData(text: pageUrl));

    // Открываем меню для шаринга
    Share.share(pageUrl);
  } catch (e) {
    // Обработка ошибок
    print('Ошибка при копировании ссылки и открытии меню шаринга: $e');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
