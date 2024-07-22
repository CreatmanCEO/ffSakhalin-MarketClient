import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

List<RestoranRecord> filterRestaurantsByName(
  List<RestoranRecord> allRestaurants,
  String? name,
  List<String>? selectedCategories,
  bool sortByName,
  bool sortByRating,
  bool sortByMinOrderAmount,
  bool filterByCartPay,
  bool filterByQrCode,
  bool filterByPickup,
) {
  DateTime now = DateTime.now();
  TimeOfDay currentTime = TimeOfDay(hour: now.hour, minute: now.minute);

  List<RestoranRecord> filteredRestaurants = allRestaurants.where((restoran) {
    bool matchesName = name == null ||
        name.isEmpty ||
        (restoran.name != null &&
            name.split(' ').any((word) =>
                restoran.name!.toLowerCase().contains(word.toLowerCase())));

    bool matchesCategory = selectedCategories == null ||
        selectedCategories.isEmpty ||
        (restoran.kategoryKitchen != null &&
            restoran.kategoryKitchen!
                .any((category) => selectedCategories.contains(category)));

    bool matchesDeliveryOptions = false;

    if (filterByCartPay || filterByQrCode || filterByPickup) {
      if (filterByCartPay && restoran.cartPay) {
        matchesDeliveryOptions = true;
      }
      if (filterByQrCode && restoran.qrCode) {
        matchesDeliveryOptions = true;
      }
      if (filterByPickup && restoran.pickup) {
        matchesDeliveryOptions = true;
      }
    } else {
      matchesDeliveryOptions = true;
    }

    // Фильтрация по времени
    bool matchesTime = false;
    if (restoran.aroundTheClock == true) {
      matchesTime = true;
    } else if (restoran.timeStart != null && restoran.timeEnd != null) {
      DateTime timeStartDT = restoran.timeStart!;
      DateTime timeEndDT = restoran.timeEnd!;

      TimeOfDay timeStart = TimeOfDay.fromDateTime(timeStartDT);
      TimeOfDay timeEnd = TimeOfDay.fromDateTime(timeEndDT);

      bool isAfterStart = currentTime.hour > timeStart.hour ||
          (currentTime.hour == timeStart.hour &&
              currentTime.minute >= timeStart.minute);
      bool isBeforeEnd = currentTime.hour < timeEnd.hour ||
          (currentTime.hour == timeEnd.hour &&
              currentTime.minute <= timeEnd.minute);

      matchesTime = isAfterStart && isBeforeEnd;
    } else {
      matchesTime = true;
    }

    return matchesName &&
        matchesCategory &&
        matchesDeliveryOptions &&
        matchesTime;
  }).toList();

  if (sortByMinOrderAmount) {
    filteredRestaurants
        .sort((a, b) => a.minSumDelivery.compareTo(b.minSumDelivery));
  } else if (sortByRating) {
    filteredRestaurants.sort((a, b) => b.rating.compareTo(a.rating));
  } else if (sortByName) {
    filteredRestaurants.sort((a, b) {
      if (a.name == null) return 1;
      if (b.name == null) return -1;
      return a.name!.compareTo(b.name!);
    });
  }

  return filteredRestaurants;
}

List<RestoranRecord> filterRestaurantsByNameClose(
  List<RestoranRecord> allRestaurants,
  String? name,
  List<String>? selectedCategories,
  bool sortByName,
  bool sortByRating,
  bool sortByMinOrderAmount,
  bool filterByCartPay,
  bool filterByQrCode,
  bool filterByPickup,
) {
  DateTime now = DateTime.now();
  TimeOfDay currentTime = TimeOfDay(hour: now.hour, minute: now.minute);

  List<RestoranRecord> filteredRestaurants = allRestaurants.where((restoran) {
    // Если ресторан работает круглосуточно, не выводим его
    if (restoran.aroundTheClock == true) {
      return false;
    }

    bool matchesName = name == null ||
        name.isEmpty ||
        (restoran.name != null &&
            name.split(' ').any((word) =>
                restoran.name!.toLowerCase().contains(word.toLowerCase())));

    bool matchesCategory = selectedCategories == null ||
        selectedCategories.isEmpty ||
        (restoran.kategoryKitchen != null &&
            restoran.kategoryKitchen!
                .any((category) => selectedCategories.contains(category)));

    bool matchesDeliveryOptions = false;

    if (filterByCartPay || filterByQrCode || filterByPickup) {
      if (filterByCartPay && restoran.cartPay) {
        matchesDeliveryOptions = true;
      }
      if (filterByQrCode && restoran.qrCode) {
        matchesDeliveryOptions = true;
      }
      if (filterByPickup && restoran.pickup) {
        matchesDeliveryOptions = true;
      }
    } else {
      matchesDeliveryOptions = true;
    }

    // Фильтрация по времени
    bool matchesTime = false;
    if (restoran.timeStart != null && restoran.timeEnd != null) {
      DateTime timeStartDT = restoran.timeStart!;
      DateTime timeEndDT = restoran.timeEnd!;

      TimeOfDay timeStart = TimeOfDay.fromDateTime(timeStartDT);
      TimeOfDay timeEnd = TimeOfDay.fromDateTime(timeEndDT);

      bool isOutsideWorkingHours = currentTime.hour < timeStart.hour ||
          (currentTime.hour == timeStart.hour &&
              currentTime.minute < timeStart.minute) ||
          currentTime.hour > timeEnd.hour ||
          (currentTime.hour == timeEnd.hour &&
              currentTime.minute > timeEnd.minute);

      matchesTime = isOutsideWorkingHours;
    }

    return matchesName &&
        matchesCategory &&
        matchesDeliveryOptions &&
        matchesTime;
  }).toList();

  if (sortByMinOrderAmount) {
    filteredRestaurants
        .sort((a, b) => a.minSumDelivery.compareTo(b.minSumDelivery));
  } else if (sortByRating) {
    filteredRestaurants.sort((a, b) => b.rating.compareTo(a.rating));
  } else if (sortByName) {
    filteredRestaurants.sort((a, b) {
      if (a.name == null) return 1;
      if (b.name == null) return -1;
      return a.name!.compareTo(b.name!);
    });
  }

  return filteredRestaurants;
}

List<dynamic> groupDataByRestaurants(List<dynamic> cartItems) {
  Set<String> restaurantNames = {};
  List<Map<String, dynamic>> uniqueRestaurants = [];

  for (var item in cartItems) {
    if (!restaurantNames.contains(item['restoranname'])) {
      restaurantNames.add(item['restoranname']);
      uniqueRestaurants.add({
        'restaurant_name': item['restoranname'],
        'items': cartItems
            .where(
                (cartItem) => cartItem['restoranname'] == item['restoranname'])
            .toList(),
      });
    }
  }

  return uniqueRestaurants;
}

String? transferAndDeleteItemFirebase(CartItemsRecord? currentCartItem) {
  if (currentCartItem == null) {
    return 'Cart item is null';
  }

  final firestore = FirebaseFirestore.instance;

  try {
    // Создание нового документа в order_item
    final newOrderItem = {
      'name': currentCartItem.name,
      'quantity': currentCartItem.quantity,
      // добавьте другие поля, которые нужны
    };
    firestore.collection('order_item').add(newOrderItem);

    // Удаление документа из cart_item
    firestore
        .collection('cart_item')
        .doc(currentCartItem.reference.id)
        .delete();

    return 'Success';
  } catch (e) {
    return 'Error: $e';
  }
}

List<String>? newCustomFunction(List<MenuRecord>? menu) {
  // Проверка на null
  if (menu == null) {
    return null;
  }

  // Создаем множество для хранения уникальных значений CategoryBluda
  Set<String> uniqueCategories = {};

  // Проходим по каждому элементу списка меню и добавляем категории в множество
  for (var menuItem in menu) {
    if (menuItem.categoryBluda != null) {
      for (var category in menuItem.categoryBluda!) {
        uniqueCategories.add(category);
      }
    }
  }

  // Преобразуем множество в список и возвращаем его
  List<String> filteredCategories = uniqueCategories.toList();

  return filteredCategories;
}

List<MenuRecord>? filtrMenu(
  String? name,
  List<MenuRecord>? allmenu,
) {
// Если name пусто или null, возвращаем весь список
  if (name == null || name.isEmpty) {
    return allmenu;
  }

  // Фильтрация по названию
  return allmenu?.where((menu) {
    return menu.name != null &&
        menu.name!.toLowerCase().contains(name.toLowerCase());
  }).toList();
}

bool? isRestaurantOutsideWorkingHours(RestoranRecord restoran) {
  DateTime now = DateTime.now();
  TimeOfDay currentTime = TimeOfDay(hour: now.hour, minute: now.minute);

  // Если ресторан работает круглосуточно, возвращаем false
  if (restoran.aroundTheClock == true) {
    return false;
  }

  // Если у ресторана указано время работы, проверяем его
  if (restoran.timeStart != null && restoran.timeEnd != null) {
    DateTime timeStartDT = restoran.timeStart!;
    DateTime timeEndDT = restoran.timeEnd!;

    TimeOfDay timeStart = TimeOfDay.fromDateTime(timeStartDT);
    TimeOfDay timeEnd = TimeOfDay.fromDateTime(timeEndDT);

    bool isOutsideWorkingHours = currentTime.hour < timeStart.hour ||
        (currentTime.hour == timeStart.hour &&
            currentTime.minute < timeStart.minute) ||
        currentTime.hour > timeEnd.hour ||
        (currentTime.hour == timeEnd.hour &&
            currentTime.minute > timeEnd.minute);

    return isOutsideWorkingHours;
  }

  // Если время работы не указано, возвращаем false
  return false;
}
