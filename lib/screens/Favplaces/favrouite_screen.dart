import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/constants.dart';

class FavroiteScreen extends StatefulWidget {
  const FavroiteScreen({Key? key}) : super(key: key);
  static const routeName = '/favrouite';

  @override
  State<FavroiteScreen> createState() => _FavroiteScreenState();
}

class _FavroiteScreenState extends State<FavroiteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).viewPadding.top,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(FeatherIcons.chevronLeft),
            ),
            const Text(
              'Choose a Place',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text('      '),
          ],
        ),
        const Divider(),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Row(
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
                  const Text('sample address.....'),
                ],
              ),
              const Divider(),
            ],
          ),
        ),
      ],
    ));
  }
}
