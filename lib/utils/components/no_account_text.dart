import 'package:elfatek/screens/sign_in/sign_in_screen.dart';

import '../../screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

import '../../constants.dart';

class NoAccountText extends StatelessWidget {
  final bool? isSignUp;
  const NoAccountText({Key? key, this.isSignUp = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          !isSignUp! ? "Don’t have an account? " : "Do You have an account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context,
              !isSignUp! ? SignUpScreen.routeName : SignInScreen.routeName),
          child: Text(
            !isSignUp! ? "Sign Up" : "Sign In",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: Colors.indigo[400]!),
          ),
        ),
      ],
    );
  }
}
