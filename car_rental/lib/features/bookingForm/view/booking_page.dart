import 'package:car_rental/core/constants/text_const.dart';
import 'package:car_rental/core/theme/color_const.dart';
import 'package:car_rental/features/bookingForm/widgets/bottombar_widget.dart';
import 'package:car_rental/features/bookingForm/widgets/car_card_widget.dart';
import 'package:car_rental/features/bookingForm/widgets/date_field_widget.dart';
import 'package:car_rental/features/bookingForm/widgets/location_field_widget.dart';
import 'package:car_rental/features/bookingForm/widgets/section_title_widget.dart';
import 'package:car_rental/features/shared/model/car_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/booking_controller.dart';

class BookingPage extends StatelessWidget {
  final CarModel car;
  const BookingPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BookingController(car),
      child: const _BookingView(),
    );
  }
}

class _BookingView extends StatelessWidget {
  const _BookingView();

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
            color: ColorConst.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const BackButton(color: ColorConst.primaryBlack),
        ),
        centerTitle: true,
        title: Text(
          TextConst.bookingForm['title']!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: ColorConst.primaryBlack,
            fontSize: 20,
          ),
        ),
      ),

      /// ---------------- BOTTOM BAR ----------------
      bottomNavigationBar: Consumer<BookingController>(
        builder: (context, controller, _) {
          return BottomBar(controller);
        },
      ),

      /// ---------------- BODY ----------------
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// -------- CAR CARD --------
            Consumer<BookingController>(
              builder: (context, controller, _) {
                return CarCard(controller.car);
              },
            ),

            const SizedBox(height: 32),

            /// -------- USER NAME --------
            SectionTitle(TextConst.bookingForm['name']!),
            const SizedBox(height: 12),
            const InfoField(
              icon: Icons.person_outline,
              value: 'Jason Smith',
              iconColor: ColorConst.grey,
            ),

            const SizedBox(height: 28),

            /// -------- DATE SECTION --------
            SectionTitle(TextConst.bookingForm['head1']!),
            const SizedBox(height: 12),
            Consumer<BookingController>(
              builder: (context, controller, _) {
                return DateField(controller);
              },
            ),

            const SizedBox(height: 28),

            /// -------- LOCATION SECTION --------
            SectionTitle(TextConst.bookingForm['head2']!),
            const SizedBox(height: 12),
            Consumer<BookingController>(
              builder: (context, controller, _) {
                return LocationFieldWidget(controller: controller);
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
