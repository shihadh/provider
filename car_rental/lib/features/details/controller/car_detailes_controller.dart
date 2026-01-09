import 'package:flutter/material.dart';

class CarDetailesController extends ChangeNotifier {
  int currentPage = 0;



  void onPageChanged(int index) {
    currentPage = index;
    notifyListeners();
  }
}
