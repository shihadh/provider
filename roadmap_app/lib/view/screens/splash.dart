import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadmap_app/utis/const.dart';
import 'package:roadmap_app/viewmodels/week_provider.dart';

class SplashSccreen extends StatefulWidget {
  const SplashSccreen({super.key});

  @override
  State<SplashSccreen> createState() => _SplashSccreenState();
}

class _SplashSccreenState extends State<SplashSccreen> {
  @override
  void initState() {
    Provider.of<WeekProvider>(context,listen: false).splash(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBox.secondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/icon.png")
          ],
        ),
      ),
    );
  }
}