import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:roadmap_app/model/topic_model.dart';
import 'package:roadmap_app/model/week_model.dart';
import 'package:roadmap_app/utis/default_data.dart';
import 'package:roadmap_app/view/screens/home.dart';
import 'package:roadmap_app/view/widgets/widgets.dart';

class WeekProvider extends ChangeNotifier{
  List<WeekModel> weeks=[];
  WeekModel? seletedweek;
  int? seletedIndex;

  void selectweek(WeekModel week, int index){
    seletedweek=week;
    seletedIndex=index;
    notifyListeners();

  }

  Future<void> splash(BuildContext context)async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
  }

  Future<void>getweek()async{
    final db=await Hive.openBox<WeekModel>("weekbox");
    if(db.isEmpty){
      weeks.addAll(defaultData);
      for(var week in defaultData){
        db.add(week);
      }
      notifyListeners();
    }else{
      weeks=db.values.toList();
    }
    notifyListeners();
    
  }

  Future<void>addweek(WeekModel weekvalues)async{
    final db =await Hive.openBox<WeekModel>("weekbox");
    db.add(weekvalues);
    weeks =db.values.toList();
    notifyListeners();
  }

  Future<void>deleteweek(int index)async{
    final db=await Hive.openBox<WeekModel>("weekbox");
    db.deleteAt(index);
    weeks =db.values.toList();
    notifyListeners();
  }

  Future<void>addtopic(int weekintex, TopicModel topicvalues )async{
    final db=await Hive.openBox<WeekModel>("weekbox");
    WeekModel week = db.getAt(weekintex)!;
    week.topics?.add(topicvalues);
    db.putAt(weekintex,week);
    weeks[weekintex]=week;
    notifyListeners();
  }

  Future<void>deletetopic(int weekindex, int topicindex)async{
    final db=await Hive.openBox<WeekModel>("weekbox");
    WeekModel week = db.getAt(weekindex)!;
    week.topics?.removeAt(topicindex);
    db.putAt(weekindex,week);
    weeks[weekindex]=week;
    notifyListeners();
  }

Future<void> toggleDone(int weekIndex, int topicIndex, bool? isDone) async {
  final db = await Hive.openBox<WeekModel>("weekbox");
  WeekModel week = db.getAt(weekIndex)!;

  final updatedTopics = week.topics?.map((topic) {

    int index = week.topics!.indexOf(topic);
    return TopicModel(
      tittle: topic.tittle,
      description: topic.description,
      isdone: index == topicIndex ? isDone ?? false : topic.isdone,
    );
  }).toList();

  week.topics = updatedTopics;
  await db.putAt(weekIndex, week);
  weeks[weekIndex] = week;
  notifyListeners();
}


  Future<void>updatetopic(
    int weekindex,int topicindex, String tittle,String descripton
  )async{
    final db=await Hive.openBox<WeekModel>("weekbox");
    WeekModel week =db.getAt(weekindex)!;
    TopicModel topic=week.topics![topicindex];
    topic.tittle =tittle;
    topic.description =descripton;
    db.putAt(weekindex,week);
    weeks[weekindex]=week;
    notifyListeners();
  }

  Future<void>allTopicDone(int weekindex, bool isDone)async{
    final db =await Hive.openBox<WeekModel>("weekbox");
    WeekModel week = db.getAt(weekindex)!;
    for(var topic in week.topics ?? []){
      topic.isdone =isDone;
    }
    db.putAt(weekindex, week);
    weeks[weekindex] =week;
    notifyListeners();
  }

  bool topicDone(int weekIndex){
    final topics =weeks[weekIndex].topics ?? [];
    if(topics.isEmpty) return false;
    return topics.every((topic)=>topic.isdone == true);
  }

void alert(BuildContext context, TextEditingController name, TextEditingController description,int weekIndex){
    showDialog(context: context, builder:(context) => alretbox(name, description, context, weekIndex),);
    
  }
  void updateAlert(BuildContext context, TextEditingController name, TextEditingController description,int weekIndex, int topicIndex,List<WeekModel> weeks){
    showDialog(context: context, builder: (context) => updateBox(name, description, context, weekIndex, topicIndex, weeks),);
  }

  void conform1(BuildContext context, int index){
    showDialog(
      context: context,
      builder: (context) {
          return conformAlert(context, index,providerFuntion: (){Provider.of<WeekProvider>(context,listen: false).deleteweek(index);});
        }
      );
  }
  void conform2(BuildContext context, int index, int weekIndex){
    showDialog(
      context: context,
      builder: (context) {
          return conformAlert(context, index,providerFuntion:(){Provider.of<WeekProvider>(context,listen: false).deletetopic(weekIndex,index);});
        }
      );
  }


}