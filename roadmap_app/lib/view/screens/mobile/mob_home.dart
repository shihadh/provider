import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadmap_app/view/screens/mobile/mob_topics.dart';
import 'package:roadmap_app/view/widgets/widgets.dart';
import 'package:roadmap_app/viewmodels/week_provider.dart';

class MobHome extends StatefulWidget {
  const MobHome({super.key});

  @override
  State<MobHome> createState() => _MobHomeState();
}

class _MobHomeState extends State<MobHome> {
@override
  void initState() {
    Provider.of<WeekProvider>(context,listen: false).getweek();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeekProvider>(builder: (context, value, child) => Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(title1)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 2,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                ...List.generate(
                  value.weeks.length,
                  (index) => Column(
                    children: [
                      ListTile(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MobTopicsScreen(week: value.weeks[index], weekIndex: index,),)),
                      title: Text(value.weeks[index].name ?? "no name"),
                      trailing: Checkbox(value: value.topicDone(index), onChanged: (newvalue) => value.allTopicDone(index, newvalue!),),
                      ),
                      if (index != value.weeks.length -1) Divider(),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),);
  }
}
