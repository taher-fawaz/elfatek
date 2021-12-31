import 'package:elfatek/screens/auth/auth_screen.dart';
import 'package:elfatek/screens/profile/profile_screen.dart';

import 'screens/customer_records/customer_records_screen.dart';

import 'screens/customer_interview/customer_interview_screen.dart';
import 'screens/customer_registration/customer_registration.dart';
import 'screens/main_screen/main_screen.dart';

import 'screens/forgot_password/forgot_password_screen.dart';
import 'screens/login_success/login_success_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';

import 'screens/home/home_screen.dart';
import 'screens/sign_in/sign_in_screen.dart';

import 'screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CustomerRegistrationScreen.routeName: (context) =>
      CustomerRegistrationScreen(),
  MainScreen.routeName: (context) => const MainScreen(),
  AuthScreen.routeName: (context) => const AuthScreen(),
  ProfilePage.routeName: (context) => ProfilePage(),

  // CustomerInterviewScreen.routeName: (context) =>
  //     const CustomerInterviewScreen(),

  // CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  // OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  CutomerRecordScreen.routeName: (context) => CutomerRecordScreen(),
  // CartScreen.routeName: (context) => CartScreen(),
  // ProfileScreen.routeName: (context) => ProfileScreen(),
};
