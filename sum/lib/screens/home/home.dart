import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sum/screens/home/circle_widget.dart';
import 'package:sum/screens/home/text_widget.dart';
import 'package:sum/view_model/provider_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "number 1",
                border: OutlineInputBorder()),
              controller: context.read<ProviderModel>().number1,
            ),
            SizedBox(height: 12,),
            TextField(
              decoration: InputDecoration(
                hintText: "number 2",
                border: OutlineInputBorder()),
              controller: context.read<ProviderModel>().number2,keyboardType: TextInputType.number,
            ),
            SizedBox(height: 12,),
            ElevatedButton(onPressed: (){
              Provider.of<ProviderModel>(context,listen: false).add(context,true);},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purpleAccent),
              child:context.watch<ProviderModel>().status ==false ?TextWidget() :CircleWidget(),
              )
          ],
        ),
      ),
    );
  }
}