import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxi_app/components/map_picker.dart';
import 'package:taxi_app/fitness_app_theme.dart';
import 'package:taxi_app/main.dart';
import 'package:taxi_app/providers/googlemap.dart';
import 'package:taxi_app/constants.dart';
import 'package:taxi_app/screens/ride/maproute.dart';
import 'package:taxi_app/screens/dashboard/dashboardscreen.dart';
import 'package:taxi_app/theme.dart';

import './ridesaved_location.dart';

class RideScreen extends StatefulWidget {
  const RideScreen({Key? key}) : super(key: key);
  static const routeName = '/ride';

  @override
  State<RideScreen> createState() => _RideScreenState();
}

class _RideScreenState extends State<RideScreen> {
  var popScope = GlobalKey();
  final _dropLocationController = TextEditingController();
  final _dropLocationFocus = FocusNode();

  final _pickLocationController = TextEditingController();
  final _pickLocationFocus = FocusNode();
  bool isRide = true;
  bool isFirst = true;
  bool isPickupSet = false;
  bool isDropSet = false;
  bool issetScreen = true;

  Future<bool> _onWillPop(GoogleMapProvider provider) async {
    provider.dropPlace = {};
    provider.pickPlace = {};

    if (!(isRide && (isPickupSet && isDropSet))) {
      return true;
    }
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to reset locations ?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    isFirst = true;
                    isPickupSet = false;
                    isDropSet = false;
                    issetScreen = true;
                    _pickLocationController.clear();
                    _dropLocationController.clear();
                  });
                  Navigator.of(context).pop(false);
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    // bool args = ModalRoute.of(context)!.settings.arguments as bool;
    // if (isFirst) {
    //   isRide = args;
    //   isFirst = false;
    // }
    var gMapProvider = Provider.of<GoogleMapProvider>(context, listen: false);

    return WillPopScope(
      onWillPop: () => _onWillPop(gMapProvider),
      key: popScope,
      child: Scaffold(
        body: Column(
          children: [
            // Top screen wiggets
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).viewPadding.top,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () async {
                          bool canPop = await _onWillPop(gMapProvider);
                          if (canPop) {
                            Navigator.of(context).pop();
                          }
                        },
                        icon: const Icon(FeatherIcons.chevronLeft),
                      ),
                      const Text(
                        'Book Ride',
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          // fontStyle: FontStyle.italic,
                          fontSize: 20,
                        ),
                      ),
                      const Text('            '),
                    ],
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                // InkWell(
                //   onTap: () {
                //     setState(() {
                //       isRide = true;
                //     });
                //   },
                //   child: Container(
                //     padding: EdgeInsets.symmetric(
                //       vertical: 5,
                //       horizontal: MediaQuery.of(context).size.width / 6,
                //     ),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       border: Border.all(
                //         color: isRide
                //             ? PRIMARYCOLOR
                //             : Theme.of(context).canvasColor,
                //       ),
                //       color: isRide
                //           ? PRIMARYCOLOR
                //           : Theme.of(context).canvasColor,
                //     ),
                //     child: Text(
                //       'Rides',
                //       style: TextStyle(
                //         color: isRide ? Colors.white : Colors.black,
                //       ),
                //     ),
                //   ),
                // ),
                // InkWell(
                //   onTap: () {
                //     setState(() {
                //       isRide = false;
                //     });
                //   },
                //   child: Container(
                //     padding: EdgeInsets.symmetric(
                //       vertical: 5,
                //       horizontal: MediaQuery.of(context).size.width / 6,
                //     ),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       color: !isRide
                //           ? PRIMARYCOLOR
                //           : Theme.of(context).canvasColor,
                //       border: Border.all(
                //         color: !isRide
                //             ? PRIMARYCOLOR
                //             : Theme.of(context).canvasColor,
                //       ),
                //     ),
                //     child: Text(
                //       'Rentals',
                //       style: TextStyle(
                //         color: !isRide ? Colors.white : Colors.black,
                //       ),
                //     ),
                //   ),
                // ),
                //   ],
                // ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 0,
                    right: 10,
                    left: 10,
                    bottom: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              const Icon(
                                Icons.my_location,
                                color: PRIMARYCOLOR,
                              ),
                              if (isRide)
                                Container(
                                  height: 4,
                                  width: 4,
                                  margin: const EdgeInsets.only(top: 8),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        146, 191, 191, 191),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 20),
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                // boxShadow: const [
                                //   BoxShadow(
                                //     color: Color.fromARGB(255, 226, 226, 226),
                                //     blurRadius: 3.0,
                                //   ),
                                // ],
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: TextField(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter Pickup Location',
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                  ),
                                  controller: _pickLocationController,
                                  focusNode: _pickLocationFocus,
                                  readOnly:
                                      (isRide && (isPickupSet && isDropSet))
                                          ? true
                                          : false,
                                  onSubmitted: (val) {
                                    _pickLocationFocus.unfocus();
                                  },
                                  onEditingComplete: () {
                                    resetInputs(true);
                                  },
                                  onTap: () {
                                    resetInputs(false);
                                  },
                                  onChanged: (val) {
                                    setState(() {
                                      isPickupSet = false;
                                    });
                                    Provider.of<GoogleMapProvider>(context,
                                            listen: false)
                                        .placeSearch(val, 'PICK');
                                  },
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: showinfosheet,
                            icon: const Icon(
                              FeatherIcons.info,
                              color: kPrimaryColor,
                            ),
                          )
                        ],
                      ),
                      if (isRide)
                        Container(
                          height: 4,
                          width: 4,
                          margin: const EdgeInsets.only(
                            left: 10,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(146, 191, 191, 191),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      if (isRide)
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 4,
                                  width: 4,
                                  margin: const EdgeInsets.only(bottom: 8),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        146, 191, 191, 191),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                const Icon(
                                  FeatherIcons.mapPin,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 20),
                                padding: const EdgeInsets.all(2),
                                // width: MediaQuery.of(context).size.width - 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  // boxShadow: const [
                                  //   BoxShadow(
                                  //     color: Color.fromARGB(255, 226, 226, 226),
                                  //     blurRadius: 3.0,
                                  // ),
                                  // ],
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: TextField(
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter Drop Location',
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                    ),
                                    controller: _dropLocationController,
                                    focusNode: _dropLocationFocus,
                                    readOnly:
                                        (isRide && (isPickupSet && isDropSet))
                                            ? true
                                            : false,
                                    onSubmitted: (val) {
                                      _dropLocationFocus.unfocus();
                                    },
                                    onEditingComplete: () {
                                      resetInputs(true);
                                    },
                                    onTap: () {
                                      resetInputs(false);
                                    },
                                    onChanged: (val) {
                                      setState(() {
                                        isDropSet = false;
                                      });
                                      Provider.of<GoogleMapProvider>(context,
                                              listen: false)
                                          .placeSearch(val, 'DROP');
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                          ],
                        )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 226, 226, 226),
                        blurRadius: 0.1,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Address places
            if (!(isRide && (isPickupSet && isDropSet)))
              Expanded(
                child: SingleChildScrollView(
                  child: Consumer<GoogleMapProvider>(
                    builder: (context, data, child) {
                      return placesList(data.placeList, child!);
                    },
                    child: RideSavedLocation(setForPick, setForDrop),
                  ),
                ),
              ),
            if (isRide && (isPickupSet && isDropSet))
              FutureBuilder(
                builder: (context, snapshot) {
                  return snapshot.connectionState == ConnectionState.waiting
                      ? Expanded(
                          child: Center(
                            child: Text(
                              'Finding the best route..!',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        )
                      : MapRoute(
                          gMapProvider.pickPlace['geometry'],
                          gMapProvider.dropPlace['geometry'],
                        );
                },
                future: gMapProvider.getLatLongfromPlaces(),
              ),
          ],
        ),
        bottomNavigationBar: !(isRide && (isPickupSet && isDropSet))
            ? Material(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      FitnessAppTheme.nearlyDarkBlue,
                      HexColor("#6F56E8")
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  ),
                  child: InkWell(
                    onTap: () async {
                      if (!isRide) {
                        final result = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MapPicker('PICK'),
                          ),
                        );
                        if (!mounted) return;
                        gMapProvider.pickPlace = result;
                        _pickLocationController.text = result['title'];
                        setState(() {
                          isPickupSet = true;
                          _pickLocationFocus.unfocus();
                        });
                      } else {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 150,
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  ListTile(
                                    onTap: () async {
                                      Navigator.of(context).pop();
                                      final result =
                                          await Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MapPicker('PICK'),
                                        ),
                                      );
                                      if (!mounted) return;
                                      gMapProvider.pickPlace = result;
                                      _pickLocationController.text =
                                          result['title'];
                                      setState(() {
                                        isPickupSet = true;
                                        _pickLocationFocus.unfocus();
                                      });
                                    },
                                    leading: const Icon(
                                      Icons.my_location,
                                      color: PRIMARYCOLOR,
                                    ),
                                    title: const Text('Choose for Pick up'),
                                  ),
                                  const Divider(),
                                  ListTile(
                                    onTap: () async {
                                      Navigator.of(context).pop();
                                      var result =
                                          await Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MapPicker('DROP'),
                                        ),
                                      );
                                      if (!mounted) return;
                                      gMapProvider.dropPlace = result;
                                      _dropLocationController.text =
                                          result['title'];
                                      setState(() {
                                        isDropSet = true;
                                        _dropLocationFocus.unfocus();
                                      });
                                    },
                                    leading: const Icon(
                                      FeatherIcons.mapPin,
                                      color: Colors.red,
                                    ),
                                    title: const Text('Choose for Drop'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: SizedBox(
                      height: kToolbarHeight,
                      width: double.infinity,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              FeatherIcons.mapPin,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Choose from Map',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Container(
                height: 0.1,
              ),
      ),
    );
  }

  showinfosheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Tip for Better Pickup Experience !',
                        style: TextStyle(
                          color: Colors.black54,
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close),
                      )
                    ],
                  )
                ],
              )),
        );
      },
    );
  }

  void resetInputs(bool unfoucs) {
    if (unfoucs) {
      _dropLocationFocus.unfocus();
      _pickLocationFocus.unfocus();
    }

    if (!isDropSet) {
      _dropLocationController.clear();
    }
    if (!isPickupSet) {
      _pickLocationController.clear();
    }
  }

  void setForDrop(gMapProvider, place) {
    print('set');
    gMapProvider.dropPlace = place;
    _dropLocationController.text = place['title'];
    setState(() {
      isDropSet = true;
      _dropLocationFocus.unfocus();
    });
  }

  void setForPick(gMapProvider, place) {
    print('set');
    gMapProvider.pickPlace = place;
    _pickLocationController.text = place['title'];
    setState(() {
      isPickupSet = true;
      _pickLocationFocus.unfocus();
    });
  }

  Widget placesList(List placelist, Widget child) {
    var gMapProvider = Provider.of<GoogleMapProvider>(context, listen: false);

    return Column(
      children: [
        if (placelist.isEmpty) child,
        ...placelist.map((place) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  if (place['for_input'] == 'DROP') {
                    setForDrop(gMapProvider, place);
                  } else if (place['for_input'] == 'PICK') {
                    setForPick(gMapProvider, place);
                  }

                  gMapProvider.placeSearch('', '');
                },
                child: ListTile(
                  leading: const Icon(FeatherIcons.search),
                  minLeadingWidth: 1,
                  minVerticalPadding: 1,
                  title: Text(place['title']),
                  subtitle: Text(
                    place['sub_title'],
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              const Divider(),
            ],
          );
        }).toList()
      ],
    );
  }
}
