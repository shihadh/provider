import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:roadmap_app/model/topic_model.dart';
import 'package:roadmap_app/model/week_model.dart';
import 'package:provider/provider.dart';
import 'package:roadmap_app/view/screens/splash.dart';
import 'package:roadmap_app/viewmodels/week_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WeekModelAdapter());
  Hive.registerAdapter(TopicModelAdapter());
  runApp(ChangeNotifierProvider(create: (context) => WeekProvider(),child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashSccreen(),
    );
  }
}