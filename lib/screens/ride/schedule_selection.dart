import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:taxi_app/fitness_app_theme.dart';
import 'package:taxi_app/main.dart';
import 'package:taxi_app/providers/bookingdetails.dart';
import 'package:taxi_app/theme.dart';

class ScheduleButton extends StatefulWidget {
  const ScheduleButton({Key? key}) : super(key: key);

  @override
  State<ScheduleButton> createState() => _ScheduleButtonState();
}

class _ScheduleButtonState extends State<ScheduleButton> {
  String timeFormater = DateFormat.jm().format(DateTime.now());
  String dateformatter = DateFormat.yMMMMd('en_US').format(
    DateTime.now(),
  ); // 28/03/2020
  var timeOfDay = TimeOfDay.now();
  String userNotes = '';

  @override
  Widget build(BuildContext context) {
    var bookingProvider = Provider.of<BookingDetailsProvider>(context);
    bool isNow = bookingProvider.bookingDetails.rideNow;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Schedule Time ',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    bookingProvider.setridenowTrue();
                    bookingProvider.bookingDetails.rideDate = DateTime.now();
                    bookingProvider.bookingDetails.rideTime = TimeOfDay.now();
                  });
                },
                child: Container(
                  height: kToolbarHeight - 15,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration: isNow
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              colors: [
                                FitnessAppTheme.nearlyDarkBlue,
                                HexColor("#6F56E8")
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                        )
                      : BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.25),
                        ),
                  child: Center(
                    child: Text(
                      'Now',
                      style: TextStyle(
                        color: isNow ? Colors.white : kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  var nowDate = DateTime.now();
                  DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    minTime: DateTime(DateTime.now().year, DateTime.now().month,
                        DateTime.now().day),
                    maxTime: DateTime(
                      nowDate.year,
                      nowDate.month,
                      nowDate.day + 2,
                    ),
                    // onChanged: (date) {
                    //   print('change $date');
                    // },
                    onConfirm: (date) async {
                      final TimeOfDay? selectedTime = await showTimePicker(
                        context: context,
                        initialTime: timeOfDay,
                        initialEntryMode: TimePickerEntryMode.dial,
                        confirmText: "CONFIRM",
                        cancelText: "NOT NOW",
                        helpText: "BOOKING TIME",
                      );
                      if (selectedTime != null) {
                        timeOfDay = selectedTime;
                        if (date.day == DateTime.now().day &&
                            date.month == DateTime.now().month &&
                            date.year == DateTime.now().year) {
                          if (selectedTime.hour < TimeOfDay.now().hour) {
                            timeOfDay = TimeOfDay.now();
                            setState(() {
                              dateformatter =
                                  DateFormat.yMMMMd('en_US').format(date);
                              bookingProvider.setridenowTrue();
                              bookingProvider.bookingDetails.rideDate = date;
                              bookingProvider.bookingDetails.rideTime =
                                  timeOfDay;
                            });
                            return;
                          } else if (selectedTime.hour ==
                                  TimeOfDay.now().hour &&
                              timeOfDay.minute < TimeOfDay.now().minute) {
                            timeOfDay = TimeOfDay.now();
                            setState(() {
                              dateformatter =
                                  DateFormat.yMMMMd('en_US').format(date);
                              bookingProvider.setridenowTrue();
                              bookingProvider.bookingDetails.rideDate = date;
                              bookingProvider.bookingDetails.rideTime =
                                  timeOfDay;
                            });
                            return;
                          }
                        }
                        setState(() {
                          dateformatter =
                              DateFormat.yMMMMd('en_US').format(date);
                          bookingProvider.setridenowFalse();
                          bookingProvider.bookingDetails.rideDate = date;
                          bookingProvider.bookingDetails.rideTime = timeOfDay;
                        });
                      }
                    },
                    currentTime: DateTime.now(),
                    locale: LocaleType.en,
                  );
                },
                child: Container(
                  height: kToolbarHeight - 15,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration: !isNow
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              colors: [
                                FitnessAppTheme.nearlyDarkBlue,
                                HexColor("#6F56E8")
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                        )
                      : BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.25),
                        ),
                  child: Center(
                    child: Icon(
                      Icons.timer,
                      color: !isNow ? Colors.white : kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
