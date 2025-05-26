import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:roadmap_app/model/topic_model.dart';
import 'package:roadmap_app/model/week_model.dart';
import 'package:roadmap_app/utis/const.dart';
import 'package:roadmap_app/viewmodels/week_provider.dart';


AlertDialog alretbox(TextEditingController name, TextEditingController description, BuildContext context, int weekIndex) {
  return AlertDialog(
    title: Text("Add Topic"),
    actions: [
      Column(
        children: [
          TextField(
            controller: name,
            decoration: InputDecoration(
              hintText: "Name",
             enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorBox.primary)),
             focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorBox.primary))
            ),
          ),
          Gap(10),
           TextField(
            controller: description,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: "Description",
             enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorBox.primary)),
             focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorBox.primary))
            ),
          ),
          Gap(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: (){Navigator.pop(context);}, child:textbold(title: Texts.alert1, color: ColorBox.primary)),
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
                    backgroundColor:ColorBox.primary), 
                    child:textbold(title: Texts.alert2,color: ColorBox.secondary),
                      )
            ],
          )
        ],
      )
    ],
    
    );
}

Text textbold({
  required String title,
  required Color color
}) {
  return Text(title,style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold),
                    );
}

  Text textN({
    required String title,
    required Color color 
  }) => Text(title,style: TextStyle(color: color),);


AlertDialog updateBox(TextEditingController name, TextEditingController description, BuildContext context, int weekIndex, int topicIndex,List<WeekModel>weeks) {
  final topic =weeks[weekIndex].topics![topicIndex];
  name.text = topic.tittle ?? '';
  description.text = topic.description ?? '';
  return AlertDialog(
    title: Text("Edit Topic"),
    actions: [
      Column(
        children: [
          TextField(
            controller: name,
            decoration: InputDecoration(
              hintText: "Name",
             enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorBox.primary)),
             focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorBox.primary))
            ),
          ),
          Gap(10),
           TextField(
            controller: description,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: "Description",
             enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorBox.primary)),
             focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorBox.primary))
            ),
          ),
          Gap(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: (){
                Navigator.pop(context);
                name.clear();
                description.clear();
                }, 
                child:textbold(title: Texts.alert1, color: ColorBox.primary)),
              Gap(10),
              ElevatedButton(
                
                onPressed: ()async{
                  if(name.text.trim().isNotEmpty || description.text.trim().isNotEmpty){
                       Provider.of<WeekProvider>(context,listen: false).updatetopic(weekIndex, topicIndex,name.text,description.text);
                        name.clear();
                        description.clear();
                        Navigator.pop(context);
                  }
                 
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                    backgroundColor:ColorBox.primary), 
                    child:textbold(title: Texts.modify2, color: ColorBox.secondary)
                      )
            ],
          )
        ],
      )
    ],
    
    );
}


  void weekAlert(BuildContext context,TextEditingController name){
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("Week"),
      actions: [
        Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorBox.primary)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorBox.primary)),
              hintText: "Name"
              ),
            ),
            Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: (){Navigator.pop(context);}, child: textbold(title: Texts.alert1, color: ColorBox.primary)),
                Gap(15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                    backgroundColor:ColorBox.primary), 
                  onPressed: (){
                    final week =WeekModel(name: name.text, topics: []);
                    if(name.text.isNotEmpty){
                      Provider.of<WeekProvider>(context,listen: false).addweek(week);
                      name.clear();
                      Navigator.pop(context);
                    }
                  }, child: textbold(title: Texts.alert2, color: ColorBox.secondary))
              ],
            )
          ],
        )
      ],
    ),);



  }

  AlertDialog conformAlert(BuildContext context, index,
  {
    required VoidCallback providerFuntion
  }) {
    return AlertDialog(
          title: textN(title: Texts.conform, color: ColorBox.normal),
          actions: [
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){Navigator.pop(context);}, child:textbold(title: Texts.alert1, color: ColorBox.primary)),
                  Gap(10),
                  ElevatedButton(
                    
                    onPressed: (){
                      providerFuntion();
                      Navigator.pop(context);
                     
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                        backgroundColor:ColorBox.danger), 
                        child:textbold(title: Texts.modify1,color: ColorBox.secondary),
                          )
                ],
              )
        ],);
  }