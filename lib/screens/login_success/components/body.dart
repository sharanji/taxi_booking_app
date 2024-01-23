import 'package:flutter/material.dart';
import 'package:taxi_app/components/default_button.dart';
import 'package:taxi_app/constants.dart';
import 'package:taxi_app/screens/dashboard/dashboardscreen.dart';
import 'package:taxi_app/size_config.dart';
import 'package:taxi_app/theme.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).viewPadding.top),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   'Login Success',
            //   style: Theme.of(context)
            //       .textTheme
            //       .titleLarge!
            //       .copyWith(color: kPrimaryColor),
            // )
          ],
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/Background_success.png",
          // height: SizeConfig.screenHeight * 0.4, //40%
          fit: BoxFit.cover,
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Back to home",
            press: () {
              Navigator.pushNamed(context, DashboardScreen.routeName);
            },
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
