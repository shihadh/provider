import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:roadmap_app/model/topic_model.dart';
import 'package:roadmap_app/model/week_model.dart';
import 'package:roadmap_app/utis/default_data.dart';

class WeekProvider extends ChangeNotifier{
  List<WeekModel> weeks=[];

  Future<void>getweek()async{
    final db=await Hive.openBox<WeekModel>("weekbox");
    if(db.isEmpty){
      weeks.addAll(defaultData);
      for(var week in defaultData){
        db.add(week);
      }
    }else{
      weeks=db.values.toList();
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
    showDialog(context: context, builder:(context) => AlertDialog(
      title: Text("Add Topic"),
      actions: [
        Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: "Name",
               enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
               focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue))
              ),
            ),
            Gap(10),
             TextField(
              controller: description,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: "Description",
               enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
               focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue))
              ),
            ),
            Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: (){Navigator.pop(context);}, child:Text('Cancel',style: TextStyle(color: Colors.indigoAccent,fontWeight: FontWeight.bold))),
                Gap(10),
                ElevatedButton(
                  
                  onPressed: ()async{
                    if(name.text.trim().isNotEmpty || description.text.trim().isNotEmpty){
                      final topic = TopicModel(
                        tittle: name.text.trim(), description: description.text.trim(),isdone: false);
                         Provider.of<WeekProvider>(context,listen: false).addtopic(weekIndex, topic);
                          name.clear();
                          description.clear();
                          Navigator.pop(context);
                    }
                   
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                      backgroundColor:Colors.indigoAccent), 
                      child:Text('Add',style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                        ),
                        )
              ],
            )
          ],
        )
      ],
      
      ),);
  }

}