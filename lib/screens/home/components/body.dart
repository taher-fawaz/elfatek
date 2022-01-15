import '../../../size_config.dart';

import '../../../utils/components/toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/cupertino.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: getProportionateScreenHeight(80),
                    // width: getProportionateScreenWidth(400),
                    fit: BoxFit.fitHeight,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("Select Your Language"),
                      ToggleSwitch(
                        initialLabelIndex: 0,
                        totalSwitches: 2,
                        labels: const ['Turkey', 'English'],
                        onToggle: (index) {
                          if (index == 0) {
                            context.setLocale(const Locale("tr"));
                          } else {
                            context.setLocale(const Locale("en"));
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
