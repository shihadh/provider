import 'package:car_rental/core/constants/image_const.dart';
import 'package:car_rental/core/constants/text_const.dart';
import 'package:car_rental/core/theme/color_const.dart';
import 'package:car_rental/features/details/view/car_detailes.dart';
import 'package:car_rental/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, value, child) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: value.cars.length,
          itemBuilder: (context, index) {
            final car = value.cars[index];

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: ColorConst.white,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    /// Car Image
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset(
                        car.image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            decoration: BoxDecoration(
                              color: ColorConst.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.directions_car,
                                color: ColorConst.grey,
                                size: 40,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(width: 12),

                    /// Car Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            car.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Row(
                            children: [
                              Text(
                                "\$${car.pricePerDay}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "/Day",
                                style: const TextStyle(
                                  color: ColorConst.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 6),

                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 16,
                                color: ColorConst.star,
                              ),
                              const SizedBox(width: 4),
                              Text(car.rating.toString()),
                            ],
                          ),

                          const SizedBox(height: 8),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(8),
                              ),
                              backgroundColor: ColorConst.secondaryBlack,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CarDetailes(car: car),));
                            },
                            child: Text(
                              TextConst.home['rent']!,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
