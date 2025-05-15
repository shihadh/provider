import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:roadmap_app/model/topic_model.dart';
import 'package:roadmap_app/model/week_model.dart';
import 'package:roadmap_app/viewmodels/week_provider.dart';

class MobTopicsScreen extends StatefulWidget {
  final WeekModel week;
  final int weekIndex;
  const MobTopicsScreen({required this.week,super.key, required this.weekIndex});

  @override
  State<MobTopicsScreen> createState() => _MobTopicsScreenState();
}

class _MobTopicsScreenState extends State<MobTopicsScreen> {
  TextEditingController name =TextEditingController();
  TextEditingController description=TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    final weekprovider = Provider.of<WeekProvider>(context);
    final topics =weekprovider.weeks[widget.weekIndex].topics ?? [];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed:(){
           weekprovider.alert(context,name,description,widget.weekIndex);
           },
           backgroundColor: Colors.indigoAccent,
      child: Icon(Icons.add),),
      appBar: AppBar(
        title: Text(widget.week.name ?? ""),
      ),
      body: ListView.separated(
       itemCount: topics.length,
       separatorBuilder: (context, index) => Divider(),
       itemBuilder: (context, index) {
         final topic=topics[index];
         return Padding(
           padding: const EdgeInsets.all(16.0),
           child: Card(
            color: Colors.white,
            elevation: 2,
             child: Column(
               children: [
                 ListTile(
                    title: Text(topic.tittle ?? ""),
                    subtitle: Text(topic.description ?? ""),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(value: topic.isdone, onChanged: (value){
                          weekprovider.toggleDone(widget.weekIndex, index, value);
                        },
                    activeColor: Colors.blue,
                    ),
                      ],
                    ),
                 ),
                 Divider(),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      child: TextButton(onPressed: (){weekprovider.deletetopic(widget.weekIndex,index);}, child: Text("Delete")),
                    ),
                    SizedBox(height: 55 ,child: VerticalDivider()),
                    SizedBox(
                      child: TextButton(onPressed: (){}, child: Text("Update")),
                    )
                  ],
                 )
               ],
             ),
           ),
         );
       },
      ),
    );
  }
}