import 'package:car_rental/core/theme/color_const.dart';
import 'package:flutter/material.dart';

class CarDetailAppBar  extends StatelessWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onSharePressed;

  const CarDetailAppBar ({
    super.key,
    required this.onBackPressed,
    required this.onSharePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      left: 16,
      right: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _iconButton(
            icon: Icons.arrow_back,
            onTap: onBackPressed,
          ),
          _iconButton(
            icon: Icons.share_outlined,
            onTap: onSharePressed,
          ),
        ],
      ),
    );
  }

  Widget _iconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: ColorConst.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          icon,
          size: 20,
          color: ColorConst.primaryBlack,
        ),
      ),
    );
  }
}
