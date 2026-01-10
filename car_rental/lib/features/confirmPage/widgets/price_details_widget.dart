import 'package:car_rental/core/constants/text_const.dart';
import 'package:car_rental/features/confirmPage/controller/booking_confirm_contoller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PriceDetailsSection extends StatelessWidget {
  const PriceDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CheckoutController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TextConst.bookingConfirm['head2']!,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(20),
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
          child: Column(
            children: [
              PriceRow(
                label: 'Daily Rate (\$${controller.car.pricePerDay.toStringAsFixed(0)} × ${controller.totalDays} Days)',
                value: '\$${controller.dailyRate.toStringAsFixed(2)}',
              ),
              const SizedBox(height: 16),
              PriceRow(
                label: 'Insurance Policy (Full)',
                value: '+\$${controller.insurancePrice.toStringAsFixed(2)}',
                color: const Color(0xFF4CAF50),
              ),
              const SizedBox(height: 16),
              PriceRow(
                label: 'Taxes & Fees',
                value: '+\$${controller.taxesAndFees.toStringAsFixed(2)}',
              ),
              const SizedBox(height: 20),
              const Divider(height: 1),
              const SizedBox(height: 20),
              PriceRow(
                label: 'Total Price',
                value: '\$${controller.totalPrice.toStringAsFixed(2)}',
                isTotal: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PriceRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;
  final Color? color;

  const PriceRow({
    super.key,
    required this.label,
    required this.value,
    this.isTotal = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.black : Colors.grey.shade700,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 22 : 15,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
            color: color ?? (isTotal ? Colors.black : Colors.grey.shade800),
          ),
        ),
      ],
    );
  }
}
