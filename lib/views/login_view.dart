import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:climategame/utils/colors.dart';
import 'package:climategame/utils/styles.dart';
import 'package:get/get.dart';
import 'package:climategame/controllers/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(cAppBackground);
    return SafeArea(
      child: Scaffold(
        backgroundColor: cAppBackground,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Welcome!',
                    style: boldTextStyle(size: 25),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SDButton(
                    textContent: "SIGN IN",
                    onPressed: () =>
                        this.login(),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'This application requires you to have a HAT Personal Data Account.\n\nEnter your email address on the next page. You will be redirected to your HAT PDA for authentication. Otherwise, you will also be given the option of getting a HAT PDA.',
                    style: secondaryTextStyle(size: 16),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void dispose() {
    // Clean up the controller when the widget is disposed.
  }

  void login() async {
    final loginUrl = controller.loginUrl();
    print(loginUrl);
    if (await canLaunch(loginUrl)) {
      launch(loginUrl);
    } else {
      Get.snackbar('Unknown Login Error', 'Unable to redirect to your PDA.',
      backgroundColor: cSecondaryColorRed,
      colorText: cTextTertiaryColor);
    }
  }
}
