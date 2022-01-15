import 'package:elfatek/constants.dart';
import 'package:elfatek/controller/provider/auth_provider.dart';
import 'package:elfatek/screens/main_screen/main_screen.dart';
import 'package:elfatek/screens/sign_in/sign_in_screen.dart';
import 'package:elfatek/screens/splash/splash_screen.dart';
import 'package:elfatek/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthScreen extends StatefulWidget {
  static String routeName = "/auth";

  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String?> _token;
  late Future<bool?> _isShowSplash;

  @override
  void initState() {
    super.initState();

    _token = _prefs.then((SharedPreferences prefs) {
      return prefs.getString(accessToken);
    });
    _isShowSplash = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool(showSplash);
    });
  }

  bool showSplashbool = true;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final userProvider = Provider.of<AuthProvider>(context);

    print("build");
    return Center(
        child: FutureBuilder<String?>(
            future: _token,
            builder: (context, snapshot) {
              // print('object ${userProvider.user.email}');
              print(snapshot.data);
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                default:
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    // print('object ${snapshot.data!.isEmpty}');

                    // is have token
                    return const MainScreen();
                  } else {
                    // _isShowSplash.then((value) {
                    //   showSplashbool = value ?? true;
                    //   print('splash $showSplashbool');
                    // });
                    // if (showSplashbool == true) {
                    return SplashScreen();
                    // } else {
                    //   return SignInScreen();
                    // }

                    // return const SignInScreen();

                    // return FutureBuilder<bool?>(
                    //   builder: (context, showSplash) {
                    //     if (showSplash == true) {
                    //       return SplashScreen();
                    //     } else {
                    //       return SignInScreen();
                    //     }
                    //   },
                    // );
                  }
              }
            }));
  }
}
