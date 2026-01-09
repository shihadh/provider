import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(


      ),
    );
  }
}

Future<void> splash()async{
  await Future.delayed(Duration(seconds: 1,));
}