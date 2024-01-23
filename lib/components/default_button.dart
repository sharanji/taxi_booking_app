import 'package:flutter/material.dart';
import 'package:taxi_app/main.dart';
import 'package:taxi_app/theme.dart';

import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap : press as void Function()?,
      child: SizedBox(
        width: double.infinity,
        height: getProportionateScreenHeight(56),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [kPrimaryColor, HexColor("#6F56E8")],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Text(
              text!,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: Colors.white,
              ),
            ),
          ),
        ),
        // child: TextButton(
        //   style: TextButton.styleFrom(
        //     shape:
        //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        //     primary: Colors.white,
        //     backgroundColor: kPrimaryColor,
        //   ),
        //   onPressed: press as void Function()?,
        //   child: Text(
        //     text!,
        //     style: TextStyle(
        //       fontSize: getProportionateScreenWidth(18),
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
