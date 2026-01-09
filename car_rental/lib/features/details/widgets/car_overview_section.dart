import 'package:car_rental/core/theme/color_const.dart';
import 'package:flutter/material.dart';

class CarOverviewSection extends StatelessWidget {
  final String overview;

  const CarOverviewSection({
    super.key,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Overview",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          overview,
          style: const TextStyle(
            color: ColorConst.grey,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
