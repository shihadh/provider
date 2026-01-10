import 'package:car_rental/features/bookingForm/controller/booking_controller.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateField extends StatelessWidget {
  final BookingController controller;
  const DateField(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    String displayText = 'Select dates';
    String subtitle = '';

    if (controller.totalDays > 0) {
      final dateFormat = DateFormat('MMM dd');
      displayText =
          '${dateFormat.format(controller.startDate!)} - ${dateFormat.format(controller.endDate!)}, ${controller.startDate!.year}';
      subtitle = '${controller.totalDays} DAYS TOTAL';
    }

    return InkWell(
      onTap: () => controller.pickDateRange(context),
      child: Container(
        padding: const EdgeInsets.all(18),
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
              Icons.calendar_today_outlined,
              color: Color(0xFF9E9E9E),
              size: 22,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    displayText,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  if (subtitle.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Text(
              'Change',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.blue.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
