import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/models/bookingdetails.dart';

class BookingDetailsProvider with ChangeNotifier {
  BookingDetails bookingDetails = BookingDetails(
    rideDate: DateTime.now(),
    rideTime: TimeOfDay.now(),
  );
  void setridenowTrue() {
    bookingDetails.rideNow = true;
    notifyListeners();
  }

  void setridenowFalse() {
    bookingDetails.rideNow = false;
    notifyListeners();
  }
}
