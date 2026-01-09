import 'package:car_rental/core/constants/image_const.dart';
import 'package:car_rental/core/constants/text_const.dart';
import 'package:car_rental/core/theme/color_const.dart';
import 'package:car_rental/features/home/widgets/home_brand_row_widget.dart';
import 'package:car_rental/features/home/widgets/home_card_widget.dart';
import 'package:car_rental/features/home/widgets/home_header_widget.dart';
import 'package:car_rental/features/home/widgets/home_heading_row_widget.dart';
import 'package:car_rental/features/home/widgets/home_search_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 15,

              children: [
                const HomeHeaderWidget(),
                const HomeSearchWidget(),
                HomeHeadingRowWidget(title: TextConst.home['head1']!, onTap: (){}),
                const HomeBrandRowWidget(),
                HomeHeadingRowWidget(title: TextConst.home['head2']!, onTap: (){}),
                const HomeCardWidget()

              ],
            ),
          ),
        ),
      ),
    );
  }
}
