import 'package:car_rental/core/theme/color_const.dart';
import 'package:flutter/material.dart';

class CarHeaderSection extends StatelessWidget {
  final String carName;
  final double rating;
  final int ratingCount;

  const CarHeaderSection({
    super.key,
    required this.carName,
    required this.rating,
    required this.ratingCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          carName,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            const Icon(Icons.star, size: 16, color: ColorConst.star),
            const SizedBox(width: 4),
            Text(
              rating.toString(),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 4),
            Text(
              "($ratingCount Reviews)",
              style: const TextStyle(color: ColorConst.grey),
            ),
          ],
        ),
      ],
    );
  }
}
