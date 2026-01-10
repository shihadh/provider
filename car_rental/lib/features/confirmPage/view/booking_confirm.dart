import 'package:car_rental/core/constants/text_const.dart';
import 'package:car_rental/core/theme/color_const.dart';
import 'package:car_rental/features/confirmPage/controller/booking_confirm_contoller.dart';
import 'package:car_rental/features/confirmPage/widgets/bottom_bar_widget.dart';
import 'package:car_rental/features/confirmPage/widgets/car_card_widget.dart';
import 'package:car_rental/features/confirmPage/widgets/price_details_widget.dart';
import 'package:car_rental/features/confirmPage/widgets/rental_details_widget.dart';
import 'package:car_rental/features/shared/model/car_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingConfirmPage extends StatelessWidget {
  final CarModel car;
  final DateTime startDate;
  final DateTime endDate;
  final String pickupLocation;

  const BookingConfirmPage({
    super.key,
    required this.car,
    required this.startDate,
    required this.endDate,
    required this.pickupLocation,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CheckoutController(
        car: car,
        startDate: startDate,
        endDate: endDate,
        pickupLocation: pickupLocation,
      ),
      child: const _BookingConfirmView(),
    );
  }
}

class _BookingConfirmView extends StatelessWidget {
  const _BookingConfirmView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.primaryColor,

      /// ---------------- APP BAR ----------------
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConst.primaryColor,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const BackButton(color: Colors.black),
        ),
        centerTitle: true,
        title: Text(
          TextConst.bookingConfirm['title']!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),

      /// ---------------- BOTTOM BAR ----------------
      bottomNavigationBar: const CheckoutBottomBar(),

      /// ---------------- BODY ----------------
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Car depends on controller.car
            Consumer<CheckoutController>(
              builder: (_, controller, __) {
                return CheckoutCarCard(car: controller.car);
              },
            ),

            const SizedBox(height: 28),

            /// Rental details depend on dates & location
            const RentalDetailsSection(),

            const SizedBox(height: 28),

            /// Price depends on duration & pricePerDay
            const PriceDetailsSection(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
