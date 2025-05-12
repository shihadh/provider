import 'package:counter_thememode/model/provider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ProviderModel,ProviderModel2>(builder: (context, value,value2, child) => Scaffold(
      backgroundColor: value2.bg,
      appBar: AppBar(
        title: Text("counter"),
        actions: [
          IconButton(onPressed: value2.theme, icon: value2.lighttheme==true ? Icon(Icons.dark_mode) : Icon(Icons.light_mode))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              color: value.color,
            ),
            ElevatedButton(onPressed: value.changer, child: Text("change"))
          ],
        ),
      ),
    ),
    );
  }
}