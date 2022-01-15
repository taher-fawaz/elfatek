import '../../common/components/default_button.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';

import '../../resources/color_manager.dart';
import '../../resources/size_config.dart';
import '../../resources/values_manager.dart';
import 'package:flutter/material.dart';
// This is the best practice
import 'onboarding_content.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> onboardingData = [
    {
      "text": "Welcome to ElFatek, Let’s shop!",
      "image": "assets/images/sp1.svg"
    },
    {
      "text": "produces all electronic parts,\nsoftware and mechanical parts",
      "image": "assets/images/sp2.svg"
    },
    {
      "text": "We export to 121 countries on this road, ",
      "image": "assets/images/sp3.svg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) => OnBoardingContent(
                  image: onboardingData[index]["image"],
                  text: onboardingData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(AppSize.s20)),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onboardingData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    const Spacer(flex: 3),
                    DefaultButton(
                      text: AppStrings.continueText,
                      press: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.loginRoute);
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: DurationConstant.d200),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index
            ? ColorManager.primary
            : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
