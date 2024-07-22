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
import 'package:intl/intl.dart'; // Для форматирования даты

Future<void> profileNewOrder(
    List<DocumentReference> currentCurtItem,
    DocumentReference restoran,
    double summaOrder,
    DocumentReference user,
    String recipient,
    String phoneNumber,
    String dropDownType,
    String? dropDownAddress,
    String comment,
    String userEmail,
    String restoranName) async {
  // Добавляем параметр restoranName
  try {
    // Получаем текущий порядковый номер для Order
    final orderCollection = FirebaseFirestore.instance.collection('Order');
    final orderQuerySnapshot = await orderCollection
        .orderBy('Number', descending: true)
        .limit(1)
        .get();
    int currentOrderNumber = 1;
    if (orderQuerySnapshot.docs.isNotEmpty) {
      currentOrderNumber = orderQuerySnapshot.docs.first['Number'] + 1;
    }

    // Определяем значения для delivery и deliveryaddress
    bool delivery = dropDownType == "Доставка";
    String deliveryaddress = delivery ? (dropDownAddress ?? '') : '';

    // Получаем текущий месяц в формате MM
    String currentMonth = DateFormat('MM').format(DateTime.now());

    // Создаем новый Order
    DocumentReference newOrderRef = await orderCollection.add({
      'Number': currentOrderNumber,
      'Date': DateTime.now(),
      'Timer': DateTime.now(),
      'Restoran': restoran,
      'delivery': delivery,
      'deliveryaddress': deliveryaddress,
      'SummaOrder': summaOrder,
      'User': user,
      'Item': [], // Изначально пустой список
      'status': 'Создан', // Добавляем поле статус
      'recipient': recipient, // Новое поле
      'phoneNumber': phoneNumber, // Новое поле
      'DateDD':
          currentMonth, // Добавляем поле DateDD с текущим месяцем в формате MM
      'comment': comment, // Добавляем поле comment
      'UserEmail': userEmail, // Добавляем поле UserEmail
      'restoranName': restoranName // Добавляем поле restoranName
    });

    // Обновляем AppState nuberOrder и DateOrder
    FFAppState().update(() {
      FFAppState().nuberOrder = currentOrderNumber.toString();
      FFAppState().DateOrder = DateTime.now();
    });

    // Логирование для проверки записи данных
    print('Order Number: ${FFAppState().nuberOrder}');
    print('Order Date: ${FFAppState().DateOrder}');

    List<DocumentReference> orderItemRefs =
        []; // Инициализация списка для ссылок на Order_item

    // Перемещаем элементы в Order_item и добавляем ссылки в Order
    for (final cartItemRef in currentCurtItem) {
      final cartItem = await cartItemRef.get();
      if (cartItem.exists) {
        // Приведение данных cartItem к Map<String, dynamic>
        final cartItemData = cartItem.data() as Map<String, dynamic>;

        // Прямое копирование поля OptionTXT
        List<String> optionsTXT = [];
        if (cartItemData.containsKey('OptionTXT') &&
            cartItemData['OptionTXT'] != null) {
          optionsTXT = List<String>.from(cartItemData['OptionTXT']);
        }

        // Создаем новый Order_item
        DocumentReference newOrderItemRef =
            await FirebaseFirestore.instance.collection('Order_item').add({
          'product': cartItemData['product'], // Копируем ссылку на продукт
          'quantity': cartItemData['quantity'],
          'user': cartItemData['user'],
          'name': cartItemData['name'],
          'discription': cartItemData['discription'],
          'price': cartItemData['price'],
          'allergies': cartItemData['allergies'],
          'ves': cartItemData['ves'],
          'kkal': cartItemData['kkal'],
          'b': cartItemData['b'],
          'zh': cartItemData['zh'],
          'u': cartItemData['u'],
          'CategoryBluda': cartItemData['CategoryBluda'],
          'image': cartItemData['image'],
          'oldPrise': cartItemData['oldPrise'],
          'restoran': cartItemData['restoran'],
          'restoranname': cartItemData['restoranname'],
          'TotalPrise': cartItemData['TotalPrise'],
          'OptionTXT': optionsTXT, // Копируем поле OptionTXT как массив строк
        });

        orderItemRefs.add(
            newOrderItemRef); // Добавляем ссылку на новый документ Order_item в список

        // Удаляем элемент из cart_items
        await cartItemRef.delete();

        // Удаляем элемент из productInCart в AppState
        FFAppState().update(() {
          FFAppState().productInCart.remove(cartItemData['product']);
        });
      }
    }

    // Обновляем Order с ссылками на Order_item
    await newOrderRef.update({
      'Item': orderItemRefs, // Используем список ссылок DocumentReference
    });
  } catch (e) {
    // Обработка ошибок, если необходимо
    print('Ошибка: $e');
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
