import 'package:color_cange/model/provider_model.dart';
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
    return Consumer<Providermodel>(builder: (context, value, child) => Scaffold(
      appBar: AppBar(
        title: Text("change color"),
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
            ElevatedButton(onPressed: value.changer, child: Text("chager"))
          ],
        ),
      ),
    )
    );
  }
}