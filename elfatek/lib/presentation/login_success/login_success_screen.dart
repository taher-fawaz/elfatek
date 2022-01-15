import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";

  const LoginSuccessScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(leading: const SizedBox(), title: Text("Hello")
          // Consumer<AuthProvider>(builder: (context, value, child) {
          //   return
          //  Text("Hello ${value.user.name}");
          // }),
          ),
      body: const Body(),
    );
  }
}
