import 'package:flutter/material.dart';

class ProviderModel extends ChangeNotifier{

  Color color = Colors.amber;
  int value =0;


  List colorlistl = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.black,
  ];

 void changer(){
  if(value > colorlistl.length-1){
    value =0;
    color =colorlistl[value++];
  }else{
    color =colorlistl[value++];
  }
  notifyListeners();
 }

 

}

class ProviderModel2 extends ChangeNotifier{

  bool lighttheme =true;
  Color bg =Colors.white;

  void theme(){

 lighttheme ==true ? lighttheme=false :lighttheme=true;

  if(lighttheme ==false){
    bg =Colors.black;
  }
  else if (lighttheme==true){
    bg =Colors.white;
  }
  notifyListeners();
 }
}