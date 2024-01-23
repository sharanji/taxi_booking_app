import 'dart:async';

import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:taxi_app/components/get_notes.dart';
import 'package:taxi_app/constants.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:taxi_app/fitness_app_theme.dart';
import 'package:taxi_app/main.dart';
import 'package:taxi_app/providers/bookingdetails.dart';
import 'package:taxi_app/providers/googlemap.dart';
import 'package:taxi_app/screens/payment/choose_payment.dart';
import 'package:taxi_app/screens/ride/schedule_selection.dart';
import 'package:taxi_app/theme.dart';

class SelectRideOptions extends StatefulWidget {
  SelectRideOptions(
      {required this.source,
      required this.polylines,
      required this.destination,
      required this.hours,
      required this.minutes,
      required this.distance,
      required this.bitMap,
      required this.initZoom,
      Key? key})
      : super(key: key);
  LatLng source;
  LatLng destination;
  int hours;
  int minutes;
  double distance;
  BitmapDescriptor bitMap;
  double initZoom;

  Map<PolylineId, Polyline> polylines;
  @override
  State<SelectRideOptions> createState() => _SelectRideOptionsState();
}

class _SelectRideOptionsState extends State<SelectRideOptions> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final gMapProvider = Provider.of<GoogleMapProvider>(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            // height: MediaQuery.of(context).size.height * 0.4,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: widget.source,
                zoom: widget.initZoom,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: {
                Marker(
                  markerId: const MarkerId('Source'),
                  position: widget.source,
                  icon: widget.bitMap,
                ),
                Marker(
                  markerId: const MarkerId('destination'),
                  position: widget.destination,
                )
              },
              polylines: Set<Polyline>.of(widget.polylines.values),
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              myLocationEnabled: false,
              zoomGesturesEnabled: true,
              padding: const EdgeInsets.all(0),
              buildingsEnabled: true,
              cameraTargetBounds: CameraTargetBounds.unbounded,
              compassEnabled: true,
              indoorViewEnabled: false,
              minMaxZoomPreference: MinMaxZoomPreference.unbounded,
              rotateGesturesEnabled: true,
              scrollGesturesEnabled: true,
              tiltGesturesEnabled: true,
              trafficEnabled: false,
            ),
          ),
          SizedBox(
            // height: MediaQuery.of(context).size.height * 0.5,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Address',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Container(
                    height: kToolbarHeight - 12,
                    width: double.infinity,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.25),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            gMapProvider.pickPlace['title'],
                            textAlign: TextAlign.left,
                          ),
                        ]),
                  ),
                  Container(
                    height: kToolbarHeight - 12,
                    width: double.infinity,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.25),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            gMapProvider.dropPlace['title'],
                            textAlign: TextAlign.left,
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.directions),
                          const SizedBox(width: 10),
                          Text('${widget.distance} kms'),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.person),
                          SizedBox(width: 10),
                          Text('1 - 3'),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.currency_rupee),
                          const SizedBox(width: 5),
                          Text(
                            '${(widget.distance * 15).toStringAsFixed(2)} only -/',
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: const Icon(
                          Icons.departure_board,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Consumer<BookingDetailsProvider>(
                          builder: (context, providerValue, child) {
                        String dateformatter =
                            DateFormat.yMMMMd('en_US').format(
                          providerValue.bookingDetails.rideDate,
                        );

                        var timeOfDay = providerValue.bookingDetails.rideTime;

                        int timeOfDayHour = timeOfDay.hour;
                        String timeOfDayMinute = timeOfDay.minute.toString();
                        String amPm = 'AM';
                        if (timeOfDay.hour > 12) {
                          amPm = 'PM';
                          timeOfDayHour = timeOfDay.hour - 12;
                        }
                        if (timeOfDay.minute < 10) {
                          timeOfDayMinute = '0${timeOfDay.minute}';
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            providerValue.bookingDetails.rideNow
                                ? Text(
                                    'Now',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  )
                                : Text(
                                    '$dateformatter -  $timeOfDayHour:$timeOfDayMinute $amPm',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Usally takes 5 - 10 minutes to pickup',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  const ScheduleButton(),
                  const Divider(),
                  Container(
                    // Confrim button
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: kToolbarHeight - 10,
                            padding: const EdgeInsets.symmetric(
                              // vertical: 5,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [
                                    FitnessAppTheme.nearlyDarkBlue,
                                    HexColor("#6F56E8")
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                            ),
                            child: const Icon(
                              FeatherIcons.chevronLeft,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const PaymentScreen(),
                                ),
                              );
                            },
                            child: Container(
                              height: kToolbarHeight - 10,
                              padding: const EdgeInsets.symmetric(
                                // vertical: 5,
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      FitnessAppTheme.nearlyDarkBlue,
                                      HexColor("#6F56E8")
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Spacer(),
                                  Text(
                                    'Pay and Confrim',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    FeatherIcons.chevronRight,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
