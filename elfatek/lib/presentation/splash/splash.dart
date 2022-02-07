import 'dart:async';

import 'package:elfatek/features/auth/providers/auth_provider.dart';
import 'package:elfatek/features/auth/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../resources/size_config.dart';

import '../../app/app_prefs.dart';
import '../../app/di.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  AppPreferences _appPreferences = AppPreferences.instance;

  _startDelay() {
    _timer = Timer(Duration(seconds: 2), _goNext);
  }

  Future _goNext() async {
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
          if (isUserLoggedIn)
            {
              Navigator.pushReplacementNamed(context, Routes.mainRoute),
              // navigate to main screen
            }
          else
            {
              _appPreferences
                  .isOnBoardingScreenViewed()
                  .then((isOnBoardingScreenViewed) => {
                        if (isOnBoardingScreenViewed)
                          {
                            Navigator.pushReplacementNamed(
                                context, Routes.loginRoute)
                          }
                        else
                          {
                            Navigator.pushReplacementNamed(
                                context, Routes.onBoardingRoute)
                          }
                      })
            }
        });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<UserProvider>(context).getUser();
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image(
          image: AssetImage(ImageAssets.splashLogo),
        ),
      ),
    );
  }
}
