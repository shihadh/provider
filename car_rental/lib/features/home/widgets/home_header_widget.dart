import 'package:car_rental/core/constants/image_const.dart';
import 'package:car_rental/core/constants/text_const.dart';
import 'package:car_rental/core/theme/color_const.dart';
import 'package:flutter/material.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Profile Image
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.network(
            ImageConst.profile,
            width: 43,
            height: 43,
            fit: BoxFit.cover,
          ),
        ),

        /// Location
        Row(
          children: [
            const Icon(Icons.location_on_rounded),
            const SizedBox(width: 2),
            Text(TextConst.home['place']!,style: TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(width: 2),
            Icon(Icons.keyboard_arrow_down_rounded, color: ColorConst.grey,),
          ],
        ),

        /// Notification
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: ColorConst.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.notifications,
            color: ColorConst.primaryBlack,
          ),
        ),
      ],
    );
  }
}