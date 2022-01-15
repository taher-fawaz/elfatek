import '../../resources/color_manager.dart';
import '../../resources/size_config.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Text(
          "ELFATEK",
          style: getBoldStyle(
            color: ColorManager.primary,
            fontSize: getProportionateScreenWidth(AppSize.s40),
          ),
        ),
        Text(
          text!,
          textAlign: TextAlign.center,
        ),
        const Spacer(flex: 2),
        SvgPicture.asset(
          image!,
          height: getProportionateScreenHeight(AppSize.s265),
          width: getProportionateScreenWidth(AppSize.s235),
        ),
      ],
    );
  }
}
