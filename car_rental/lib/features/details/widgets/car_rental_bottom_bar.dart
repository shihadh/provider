import 'package:car_rental/core/theme/color_const.dart';
import 'package:flutter/material.dart';

class CarRentalBottomBar extends StatelessWidget {
  final String pricePerDay;
  final VoidCallback onRentNowPressed;

  const CarRentalBottomBar({
    super.key,
    required this.pricePerDay,
    required this.onRentNowPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorConst.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "\$$pricePerDay",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "/Day",
                style: TextStyle(
                  fontSize: 18,
                  
                  color: ColorConst.grey),
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConst.secondaryBlack,
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 14,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: onRentNowPressed,
            child: const Text(
              "Rent Now",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
