import 'package:car_rental/core/theme/color_const.dart';
import 'package:car_rental/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeBrandRowWidget extends StatelessWidget {
  const HomeBrandRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // important: bounds the ListView
      child: Consumer<HomeController>(
        builder: (context, controller, child) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.brand.length,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemBuilder: (context, index) {
              final brand = controller.brand[index];

              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Brand Logo
                    Container(
                      width: 60,
                      height: 60,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: ColorConst.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Image.asset(
                        brand.image ?? '',
                        fit: BoxFit.contain,
                      ),
                    ),

                    const SizedBox(height: 6),

                    /// Brand Name
                    Text(
                      brand.name ?? '',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
