import 'package:flutter/material.dart';

class Store with ChangeNotifier {
  bool _isSearching = false;
  bool anyNotification = true;
  String searchValue = "";

  get isSearching => _isSearching;

  onSerching(String value) {
    searchValue = value;
  }

  onSearchClicked() {
    _isSearching = true;
    notifyListeners();
  }

  onSearchClosed() {
    _isSearching = false;
    notifyListeners();
  }
}
