import 'package:flutter/material.dart';
import 'package:sum/screens/home/circle_widget.dart';
import 'package:sum/screens/home/sum.dart';
import 'package:sum/screens/home/text_widget.dart';

class ProviderModel extends ChangeNotifier{
  TextEditingController number1= TextEditingController();
  TextEditingController number2= TextEditingController();
  String sum1="";
  String sum2="";
  String result="";
  bool status = false;

  Future<void> add(context, stat)async{
    if(number1.text.isNotEmpty && number2.text.isNotEmpty){
      status=stat;
    notifyListeners();
    await Future.delayed(Duration(seconds: 3));
    status=false;
    sum1 = number1.text;
    sum2 =number2.text;
    int s1=int.parse(sum1);
    int s2=int.parse(sum2);
    result="Sum : ${s1+s2}";
    Navigator.push(context, MaterialPageRoute(builder: (context) => Sum(),));
    number1.clear();
    number2.clear();
    notifyListeners();
  }
  else{
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Add value")));
  }
  }
}