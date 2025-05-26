import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadmap_app/utis/const.dart';
import 'package:roadmap_app/view/screens/mobile/mob_topics.dart';
import 'package:roadmap_app/view/widgets/widgets.dart';
import 'package:roadmap_app/viewmodels/week_provider.dart';

class MobHome extends StatefulWidget {
  final bool isTablet;
  const MobHome({super.key,this.isTablet=false});

  @override
  State<MobHome> createState() => _MobHomeState();
}

class _MobHomeState extends State<MobHome> {
  
  TextEditingController name=TextEditingController();
  @override
  void initState() {
    Provider.of<WeekProvider>(context, listen: false).getweek();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<WeekProvider>(
      builder:
          (context, value, child) => Scaffold(
            extendBodyBehindAppBar: false,
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                      children: [
                        Expanded(
                          child: FloatingActionButton.extended( 
                            backgroundColor: ColorBox.secondary,
                            onPressed: () {weekAlert(context,name);},
                            label: textbold(title: Texts.weekButton,color: ColorBox.primary),
                            
                          ),
                        ),
                      ],
                    ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorBox.secondary,
            appBar: AppBar(
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              backgroundColor: ColorBox.secondary,title: textbold(title: Texts.title1,color: ColorBox.normal)),
            body: Container(
              color: ColorBox.secondary,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
                    child: Card(
                      elevation: 2,
                      color: ColorBox.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          ...List.generate(
                            value.weeks.length,
                            (index) => Column(
                              children: [
                                ListTile(
                                  onTap:
                                      () {
                                        value.selectweek(value.weeks[index], index);
                                         if(!widget.isTablet){
                                          Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => MobTopicsScreen(
                                                week: value.weeks[index],
                                                weekIndex: index,
                                              ),
                                        ),
                                      );
                                         }
                                      },
                                  title: textbold(
                                    title: value.weeks[index].name ?? "no name",
                                    color: ColorBox.normal
                                  ),
                                  leading: Checkbox(
                                    activeColor: ColorBox.primary,
                                    value: value.topicDone(index),
                                    onChanged:
                                        (newvalue) => value.allTopicDone(
                                          index,
                                          newvalue!,
                                        ),
                                  ),
                                  trailing: IconButton(onPressed: (){value.conform1(context,index);}, icon: Icon(Icons.delete_outline_rounded)),
                                ),
                                if (index != value.weeks.length - 1) Divider(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
    );
  }


}
