import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadmap_app/model/week_model.dart';
import 'package:roadmap_app/utis/const.dart';
import 'package:roadmap_app/view/widgets/widgets.dart';
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
      backgroundColor: ColorBox.secondary,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed:(){
           weekprovider.alert(context,name,description,widget.weekIndex);
           },
           backgroundColor: ColorBox.primary,
      child: Icon(Icons.add,color: ColorBox.secondary,),),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: ColorBox.secondary,
        title: textbold(title:  widget.week.name ?? "",color: ColorBox.normal),
      ),
      body: ListView.separated(
       itemCount: topics.length,
       separatorBuilder: (context, index) => Divider(),
       itemBuilder: (context, index) {
         final topic=topics[index];
         return Padding(
           padding: const EdgeInsets.all(16.0),
           child: Card(
            color: ColorBox.secondary,
            elevation: 2,
             child: Column(
               children: [
                 ListTile(
                    title: textbold(title: topic.tittle ?? "",color: ColorBox.normal),
                    subtitle: Text(topic.description ?? ""),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(value: topic.isdone, onChanged: (value){
                          weekprovider.toggleDone(widget.weekIndex, index, value);
                        },
                    activeColor: ColorBox.primary,
                    ),
                      ],
                    ),
                 ),
                 Divider(),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      child: TextButton(onPressed: (){weekprovider.conform2(context, index, widget.weekIndex);}, child: textbold(title: Texts.modify1, color: ColorBox.primary)),
                    ),
                    SizedBox(height: 55 ,child: VerticalDivider()),
                    SizedBox(
                      child: TextButton(onPressed: (){weekprovider.updateAlert(context,name,description,widget.weekIndex,index,weekprovider.weeks);}, child: textbold(title: Texts.modify2, color: ColorBox.primary)),
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