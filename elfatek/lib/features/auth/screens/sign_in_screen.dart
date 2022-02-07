import '../../../presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:elfatek/features/auth/screens/components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.signIn,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
      ),
      body: const Body(),
    );
  }
}
