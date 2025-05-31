import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sum/screens/home/home.dart';
import 'package:sum/view_model/provider_model.dart';

void main(){
  runApp(MultiProvider(providers: [ChangeNotifierProvider(create: (context) => ProviderModel(),)],child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}