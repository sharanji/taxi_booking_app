import 'package:flutter/material.dart';
import 'package:taxi_app/components/drawer_item.dart';
import 'package:taxi_app/screens/ride/ridescreen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top,
          ),
          ListTile(
            leading: Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
              child: Image.asset(
                'assets/images/user.png',
                fit: BoxFit.contain,
              ),
            ),
            title: const Text(
              'sharanji',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              children: [
                const Text('View Profile'),
                Container(
                  width: 15,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(
                    'assets/images/checked.png',
                    fit: BoxFit.contain,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.chevron_right,
                size: 35,
              ),
              onPressed: () {},
            ),
          ),
          const Divider(),
          DrawerItem(
            iconPath: 'assets/images/credit-card.png',
            itemName: 'New Ride',
            onPressedHandler: () {
              Navigator.of(context)
                  .pushNamed(RideScreen.routeName, arguments: true);
            },
          ),
          DrawerItem(
            iconPath: 'assets/images/credit-card.png',
            itemName: 'Payments',
            onPressedHandler: () {
              Navigator.of(context)
                  .pushNamed(RideScreen.routeName, arguments: false);
            },
          ),
        ],
      ),
    );
  }
}
