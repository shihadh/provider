import 'package:car_rental/core/constants/text_const.dart';
import 'package:car_rental/core/theme/color_const.dart';
import 'package:flutter/material.dart';

class HomeHeadingRowWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const HomeHeadingRowWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Title
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),

        /// View All
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(6),
          child: Row(
            children: [
              Text(
                TextConst.home['view']!,
                style: TextStyle(color: ColorConst.grey),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: ColorConst.grey
              ),
            ],
          ),
        ),
      ],
    );
  }
}
