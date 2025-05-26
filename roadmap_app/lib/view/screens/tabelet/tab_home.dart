import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadmap_app/utis/const.dart';
import 'package:roadmap_app/view/screens/mobile/mob_home.dart';
import 'package:roadmap_app/view/screens/mobile/mob_topics.dart';
import 'package:roadmap_app/viewmodels/week_provider.dart';

class TabHome extends StatefulWidget {
  const TabHome({super.key});

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WeekProvider>(builder: (context, value, child) => Scaffold(
      body: Row(
        children: [
          Expanded(flex: 1 ,child: MobHome(isTablet: true,)),
          Container(color: ColorBox.secondary,child: VerticalDivider()),
          Expanded(flex: 1 ,child:value.seletedweek != null && value.seletedIndex != null
                ? MobTopicsScreen(
                    week: value.seletedweek!,
                    weekIndex: value.seletedIndex!,
                  )
                : Center(
                    child: Text(
                      "Select a week to view topics",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),),
        ],
      ),
    ),
    );
  }
}