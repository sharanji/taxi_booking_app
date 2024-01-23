import 'dart:async';
import 'dart:math';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:taxi_app/constants.dart';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:taxi_app/fitness_app_theme.dart';
import 'package:taxi_app/main.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:taxi_app/screens/ride/selectrideoption.dart';
import 'package:taxi_app/theme.dart';

class MapRoute extends StatefulWidget {
  MapRoute(this.sourceLocation, this.destination, {Key? key}) : super(key: key);
  // static const DEFAULT_ZOOM = 14.4746;
  // static const KINSHASA_LOCATION = LatLng(-4.325, 15.322222);
  LatLng sourceLocation;
  LatLng destination;
  @override
  State<MapRoute> createState() => _MapRouteState();
}

class _MapRouteState extends State<MapRoute> {
  final Completer<GoogleMapController> _controller = Completer();
  static LatLng sourceLocation = const LatLng(0.00, 0.00);
  static LatLng destination = const LatLng(0.00, 0.00);
  Map<PolylineId, Polyline> polylines = {};
  Uint8List customMarker = Uint8List(0);
  double initZoom = 15;

  //
  double totalDistance = 0.00;
  int hrs = 0;
  int mins = 0;
  double time = 0;

  List<LatLng> polylineCoordinates = [];

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<void> getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      ApiKeys.googleMapkey, // Your Google Map Key
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.driving,
    );
    // print("the polylines" + result.points.toString());
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      }
      PolylineId id = const PolylineId("poly");
      Polyline polyline = Polyline(
        polylineId: id,
        color: kPrimaryColor,
        points: polylineCoordinates,
        width: 3,
      );
      polylines[id] = polyline;

      for (var i = 0; i < polylineCoordinates.length - 1; i++) {
        totalDistance += calculateDistance(
            polylineCoordinates[i].latitude,
            polylineCoordinates[i].longitude,
            polylineCoordinates[i + 1].latitude,
            polylineCoordinates[i + 1].longitude);
      }

      totalDistance = double.parse((totalDistance).toStringAsFixed(2));

      // time = distance / speed ;
      time = totalDistance / (0.75);
      hrs = (time / 60).round();
      mins = ((time - hrs) % 60).round();

      customMarker = await getBytesFromAsset(
        'assets/images/pickLocation.png',
        100,
      );
    }
  }

  @override
  void initState() {
    sourceLocation = widget.sourceLocation;
    destination = widget.destination;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) => snapshot.connectionState ==
              ConnectionState.done
          ? Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.50,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: sourceLocation,
                        zoom: initZoom,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      onCameraMove: (CameraPosition c) {
                        initZoom = c.zoom;
                      },
                      markers: {
                        Marker(
                          markerId: const MarkerId('Source'),
                          position: sourceLocation,
                          icon: BitmapDescriptor.fromBytes(customMarker),
                        ),
                        Marker(
                          markerId: const MarkerId('destination'),
                          position: destination,
                        )
                      },
                      polylines: Set<Polyline>.of(polylines.values),
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
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                if (hrs != 0)
                                  Text(
                                    '$hrs hours ',
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontSize: 18,
                                    ),
                                  ),
                                Text(
                                  '$mins mins ',
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  ' ( $totalDistance km )',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Scaffold(
                                  body: SelectRideOptions(
                                    destination: destination,
                                    source: sourceLocation,
                                    polylines: polylines,
                                    hours: hrs,
                                    minutes: mins,
                                    distance: totalDistance,
                                    bitMap: BitmapDescriptor.fromBytes(
                                        customMarker),
                                    initZoom: initZoom,
                                  ),
                                ),
                              ),
                            ),
                            child: Container(
                              height: kToolbarHeight - 10,
                              // width: MediaQuery.of(context).size.width / 2,
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
                                  end: Alignment.bottomRight,
                                ),
                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Spacer(),
                                  Text(
                                    'Book Now',
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
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Book now and get extraordinary offers',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Expanded(
              child: Center(
                child: Text(
                  'Finding the best route..!',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
      future: getPolyPoints(),
    );
  }
}
