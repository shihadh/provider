import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:roadmap_app/model/topic_model.dart';
import 'package:roadmap_app/model/week_model.dart';
import 'package:roadmap_app/utis/default_data.dart';

class WeekProvider extends ChangeNotifier{
  List<WeekModel> weeks=[];

  Future<void>getweek()async{
    final db=await Hive.openBox<WeekModel>("weekbox");
    if(db.isEmpty){
      weeks.addAll(defaultData);
    }
    notifyListeners();
    
  }

  Future<void>addweek(WeekModel weekvalues)async{
    final db =await Hive.openBox<WeekModel>("weekbox");
    db.add(weekvalues);
    notifyListeners();
  }

  Future<void>deleteweek(int index)async{
    final db=await Hive.openBox<WeekModel>("weekbox");
    db.deleteAt(index);
    notifyListeners();
  }

  Future<void>addtopic(int weekintex, TopicModel topicvalues )async{
    final db=await Hive.openBox<WeekModel>("weekbox");
    WeekModel week = db.getAt(weekintex)!;
    week.topics?.add(topicvalues);
    notifyListeners();----------------

    
  }



}