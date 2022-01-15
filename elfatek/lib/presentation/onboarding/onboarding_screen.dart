import '../../app/app_prefs.dart';
import '../resources/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/body.dart';

class OnBoardingScreen extends StatelessWidget {
  static String routeName = "/splash";

  const OnBoardingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppPreferences.instance.setOnBoardingScreenViewed();
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // _prefs.then((SharedPreferences prefs) {
    //   return prefs.setBool(showSplash, false);
    // });
    // You have to call it on your starting screen
    return const Scaffold(
      body: Body(),
    );
  }
}
