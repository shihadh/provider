import 'package:car_rental/features/shared/model/car_model.dart';
import 'package:flutter/material.dart';

class CheckoutController extends ChangeNotifier {
  CheckoutController({
    required this.car,
    required this.startDate,
    required this.endDate,
    required this.pickupLocation,
  });

  final CarModel car;
  final DateTime startDate;
  final DateTime endDate;
  final String pickupLocation;

  TimeOfDay pickupTime = const TimeOfDay(hour: 10, minute: 0);
  TimeOfDay returnTime = const TimeOfDay(hour: 18, minute: 0);
  
  final TextEditingController returnLocationController = TextEditingController();

  int get totalDays {
    return endDate.difference(startDate).inDays + 1;
  }

  double get dailyRate => car.pricePerDay * totalDays;
  double get insurancePrice => 25.0;
  double get taxesAndFees => 15.0;
  double get totalPrice => dailyRate + insurancePrice + taxesAndFees;

  String get displayReturnLocation {
    return returnLocationController.text.trim().isEmpty 
        ? pickupLocation 
        : returnLocationController.text.trim();
  }

  Future<void> selectPickupTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: pickupTime,
    );
    if (picked != null && picked != pickupTime) {
      pickupTime = picked;
      notifyListeners();
    }
  }

  Future<void> selectReturnTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: returnTime,
    );
    if (picked != null && picked != returnTime) {
      returnTime = picked;
      notifyListeners();
    }
  }

  void confirmBooking() {
    // Handle booking confirmation logic here
    debugPrint('Booking Confirmed!');
    debugPrint('Pickup: $pickupLocation at ${pickupTime.format}');
    debugPrint('Return: $displayReturnLocation at ${returnTime.format}');
    debugPrint('Total: \$$totalPrice');
  }

  @override
  void dispose() {
    returnLocationController.dispose();
    super.dispose();
  }
}
