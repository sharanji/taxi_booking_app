import 'package:flutter/material.dart';

class BookingDetails {
  bool rideNow;
  DateTime rideDate;
  TimeOfDay rideTime;
  BookingDetails({
    this.rideNow = true,
    required this.rideDate,
    required this.rideTime,
  });
}
