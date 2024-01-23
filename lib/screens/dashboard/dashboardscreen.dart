import 'dart:ui';

import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/components/app_button.dart';
import 'package:taxi_app/components/carousel.dart';
import 'package:taxi_app/components/drawer.dart';
import 'package:taxi_app/screens/ride/ridescreen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static const routeName = '/dashboard';
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        Future.delayed(const Duration(seconds: 2));
      },
      child: Scaffold(
        key: scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(
                          30,
                        ),
                        bottomRight: Radius.circular(
                          20,
                        ),
                      ),
                    ),
                    height: 300,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Hey Sharanji!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width - 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromARGB(68, 117, 117, 117),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Schedule Safe , Reliabe, & 100% \n Electric Rides!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppButton(
                                buttonChild: Row(
                                  children: const [
                                    Icon(Icons.pin_drop),
                                    Text(" City Rides"),
                                  ],
                                ),
                                onPressedHandeler: () {
                                  Navigator.of(context).pushNamed(
                                    RideScreen.routeName,
                                    arguments: true,
                                  );
                                },
                              ),
                              AppButton(
                                buttonChild: Row(
                                  children: const [
                                    Icon(Icons.timelapse),
                                    Text(" Rentals"),
                                  ],
                                ),
                                onPressedHandeler: () {
                                  Navigator.of(context).pushNamed(
                                    RideScreen.routeName,
                                    arguments: false,
                                  );
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const AppCarousel(),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.blue,
                      margin: const EdgeInsets.all(5),
                      height: 100,
                      width: 100,
                    ),
                    Container(
                      color: Colors.blue,
                      margin: const EdgeInsets.all(5),
                      height: 100,
                      width: 100,
                    ),
                    Container(
                      color: Colors.blue,
                      margin: const EdgeInsets.all(5),
                      height: 100,
                      width: 100,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
