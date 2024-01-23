import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDetailsProvider with ChangeNotifier {
  bool addedHome = false;
  bool addedwork = false;
  Map userHomePlcae = {
    'place_id': '',
    'title': 'Home',
    'sub_title': 'User Home',
  };
  Map userWorkPlcae = {
    'place_id': '',
    'title': 'Home',
    'sub_title': 'User Home',
  };

  Future<void> onProviderInit() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('userHomeBool') == true) {
      addedHome = true;
      print('add' + addedHome.toString());
      userHomePlcae = json.decode(prefs.getString('userHomeplace')!);
    }
    if (prefs.getBool('userWorkBool') == true) {
      addedwork = true;
      userHomePlcae = json.decode(prefs.getString('userWorkplace')!);
    }
  }

  void addHome(place) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userHomeplace', json.encode(place));
    prefs.setBool('userHomeBool', true);
    userHomePlcae = place;
    addedHome = true;

    notifyListeners();
  }

  void addWork(place) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userWorkplace', json.encode(place));
    prefs.setBool('userWorkBool', true);
    userWorkPlcae = place;
    addedwork = true;

    notifyListeners();
  }
}
