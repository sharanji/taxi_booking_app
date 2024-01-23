import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_app/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapProvider with ChangeNotifier {
  List placeList = [];
  Map dropPlace = {};
  Map pickPlace = {};
  LatLng userlatLong = const LatLng(0, 0);

  GoogleMapProvider() {
    determinePosition();
  }

  Future getLatLongfromPlaces() async {
    if (pickPlace != {}) {
      LatLng geometry = await placeIdtoLatLong(pickPlace['place_id']);
      pickPlace['geometry'] = geometry;
    }
    if (dropPlace != {}) {
      LatLng geometry = await placeIdtoLatLong(dropPlace['place_id']);
      dropPlace['geometry'] = geometry;
    }
  }

  Future<LatLng> placeIdtoLatLong(String placeId) async {
    final String gmapApiKey = ApiKeys.googleMapkey;

    var mapResponse = await http.get(
      Uri.parse(
        'https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&key=$gmapApiKey',
      ),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (mapResponse.statusCode == 200) {
      var response = json.decode(mapResponse.body);

      var results = response['result']['geometry']['location'];
      print('lat long ' + results.toString());

      return LatLng(results['lat'], results['lng']);
    } else {
      return const LatLng(0.00, 0.00);
    }
  }

  Future latLongtoAdddress(String lat, String long, String forInput) async {
    final String gmapApiKey = ApiKeys.googleMapkey;

    var mapResponse = await http.get(
      Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=$gmapApiKey',
      ),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (mapResponse.statusCode == 200) {
      var response = json.decode(mapResponse.body);

      var results = response['results'][0];
      var place = {
        'place_id': results['place_id'],
        'title': response['plus_code']['compound_code'] ??
            response['plus_code']['global_code'],
        'sub_title': results['formatted_address'],
        'for_input': forInput,
      };

      return place;
    } else {
      return {'Something went wrong'};
    }
  }

  Future<List> placeSearch(String input, String forInput) async {
    final String gmapApiKey = ApiKeys.googleMapkey;

    var mapResponse = await http.get(
      Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=establishment&radius=500&key=$gmapApiKey',
      ),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (mapResponse.statusCode == 200) {
      var response = json.decode(mapResponse.body);
      List predictedPlaces = response['predictions'];
      placeList = [];
      for (var i = 0; i < predictedPlaces.length; i++) {
        placeList.add({
          'place_id': predictedPlaces[i]['place_id'],
          'title': predictedPlaces[i]['structured_formatting']['main_text'],
          'sub_title': predictedPlaces[i]['description'],
          'for_input': forInput,
        });
      }

      notifyListeners();
      return placeList;
    } else {
      return ['Something went wrong'];
    }
  }

  Future getTimeForTravel(LatLng p1, LatLng p2) async {
    final String gmapApiKey = ApiKeys.googleMapkey;
    var lat1 = p1.latitude;
    var long1 = p1.longitude;
    var lat2 = p2.latitude;
    var long2 = p2.longitude;

    var mapResponse = await http.get(
      Uri.parse(
        "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=$lat1,$long1&destinations=$lat2,$long2&key=$gmapApiKey",
      ),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (mapResponse.statusCode == 200) {
      var response = json.decode(mapResponse.body);
      List predictedPlaces = response['predictions'];
      placeList = [];

      notifyListeners();
      // print(placeList);
      return placeList;
    } else {
      return ['Something went wrong'];
    }
  }

  Future determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    var latLong = await Geolocator.getCurrentPosition();
    userlatLong = LatLng(latLong.latitude, latLong.longitude);

    return userlatLong;
  }
}
