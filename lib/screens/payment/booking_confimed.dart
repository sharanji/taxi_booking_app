import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxi_app/fitness_app_theme.dart';
import 'package:taxi_app/main.dart';
import 'package:taxi_app/providers/googlemap.dart';
import 'package:taxi_app/screens/payment/choose_payment.dart';
import 'package:taxi_app/screens/ride/ridescreen.dart';
import 'package:taxi_app/theme.dart';

class BookingConfrimed extends StatelessWidget {
  const BookingConfrimed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).viewPadding.top + 20,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(color: Colors.grey, blurRadius: 5),
                  ],
                ),
                child: const Icon(Icons.close),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).viewPadding.top + 15,
                  ),
                  Text('Booking Confirmed',
                      style: Theme.of(context).textTheme.headline5!
                      // .copyWith(color: Colors.grey),
                      ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, blurRadius: 5),
                      ],
                    ),
                    child: const Icon(
                      FeatherIcons.check,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Your taxi PIN ',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '0765438',
                        style: TextStyle(
                          letterSpacing: 4,
                          color: kPrimaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Flexible(
                        child: Text(
                          'Give the 6 digit Number to your assinged driver at the time of Pickup!',
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    // height: 100,
                    // padding: EdgeInsets.all(2),
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10),
                    //   // border: Border.all(color: Colors.grey),
                    //   // boxShadow: const [
                    //   //   BoxShadow(color: Colors.grey, blurRadius: 2),
                    //   // ],
                    // ),
                    // child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      // horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ride Booked - ( 25.6 Kms )',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text('August 18 , 10:15 AM'),
                                // Text(
                                //   '23.5 kms',
                                //   style: Theme.of(context).textTheme.caption,
                                // ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'You will be assinged a Driver soon!',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     const SizedBox(
                  //       height: 30,
                  //     ),
                  //     // Text(
                  //     //   "Ride Scheduled at :",
                  //     //   style: Theme.of(context).textTheme.titleLarge,
                  //     // ),
                  //     // const Spacer(),
                  //     const Text('August 18 ,'),
                  //     const Text('10:15 AM'),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        'Ride Route',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 70,
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              FeatherIcons.mapPin,
                              color: Colors.green,
                            ),
                            Container(
                              height: 4,
                              width: 4,
                              margin: const EdgeInsets.only(
                                left: 0,
                              ),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(146, 191, 191, 191),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            Container(
                              height: 4,
                              width: 4,
                              margin: const EdgeInsets.only(
                                left: 0,
                              ),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(146, 191, 191, 191),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            const Icon(
                              FeatherIcons.mapPin,
                              color: Colors.red,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              child: Text('Address 1 ahsgdvfahsdgvfajkdsb '),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: Text('Address 1 ahsgdvfahsdgvfajkdsb '),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // const Divider(),
                  ListTile(
                    leading: const Icon(
                      FeatherIcons.creditCard,
                      color: kPrimaryColor,
                    ),
                    title: Text('Online Payment'),
                    trailing: Container(
                      width: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text('Rs. 300'),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.info,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: Text(
                      'Need Help ?',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    trailing: const Icon(
                      FeatherIcons.chevronRight,
                    ),
                  ),
                  const Divider(),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: const [
                          Text(
                            'Cancelation & Waiting Policy!',
                            style: TextStyle(
                              color: kPrimaryColor,
                              decoration: TextDecoration.underline,
                              // decorationStyle: TextDecorationStyle.dashed,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 5,
        ),
        margin: const EdgeInsets.only(bottom: 20),
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
                  border: Border.all(color: Colors.grey),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Cancel Ride',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: InkWell(
                onTap: () async {
                  var gmapProvider = Provider.of<GoogleMapProvider>(
                    context,
                    listen: false,
                  );
                  var temp = gmapProvider.dropPlace;

                  gmapProvider.dropPlace = gmapProvider.pickPlace;
                  gmapProvider.pickPlace = temp;

                  Navigator.of(context).pushReplacementNamed(
                    RideScreen.routeName,
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
                    gradient: LinearGradient(colors: [
                      FitnessAppTheme.nearlyDarkBlue,
                      HexColor("#6F56E8")
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Book Return Ride',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
