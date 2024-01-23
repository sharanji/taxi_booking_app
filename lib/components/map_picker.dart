import 'dart:async';

import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:taxi_app/constants.dart';
import 'package:taxi_app/fitness_app_theme.dart';
import 'package:taxi_app/main.dart';
import 'package:taxi_app/providers/googlemap.dart';
import 'package:taxi_app/screens/ride/ridescreen.dart';
import 'package:taxi_app/theme.dart';

class MapPicker extends StatefulWidget {
  static const DEFAULT_ZOOM = 14.4746;
  static const KINSHASA_LOCATION = LatLng(-4.325, 15.322222);

  double initZoom;
  LatLng initCoordinates;

  LatLng value = KINSHASA_LOCATION;
  String forInput;

  MapPicker(this.forInput,
      {Key? key,
      this.initZoom = DEFAULT_ZOOM,
      this.initCoordinates = KINSHASA_LOCATION})
      : super(key: key);

  @override
  State<MapPicker> createState() => _MapPickerState();
}

class _MapPickerState extends State<MapPicker> {
  final Completer<GoogleMapController> _controller = Completer();
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    widget.initCoordinates =
        Provider.of<GoogleMapProvider>(context, listen: false).userlatLong;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.transparent,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Choose location',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                var maxWidth = constraints.biggest.width;
                var maxHeight = constraints.biggest.height;

                return Stack(
                  children: <Widget>[
                    SizedBox(
                      height: maxHeight,
                      width: maxWidth,
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: Provider.of<GoogleMapProvider>(context)
                              .userlatLong,
                          zoom: widget.initZoom,
                        ),
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                        onCameraMove: (CameraPosition newPosition) async {
                          widget.value = newPosition.target;
                          var place = await Provider.of<GoogleMapProvider>(
                                  context,
                                  listen: false)
                              .latLongtoAdddress(
                            widget.value.latitude.toString(),
                            widget.value.longitude.toString(),
                            widget.forInput,
                          );
                          myController.text = place['title'];
                        },
                        mapType: MapType.normal,
                        myLocationButtonEnabled: false,
                        myLocationEnabled: true,
                        zoomGesturesEnabled: true,
                        padding: const EdgeInsets.all(0),
                        buildingsEnabled: true,
                        cameraTargetBounds: CameraTargetBounds.unbounded,
                        compassEnabled: false,
                        indoorViewEnabled: false,
                        // mapToolbarEnabled: true,
                        minMaxZoomPreference: MinMaxZoomPreference.unbounded,
                        rotateGesturesEnabled: true,
                        scrollGesturesEnabled: true,
                        tiltGesturesEnabled: true,
                        trafficEnabled: false,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        width: maxWidth - 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                          readOnly: true,
                          controller: myController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            prefixIcon: Icon(
                              Icons.map,
                              size: 35,
                              color: kPrimaryColor,
                            ),
                            prefixIconColor: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: maxHeight / 2,
                      right: (maxWidth - 30) / 2,
                      child: const Icon(
                        Icons.person_pin_circle,
                        size: 30,
                        color: kPrimaryColor,
                      ),
                    ),
                    Positioned(
                      bottom: 120,
                      right: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              colors: [kPrimaryColor, HexColor("#6F56E8")],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                        ),
                        child: IconButton(
                          onPressed: () async {
                            var position = await Provider.of<GoogleMapProvider>(
                              context,
                              listen: false,
                            ).determinePosition();
                            final GoogleMapController controller =
                                await _controller.future;

                            controller.animateCamera(
                                CameraUpdate.newCameraPosition(CameraPosition(
                              target:
                                  LatLng(position.latitude, position.longitude),
                              zoom: widget.initZoom,
                            )));
                          },
                          icon: const Icon(
                            Icons.my_location,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: InkWell(
                        onTap: () async {
                          var place = await Provider.of<GoogleMapProvider>(
                                  context,
                                  listen: false)
                              .latLongtoAdddress(
                            widget.value.latitude.toString(),
                            widget.value.longitude.toString(),
                            widget.forInput,
                          );
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pop(place);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [kPrimaryColor, HexColor("#6F56E8")],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: const [
                              Icon(
                                FeatherIcons.mapPin,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Choose this location',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
