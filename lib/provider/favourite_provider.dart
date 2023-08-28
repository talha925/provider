import 'package:flutter/material.dart';

class FavouriteIemProvider with ChangeNotifier {
  final List<int> _selectedItems = [];

  List<int> get selectedItems => _selectedItems;

  void addItems(int value) {
    _selectedItems.add(value);
    notifyListeners();
  }

  void removeItems(int value) {
    _selectedItems.remove(value);
    notifyListeners();
  }
}
