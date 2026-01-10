import 'package:car_rental/core/theme/color_const.dart';
import 'package:car_rental/features/bookingForm/view/booking_page.dart';
import 'package:car_rental/features/details/controller/car_detailes_controller.dart';
import 'package:car_rental/features/shared/model/car_model.dart';
import 'package:car_rental/features/details/widgets/car_detail_app_bar.dart';
import 'package:car_rental/features/details/widgets/car_header_section.dart';
import 'package:car_rental/features/details/widgets/car_image_carousel.dart';
import 'package:car_rental/features/details/widgets/car_overview_section.dart';
import 'package:car_rental/features/details/widgets/car_specs_section.dart';
import 'package:car_rental/features/details/widgets/car_renter_section.dart';
import 'package:car_rental/features/details/widgets/car_rental_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarDetailes extends StatelessWidget {
  final CarModel car;
  const CarDetailes({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: ColorConst.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                        const SizedBox(height: 35,),

                          CarDetailAppBar(
                            onBackPressed: (){
                              Navigator.pop(context);
                              context.read<CarDetailesController>().currentPage = 0;
                              } ,
                            onSharePressed: () {},
                          ),
                        const SizedBox(height: 16,),
                          CarHeaderSection(
                            carName: car.name,
                            rating: car.rating,
                            ratingCount: car.ratingCount,
                          ),
                          const SizedBox(height: 16),
                          CarImageCarousel(
                            mainImage: car.image,
                            additionalImages: car.additionalImages,
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),

                  /// 🔹 CONTENT SECTION (WITH PADDING)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarOverviewSection(overview: car.overview),
                        const SizedBox(height: 20),

                        CarSpecsSection(
                          seats: car.seats,
                          horsePower: car.horsePower,
                          topSpeed: car.topSpeed.toString(),
                          isAutomatic: car.isAutomatic,
                          bags: car.bags,
                        ),
                        const SizedBox(height: 28),

                        CarRenterSection(
                          owner: car.owner,
                          onMessagePressed: () {},
                          onCallPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// 🔹 BOTTOM BAR
          CarRentalBottomBar(
            pricePerDay: car.pricePerDay.toString(),
            onRentNowPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BookingPage(car: car),));
            },
          ),
        ],
      ),
    );
  }
}
