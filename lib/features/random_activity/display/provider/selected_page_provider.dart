import 'package:flutter/material.dart';

class SelectedPageProvider extends ChangeNotifier {
  SelectedPageProvider({
    this.selectedPage = 0
  });
  int selectedPage;

  void changePage(int newValue) {
    selectedPage = newValue;
    notifyListeners();
  }
}