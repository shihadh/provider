import 'package:car_rental/features/shared/model/car_model.dart';
import 'package:flutter/material.dart';

class BookingController extends ChangeNotifier {
  BookingController(this.car) {
    // Add listener to text controller
    pickupLocationController.addListener(_onLocationChanged);
  }

  final CarModel car;

  DateTime? startDate;
  DateTime? endDate;

  bool childSeat = false;
  bool fullInsurance = true;

  final TextEditingController pickupLocationController = TextEditingController();

  // Listener to notify when location text changes
  void _onLocationChanged() {
    notifyListeners();
  }

  int get totalDays {
    if (startDate == null || endDate == null) return 0;
    return endDate!.difference(startDate!).inDays + 1;
  }

  double get totalPrice {
    if (totalDays == 0) return 0;
    return totalDays * car.pricePerDay;
  }

  // Getter to check if form is valid
  bool get isFormValid {
    return totalDays > 0 && pickupLocationController.text.trim().isNotEmpty;
  }

  Future<void> pickDateRange(BuildContext context) async {
    final now = DateTime.now();

    final result = await showDateRangePicker(
      context: context,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
    );

    if (result != null) {
      startDate = result.start;
      endDate = result.end;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    pickupLocationController.removeListener(_onLocationChanged);
    pickupLocationController.dispose();
    super.dispose();
  }
}
