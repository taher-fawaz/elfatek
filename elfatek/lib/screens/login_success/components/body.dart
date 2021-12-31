import 'package:elfatek/controller/provider/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../main_screen/main_screen.dart';

import '../../../utils/components/default_button.dart';
import '../../../size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Consumer<AuthProvider>(
          builder: (context, user, child) {
            return Text(
              "Welcome Back ${user.user.name!.toUpperCase()}",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(30),
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            );
          },
        ),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Back to home",
            press: () {
              Navigator.pushReplacementNamed(context, MainScreen.routeName);
            },
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
