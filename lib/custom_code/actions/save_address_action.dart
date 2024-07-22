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

class AdressUser {
  String? id;
  bool? status;
  String? name;
  String? adress;
  String? comments;
  String? entrance;
  String? korpus;
  String? kvartira;
  String? domofon;

  AdressUser({
    this.id,
    this.status,
    this.name,
    this.adress,
    this.comments,
    this.entrance,
    this.korpus,
    this.kvartira,
    this.domofon,
  });

  factory AdressUser.fromDocument(DocumentSnapshot doc) {
    return AdressUser(
      id: doc.id,
      status: doc['status'],
      name: doc['name'],
      adress: doc['adress'],
      comments: doc['comments'],
      entrance: doc['entrance'],
      korpus: doc['korpus'],
      kvartira: doc['kvartira'],
      domofon: doc['domofon'],
    );
  }
}

Future<void> saveAddressAction(DocumentReference currentUserReference,
    DocumentReference currentUserAdress) async {
  // Получаем текущего пользователя
  final userReference = currentUserReference;

  // Получаем все адреса текущего пользователя
  List<AdressUser> userAddresses = await FirebaseFirestore.instance
      .collection('AdressUser')
      .where('User', isEqualTo: userReference)
      .get()
      .then((snapshot) =>
          snapshot.docs.map((doc) => AdressUser.fromDocument(doc)).toList());

  // Обновляем статус всех адресов на false
  for (var address in userAddresses) {
    await FirebaseFirestore.instance
        .collection('AdressUser')
        .doc(address.id)
        .update({'status': false});
  }

  // Устанавливаем статус выбранного адреса на true
  String selectedAddressId = currentUserAdress.id;
  await FirebaseFirestore.instance
      .collection('AdressUser')
      .doc(selectedAddressId)
      .update({'status': true});
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
