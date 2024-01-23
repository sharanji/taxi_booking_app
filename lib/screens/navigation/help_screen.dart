import 'package:taxi_app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/components/default_button.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = true; //brightness == Brightness.light;
    return SafeArea(
      top: false,
      child: Scaffold(
        // backgroundColor:
        //     isLightMode ? AppTheme.nearlyWhite : AppTheme.nearlyBlack,
        body: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).viewPadding.top + 50,
                  left: 16,
                  right: 16),
              child: Image.asset('assets/images/helpImage.png'),
            ),
            Container(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'How can we help you?',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isLightMode ? Colors.black : Colors.white),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                'It looks like you are experiencing problems\nwith our sign up process. We are here to\nhelp so please get in touch with us',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: isLightMode ? Colors.black : Colors.white),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: DefaultButton(
                press: () {},
                text: 'Chat with us',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
