import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sum/view_model/provider_model.dart';

class Sum extends StatefulWidget {
  const Sum({super.key});

  @override
  State<Sum> createState() => _SumState();
}

class _SumState extends State<Sum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Result"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.watch<ProviderModel>().result)
          ],
        ),
      ),
    );
  }
}