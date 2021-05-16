import 'dart:async';

import 'package:climategame/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:climategame/utils/styles.dart';
import 'package:climategame/utils/data_keys.dart';
import 'package:climategame/views/walk_through_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static String tag = '/SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final GetStorage box = GetStorage(dkStore);
  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  void navigationPage() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getBool(dkSplash) ?? false) {
      Get.off(LoginView());
    } else {
      preferences.setBool(dkSplash, true);
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WalkThroughView(),
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    //final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF076ACF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              height: 105,
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                "The Climate Game",
                style: secondaryTextStyle(
                  size: 25,
                  textColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
