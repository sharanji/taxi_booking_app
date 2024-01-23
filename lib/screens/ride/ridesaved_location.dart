import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxi_app/components/map_picker.dart';
import 'package:taxi_app/fitness_app_theme.dart';
import 'package:taxi_app/providers/googlemap.dart';
import 'package:taxi_app/providers/userdetails.dart';
import 'package:taxi_app/screens/Favplaces/favrouite_screen.dart';
import 'package:taxi_app/constants.dart';
import 'package:taxi_app/theme.dart';

class RideSavedLocation extends StatefulWidget {
  RideSavedLocation(this.callBackforPick, this.callBackforDrop, {Key? key})
      : super(key: key);
  var callBackforPick;
  var callBackforDrop;

  @override
  State<RideSavedLocation> createState() => _RideSavedLocationState();
}

class _RideSavedLocationState extends State<RideSavedLocation> {
  @override
  Widget build(BuildContext context) {
    final userDetailsProvider = Provider.of<UserDetailsProvider>(context);
    final userGmapProvider =
        Provider.of<GoogleMapProvider>(context, listen: false);

    return FutureBuilder(
      future: userDetailsProvider.onProviderInit(),
      builder: (ctx, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? Container()
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        userDetailsProvider.addedHome
                            ? GestureDetector(
                                onTap: () {
                                  if (userGmapProvider.pickPlace.isEmpty) {
                                    userDetailsProvider
                                        .userHomePlcae['for_input'] = 'PICK';

                                    widget.callBackforPick(
                                      userGmapProvider,
                                      userDetailsProvider.userHomePlcae,
                                    );
                                  } else if (userGmapProvider
                                      .dropPlace.isEmpty) {
                                    userDetailsProvider
                                        .userHomePlcae['for_input'] = 'DROP';
                                    widget.callBackforDrop(
                                      userGmapProvider,
                                      userDetailsProvider.userHomePlcae,
                                    );
                                  }
                                },
                                child: const Chip(
                                  backgroundColor: kPrimaryColor,
                                  avatar: CircleAvatar(
                                    backgroundColor:
                                        FitnessAppTheme.nearlyWhite,
                                    child: Icon(
                                      Icons.home,
                                      size: 15,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  label: Text(
                                    'Home',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () async {
                                  var pickedHome =
                                      await Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) {
                                      return MapPicker('home');
                                    }),
                                  );
                                  if (!mounted) return;

                                  try {
                                    if (pickedHome['place_id'] != String) {
                                      return;
                                    }
                                  } catch (e) {
                                    return;
                                  }

                                  userDetailsProvider.addHome(pickedHome);
                                },
                                child: const Chip(
                                  backgroundColor: Colors.grey,
                                  avatar: CircleAvatar(
                                    backgroundColor:
                                        FitnessAppTheme.nearlyWhite,
                                    child: Icon(
                                      Icons.home,
                                      size: 15,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  label: Text(
                                    'Add Work',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                        const SizedBox(
                          width: 20,
                        ),
                        userDetailsProvider.addedwork
                            ? GestureDetector(
                                onTap: () {
                                  if (userGmapProvider.pickPlace.isEmpty) {
                                    userDetailsProvider
                                        .userWorkPlcae['for_input'] = 'PICK';

                                    widget.callBackforPick(
                                      userGmapProvider,
                                      userDetailsProvider.userWorkPlcae,
                                    );
                                  } else if (userGmapProvider
                                      .dropPlace.isEmpty) {
                                    userDetailsProvider
                                        .userWorkPlcae['for_input'] = 'DROP';
                                    widget.callBackforDrop(
                                      userGmapProvider,
                                      userDetailsProvider.userWorkPlcae,
                                    );
                                  }
                                },
                                child: const Chip(
                                  backgroundColor: kPrimaryColor,
                                  avatar: CircleAvatar(
                                    backgroundColor:
                                        FitnessAppTheme.nearlyWhite,
                                    child: Icon(
                                      Icons.home,
                                      size: 15,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  label: Text(
                                    'Work',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () async {
                                  var pickedHome =
                                      await Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) {
                                      return MapPicker('work');
                                    }),
                                  );
                                  if (!mounted) return;

                                  try {
                                    if (pickedHome['place_id'] != String) {
                                      return;
                                    }
                                  } catch (e) {
                                    return;
                                  }

                                  userDetailsProvider.addWork(pickedHome);
                                },
                                child: const Chip(
                                  backgroundColor: Colors.grey,
                                  avatar: CircleAvatar(
                                    backgroundColor:
                                        FitnessAppTheme.nearlyWhite,
                                    child: Icon(
                                      Icons.home,
                                      size: 15,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  label: Text(
                                    'Add Work',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(FavroiteScreen.routeName);
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: const EdgeInsets.all(5),
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.grey,
                              size: 18,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('Favroite Places'),
                          const Spacer(),
                          const Icon(FeatherIcons.chevronRight),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              );
      },
    );
  }
}
