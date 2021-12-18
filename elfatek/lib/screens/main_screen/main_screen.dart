import 'dart:io' show Platform;

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:elfatek/card/example.dart';
import 'package:elfatek/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../customer_interview/customer_interview_screen.dart';
import '../customer_registration/customer_registration.dart';
import '../home/home_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/Main";

  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> widgets = const [
    HomeScreen(),
    CustomerRegistrationScreen(),
    // CustomerInterviewScreen()
  ];
  final List titles = [
    "Home",
    "Customer Registration",
    "Customer Interview",
  ];
  final PageController pageController = PageController();
  int ind = 0;
  bool _showMaterialonIOS = true;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ExampleFormState> _formWidgetKey =
      GlobalKey<ExampleFormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(titles[ind]),
        actions: <Widget>[
          IconButton(
            icon: Theme.of(context).brightness == Brightness.dark
                ? Icon(Icons.brightness_7)
                : Icon(Icons.brightness_4),
            onPressed: () {
              setState(() {
                AdaptiveTheme.of(context).toggleThemeMode();
              });
            },
          ),
          _cupertinoSwitchButton(),
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.white,
            ),
            onPressed: (_formWidgetKey.currentState == null)
                ? null
                : _formWidgetKey.currentState!.savePressed,
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.refresh,
            color: Colors.white,
          ),
          onPressed: (_formWidgetKey.currentState == null)
              ? null
              : _formWidgetKey.currentState!.resetPressed,
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? kPrimaryColorDark
            : Colors.white,
        color: Theme.of(context).brightness == Brightness.dark
            ? kPrimaryLightColorDark
            : kPrimaryColorLight,
        items: const <Widget>[
          Icon(Icons.home_outlined, size: 30),
          Icon(Icons.app_registration_outlined, size: 30),
          Icon(Icons.favorite_outline, size: 30),
        ],
        index: ind,
        // letIndexChange: (value) => print("object ${value}"),
        onTap: (i) {
          // print("object $i");
          pageController.jumpToPage(i);

          setState(() {
            ind = i;
          });
        },
      ),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widgets.length,
        itemBuilder: (context, i) {
          return widgets[i];
        },
        controller: pageController,
      ),
    );
  }

  Widget _cupertinoSwitchButton() {
    // dont show this button on web
    if (kIsWeb) return Container();

    return Container(
      child: Platform.isIOS
          ? IconButton(
              icon: (_showMaterialonIOS)
                  ? FaIcon(FontAwesomeIcons.apple)
                  : Icon(Icons.android),
              onPressed: () {
                setState(() {
                  _showMaterialonIOS = !_showMaterialonIOS;
                });
              },
            )
          : null,
    );
  }
}
