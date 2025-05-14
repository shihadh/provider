import 'package:flutter/material.dart';
import 'package:roadmap_app/view/widgets/widgets.dart';

class MobHome extends StatefulWidget {
  const MobHome({super.key});

  @override
  State<MobHome> createState() => _MobHomeState();
}

class _MobHomeState extends State<MobHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(title1)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 2,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                ...List.generate(
                  5,
                  (index) => Column(
                    children: [
                      ListTile(title: Text(title1)),
                      if (index != 4) Divider(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
