import 'package:car_rental/core/constants/text_const.dart';
import 'package:car_rental/core/theme/color_const.dart';
import 'package:car_rental/features/bookingForm/controller/booking_controller.dart';
import 'package:car_rental/features/confirmPage/view/booking_confirm.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final BookingController controller;
  const BottomBar(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      decoration: BoxDecoration(
        color: ColorConst.white,
        boxShadow: [
          BoxShadow(
            color: ColorConst.primaryBlack.withOpacity(.08),
            blurRadius: 15,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TextConst.bookingForm['total']!,
                    style: TextStyle(
                      color: ColorConst.grey,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: '\$${controller.totalPrice.toStringAsFixed(0)}',
                        ),
                        TextSpan(
                          text: ' / ${controller.totalDays} days',
                          style: TextStyle(
                            fontSize: 14,
                            color: ColorConst.grey,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: controller.isFormValid 
                    ? Colors.black 
                    : Colors.grey.shade400,
                foregroundColor: ColorConst.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              onPressed: controller.isFormValid
                  ? () {
                      // Handle booking confirmation
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingConfirmPage(
                            car: controller.car,
                            startDate: controller.startDate!,
                            endDate: controller.endDate!,
                            pickupLocation: controller.pickupLocationController.text,
                          ),
                        ),
                      );
                    }
                  : null,
              child: Text(
                TextConst.bookingForm['btn']!,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
