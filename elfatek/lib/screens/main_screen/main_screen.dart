import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../constants.dart';
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
    CustomerInterviewScreen()
  ];
  final List titles = [
    "Home",
    "Customer Registration",
    "Customer Interview",
  ];
  final PageController pageController = PageController();
  int ind = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titles[ind])),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: kPrimaryColor,
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
}
