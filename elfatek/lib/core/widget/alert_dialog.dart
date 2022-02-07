import 'package:elfatek/presentation/resources/assets_manager.dart';
import 'package:elfatek/presentation/resources/font_manager.dart';
import 'package:elfatek/presentation/resources/size_config.dart';
import 'package:elfatek/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AlertDialog alertDialog(BuildContext context, String error) {
  return AlertDialog(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))),
    title: Text(
      "Error Occured",
      style: getMediumStyle(color: Colors.black, fontSize: FontSize.s18),
      textAlign: TextAlign.center,
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset(
          IconAssets.error,
          width: getProportionateScreenWidth(100),
          height: getProportionateScreenHeight(100),
        ),
        SizedBox(
          height: getProportionateScreenHeight(40),
        ),
        Text(
          error,
          style: getMediumStyle(color: Colors.black, fontSize: FontSize.s18)
              .copyWith(letterSpacing: 1),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    actions: [
      TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Try Again')),
    ],
  );
}
