import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 10,width: 10,child: CircularProgressIndicator());
  }
}