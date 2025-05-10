import 'package:flutter/material.dart';

class ProviderModel extends ChangeNotifier{

  int counter=0;
  
  void incrrement(){
    counter++;
    notifyListeners();
  }
}