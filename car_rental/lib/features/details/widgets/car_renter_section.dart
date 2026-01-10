import 'package:car_rental/core/theme/color_const.dart';
import 'package:car_rental/features/shared/model/car_model.dart';
import 'package:flutter/material.dart';

class CarRenterSection extends StatelessWidget {
  final CarOwnerModel owner;
  final VoidCallback onMessagePressed;
  final VoidCallback onCallPressed;

  const CarRenterSection({
    super.key,
    required this.owner,
    required this.onMessagePressed,
    required this.onCallPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Renter",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                owner.image,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 48,
                  height: 48,
                  color: ColorConst.grey.withOpacity(0.2),
                  alignment: Alignment.center,
                  child: const Icon(Icons.person),
                ),
              ),
            ),

            const SizedBox(width: 12),
            Expanded(
              child: Text(
                owner.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorConst.grey.withValues(alpha: .2),
              ),
              child: IconButton(
                icon: const Icon(Icons.message_outlined),
                onPressed: onMessagePressed,
              ),
            ),
            const SizedBox(width: 12),

            Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorConst.grey.withValues(alpha: .2),
              ),
              child: IconButton(
                icon: const Icon(Icons.call_outlined),
                onPressed: onCallPressed,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
