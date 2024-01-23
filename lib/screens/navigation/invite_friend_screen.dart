import 'package:taxi_app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/components/default_button.dart';

class InviteFriend extends StatefulWidget {
  @override
  _InviteFriendState createState() => _InviteFriendState();
}

class _InviteFriendState extends State<InviteFriend> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = true; //brightness == Brightness.light;
    return Container(
      // color: isLightMode ? AppTheme.white : AppTheme.nearlyBlack,
      child: SafeArea(
        top: false,
        child: Scaffold(
          // backgroundColor: isLightMode ? AppTheme.white : AppTheme.nearlyBlack,
          body: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).viewPadding.top + 50,
                    left: 16,
                    right: 16),
                child: Image.asset('assets/images/inviteImage.png'),
              ),
              Container(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'Invite Your Friends',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isLightMode ? Colors.black : Colors.white,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  'Are you one of those who makes everything\n at the last moment?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: isLightMode ? Colors.black : Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 5,
                  ),
                  child: Center(
                    child: DefaultButton(
                      press: () {},
                      text: 'Share',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
