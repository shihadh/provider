import 'package:flutter/material.dart';
import 'package:roadmap_app/view/screens/mobile/mob_home.dart';
import 'package:roadmap_app/view/screens/tabelet/tab_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if(constraints.maxWidth >600){
          return TabHome();
        }else{
          return MobHome();
        }
      },),
    );
  }
}