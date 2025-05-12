import 'package:counter_thememode/model/provider_model.dart';
import 'package:counter_thememode/view/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ProviderModel(),),
    ChangeNotifierProvider(create: (context) => ProviderModel2(),)
  ] ,child: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}