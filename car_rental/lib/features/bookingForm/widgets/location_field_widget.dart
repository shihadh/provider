import 'package:car_rental/features/bookingForm/controller/booking_controller.dart';
import 'package:flutter/material.dart';

class LocationFieldWidget extends StatelessWidget {
  final BookingController controller;
  
  const LocationFieldWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            color: Color(0xFF9E9E9E),
            size: 22,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: TextFormField(
              controller: controller.pickupLocationController,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter pickup location',
                hintStyle: TextStyle(
                  color: Color(0xFF9E9E9E),
                  fontWeight: FontWeight.normal,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
