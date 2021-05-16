import 'dart:async';

import 'package:climategame/controllers/auth_controller.dart';
import 'package:climategame/quiz/Screens/QuizDashboard.dart';
import 'package:climategame/utils/colors.dart';
import 'package:climategame/utils/data_keys.dart';
import 'package:climategame/services/auth_service.dart';
import 'package:climategame/views/splash_screen.dart';

import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_links/uni_links.dart';

void main() async {
  await GetStorage.init(dkStore);
  retrievePreferences();
  Get.lazyPut<Client>(() => Client());
  Get.lazyPut<AuthService>(() => AuthService());
  Get.lazyPut<AuthController>(() => AuthController());
  runApp(MyApp());
}

void retrievePreferences() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  GetStorage box = GetStorage(dkStore);
  box.erase();
  if (preferences.getString(dkPda) != null) box.write(dkPda, preferences.getString(dkPda));
  if (preferences.getString(dkToken) != null) box.write(dkToken, preferences.getString(dkToken));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription _sub;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [
          Locale('en', ''),
        ],
        routes: <String, WidgetBuilder>{
          SplashScreen.tag: (BuildContext context) => SplashScreen()
        },
        title: 'The Climate Game',
        home: SplashScreen(),
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: SBehavior(),
            child: child!,
          );
        });
  }

  @override
  initState() {
    super.initState();
    _sub = linkStream.listen((String? link) {
      if (!mounted) return;
      setState(() {
        try {
          if (link != null) {
            Uri _latestUri = Uri.parse(link);
            if (_latestUri.queryParameters.containsKey('token')) {
              final token = _latestUri.queryParameters['token'];
              final pda = Get.find<AuthController>().extractPda(token!);
              GetStorage(dkStore).write(dkToken, token);
              GetStorage(dkStore).write(dkPda, pda);
              print("Success!");
              print(pda);
              Get.off(QuizDashboard());
            } else if (_latestUri.queryParameters.containsKey('error')) {
              Get.snackbar('Unable to create new PDA', _latestUri.queryParameters['error_reason']!,
                  backgroundColor: cSecondaryColorRed,
                  colorText: cTextTertiaryColor);
            }
          }
        } on FormatException {}
      });
    }, onError: (Object err) {
      print(err.toString());
    });
  }


  @override
  dispose() {
    if (_sub != null) _sub.cancel();
    super.dispose();
  }
}

class SBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
