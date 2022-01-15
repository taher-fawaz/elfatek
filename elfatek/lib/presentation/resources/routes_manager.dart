import 'package:elfatek/presentation/customer_records/customer_records_screen.dart';
import 'package:elfatek/presentation/profile/profile_screen.dart';

import '../customer_interview/customer_interview_screen.dart';
import '../customer_registration/customer_registration.dart';
import '../forgot_password/forgot_password_screen.dart';
import '../login/sign_in_screen.dart';
import '../login_success/login_success_screen.dart';
import '../main/main_screen.dart';

import '../../app/di.dart';
import '../onboarding/onboarding_screen.dart';
import 'strings_manager.dart';
import '../splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String loginSuccessRoute = "/loginSuccess";
  static const String customerRegistrationRoute = "/customerRegistration";
  static const String customerInterviewRoute = "/customerInterview";
  static const String profileRoute = "/profileRoute";
  static const String cutomerRecordRoute = "/cutomerRecordRoute";

  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.loginRoute:
        // initLoginModule();
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case Routes.forgotPasswordRoute:
        // initForgotPasswordModule();
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case Routes.mainRoute:
        // initHomeModule();
        return MaterialPageRoute(builder: (_) => MainScreen());
      case Routes.loginSuccessRoute:
        // initHomeModule();
        return MaterialPageRoute(builder: (_) => LoginSuccessScreen());
      case Routes.customerRegistrationRoute:
        // initHomeModule();
        return MaterialPageRoute(builder: (_) => CustomerRegistrationScreen());
      case Routes.customerInterviewRoute:
        // initHomeModule();
        return MaterialPageRoute(builder: (_) => CustomerInterviewScreen());
      case Routes.profileRoute:
        // initHomeModule();
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case Routes.cutomerRecordRoute:
        // initHomeModule();
        return MaterialPageRoute(builder: (_) => CutomerRecordScreen());

      // case Routes.storeDetailsRoute:
      //   initStoreDetailsModule();
      //   return MaterialPageRoute(builder: (_) => StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.noRouteFound).tr(),
              ),
              body: Center(child: Text(AppStrings.noRouteFound).tr()),
            ));
  }
}
