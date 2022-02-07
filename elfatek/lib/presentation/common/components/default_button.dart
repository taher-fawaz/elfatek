import 'package:elfatek/features/auth/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../resources/color_manager.dart';
import '../../resources/size_config.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: getProportionateScreenHeight(56),
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(getProportionateScreenWidth(20))),
            primary: ColorManager.white,
            backgroundColor: ColorManager.primary,
          ),
          onPressed: press as void Function(),
          child: Text(
            text!,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: Colors.white,
            ),
          ),
        ));
  }
}
