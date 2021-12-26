import 'dart:io' show Platform;

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:elfatek/card/example.dart';
import 'package:elfatek/constants.dart';
import 'package:elfatek/controller/api_controller.dart';
import 'package:elfatek/database/services/posts_services.dart';
import 'package:elfatek/model/customer_registration.dart';
import 'package:elfatek/screens/customer_records/customer_records_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
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
  late List<Widget> widgets = [
    const HomeScreen(),
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
  Future savePressed() async {
    // if (customerRegistration) {
    //   form.save();

    //   // showResults(context, _ponyModel);
    // } else {
    //   // showErrors(context);
    //   // setState(() => autoValidateMode = AutovalidateMode.onUserInteraction);
    // }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // final GlobalKey<ExampleFormState> _formWidgetKey =
  //     GlobalKey<ExampleFormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          titles[ind],
        ),
        actions: <Widget>[
          IconButton(
            icon: Theme.of(context).brightness == Brightness.dark
                ? const Icon(Icons.brightness_7)
                : const Icon(Icons.brightness_4),
            onPressed: () {
              setState(() {
                AdaptiveTheme.of(context).toggleThemeMode();
              });
            },
          ),
          _cupertinoSwitchButton(),
          IconButton(
            icon: const Icon(
              Icons.save,
              color: Colors.white,
            ),
            onPressed: () => savePressed(),
            // (_formWidgetKey.currentState == null)
            //     ?
            // null
            // : _formWidgetKey.currentState!.savePressed,
          ),
          // IconButton(
          //   icon: Icon(
          //     Icons.refresh,
          //     color: Colors.white,
          //   ),
          //   onPressed: (_formWidgetKey.currentState == null)
          //       ? null
          //       : _formWidgetKey.currentState!.resetPressed,
          // ),
        ],
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
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
      drawer: Builder(builder: (context) {
        return ValueListenableBuilder(
            valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
            builder: (_, mode, child) {
              return MultiLevelDrawer(
                backgroundColor: mode == AdaptiveThemeMode.light
                    ? Colors.white
                    : kPrimaryLightColorDark,
                rippleColor: Colors.white,
                subMenuBackgroundColor: Colors.grey.shade100,
                header: SizedBox(
                  // width: size.width * .5,
                  height: size.height * 0.35,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/logo.png",
                        width: 200,
                        height: 200,
                      ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      Text(
                        "Elfa Demo",
                        style: Theme.of(context).textTheme.headline5,
                      )
                    ],
                  )),
                ),
                children: [
                  // Child Elements for Each Drawer Item
                  MLMenuItem(
                      leading: const Icon(Icons.person),
                      content: Text(
                        "My Account",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      onClick: () {}),
                  MLMenuItem(
                      leading: const Icon(Icons.list),
                      trailing: const Icon(Icons.arrow_right),
                      content: Text(
                        "My Records",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      onClick: () {},
                      subMenuItems: [
                        MLSubmenu(
                            onClick: () {
                              Navigator.pushNamed(
                                  context, CutomerRecordScreen.routeName);
                            },
                            submenuContent: const Text("Customer Record List")),
                        MLSubmenu(
                            onClick: () {},
                            submenuContent:
                                const Text("Customer Interview List"))
                      ]),
                  MLMenuItem(
                    leading: const Icon(Icons.settings_power_sharp),
                    content: Text(
                      "logout",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    onClick: () {},
                  ),
                ],
              );
            });
      }),
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
                  ? const FaIcon(FontAwesomeIcons.apple)
                  : const Icon(Icons.android),
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
