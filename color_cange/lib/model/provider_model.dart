import 'package:flutter/material.dart';

class Providermodel extends ChangeNotifier{
  int count=0;
  Color color =Colors.amber;
  List colorslist =[
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.black,
    Colors.blue,
  ]; 
  void changer(){
    if(count>colorslist.length-1){
      count=0;
    }
    color=colorslist[count++];
  notifyListeners();
  }
}