// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class ProductProviders with ChangeNotifier {
  List<String> selectedColors = [];

  addColors(String color) {
    selectedColors.add(color);
    print(selectedColors.length.toString());
    notifyListeners();
  }

  removeColor(String color) {
    selectedColors.remove(color);
    print(selectedColors.length.toString());
    notifyListeners();
  }
}
