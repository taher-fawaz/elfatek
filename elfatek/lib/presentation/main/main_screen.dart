import 'dart:io' show Platform;

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:elfatek/features/auth/domain/services/auth_service.dart';
import 'package:elfatek/features/auth/providers/auth_provider.dart';
import 'package:elfatek/features/auth/providers/user_provider.dart';
import '../resources/routes_manager.dart';
import '../customer_interview/customer_interview_screen.dart';
import '../customer_registration/customer_registration.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/size_config.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
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
    CustomerInterviewScreen()
  ];
  final List titles = [
    AppStrings.home,
    AppStrings.customerRegistration,
    AppStrings.customerInterview,
  ];
  final PageController pageController = PageController();
  int ind = 0;
  bool _showMaterialonIOS = true;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: true);
    final userProvider = Provider.of<UserProvider>(context, listen: true);

    // final userProvider = Provider.of<AuthProvider>(context);
    // final user = Provider.of<AuthProvider>(context);
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
            ? ColorManager.primary
            : ColorManager.white,
        color: ColorManager.primary,
        items: <Widget>[
          Icon(Icons.home_outlined,
              size: size.height * .04, color: ColorManager.white),
          Icon(Icons.app_registration_outlined,
              size: size.height * .04, color: ColorManager.white),
          Icon(Icons.favorite_outline,
              size: size.height * .04, color: ColorManager.white),
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
                backgroundColor:
                    //  mode == AdaptiveThemeMode.light
                    //     ?
                    Colors.white,
                // : kPrimaryLightColorDark,
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
                        ImageAssets.splashLogo,
                        width: getProportionateScreenWidth(AppSize.s200),
                        height: getProportionateScreenHeight(AppSize.s200),
                      ),
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
                        AppStrings.account,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      onClick: () {
                        Navigator.pushNamed(context, Routes.profileRoute);
                      }),
                  MLMenuItem(
                      leading: const Icon(Icons.list),
                      trailing: const Icon(Icons.arrow_right),
                      content: Text(
                        AppStrings.records,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      onClick: () {},
                      subMenuItems: [
                        MLSubmenu(
                            onClick: () {
                              Navigator.pushNamed(
                                  context, Routes.customerRecordRoute);
                            },
                            submenuContent: const Text(AppStrings.recordList)),
                        MLSubmenu(
                            onClick: () {},
                            submenuContent:
                                const Text(AppStrings.interviewList))
                      ]),
                  MLMenuItem(
                    leading: const Icon(Icons.settings_power_sharp),
                    content: Text(
                      AppStrings.logout,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    onClick: () async {
                      authProvider.logout(userProvider.user).then((value) =>
                          Navigator.pushReplacementNamed(
                              context, Routes.loginRoute));
                    },
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
