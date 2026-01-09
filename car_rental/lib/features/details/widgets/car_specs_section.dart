import 'package:car_rental/core/theme/color_const.dart';
import 'package:flutter/material.dart';

class CarSpecsSection extends StatelessWidget {
  final int seats;
  final int horsePower;
  final String topSpeed;
  final bool isAutomatic;
  final int bags;

  const CarSpecsSection({
    super.key,
    required this.seats,
    required this.horsePower,
    required this.topSpeed,
    required this.isAutomatic,
    required this.bags,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _SpecItem(icon: Icons.event_seat, value: "$seats Seats"),
        _SpecItem(icon: Icons.trending_up, value: "$horsePower Hp"),
        _SpecItem(icon: Icons.speed, value: "$topSpeed km/h"),
        _SpecItem(
          icon: Icons.sports_motorsports_outlined,
          value: isAutomatic ? "Auto" : "Manual",
        ),
        _SpecItem(icon: Icons.work_outline, value: "$bags Bags"),
      ],
    );
  }
}

class _SpecItem extends StatelessWidget {
  final IconData icon;
  final String value;

  const _SpecItem({
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ColorConst.grey.withValues(alpha: .2),
          ),
          child: Icon(icon, size: 22, color: ColorConst.primaryBlack)),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
