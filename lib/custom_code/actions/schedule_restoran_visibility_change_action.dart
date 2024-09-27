// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> scheduleRestoranVisibilityChangeAction(
    String orderId, String restoranId) async {
  CollectionReference tasks =
      FirebaseFirestore.instance.collection('ScheduledTasks');
  Timestamp scheduledTime = Timestamp.fromDate(
      DateTime.now().add(Duration(minutes: 600))); // 8 минуты

  await tasks.add({
    'orderId': orderId,
    'restoranId': restoranId,
    'taskType':
        'restoranVisibilityChange', // Добавим тип задачи для идентификации
    'scheduledTime': scheduledTime,
  }).then((_) {
    print("Visibility change scheduled successfully!");
  }).catchError((error) {
    print("Failed to schedule visibility change: $error");
  });
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
