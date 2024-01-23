import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  DrawerItem(
      {required this.iconPath,
      required this.itemName,
      required this.onPressedHandler,
      Key? key})
      : super(key: key);
  String iconPath;
  String itemName;
  var onPressedHandler;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressedHandler,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            height: 30,
            child: Image.asset(iconPath),
          ),
          Text(itemName),
          const Spacer(),
          const Icon(
            Icons.chevron_right,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
