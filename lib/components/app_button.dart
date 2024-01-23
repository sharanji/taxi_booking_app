import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  AppButton(
      {required this.buttonChild, required this.onPressedHandeler, Key? key})
      : super(key: key);
  Widget buttonChild;
  var onPressedHandeler;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          alignment: Alignment.center,
        ),
        onPressed: onPressedHandeler,
        child: buttonChild,
      ),
    );
  }
}
