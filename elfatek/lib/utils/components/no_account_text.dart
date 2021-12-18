import 'package:elfatek/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';

import 'package:elfatek/size_config.dart';

import 'package:elfatek/constants.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () =>
              Navigator.pushReplacementNamed(context, SignUpScreen.routeName),
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: Colors.indigo[400]!),
          ),
        ),
      ],
    );
  }
}
