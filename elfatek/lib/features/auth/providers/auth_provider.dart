import 'dart:convert';

import 'package:elfatek/app/app_prefs.dart';
import 'package:elfatek/core/widget/alert_dialog.dart';
import 'package:elfatek/features/auth/providers/user_provider.dart';
import 'package:elfatek/helper/failure.dart';
import 'package:elfatek/presentation/resources/assets_manager.dart';
import 'package:elfatek/presentation/resources/font_manager.dart';
import 'package:elfatek/presentation/resources/size_config.dart';
import 'package:elfatek/presentation/resources/styles_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../domain/services/auth_service.dart';
import '../domain/models/user.dart';
import '../screens/sign_in_screen.dart';
import '../../../presentation/resources/routes_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

enum Status {
  NotLoggedIn,
  LoggedIn,
  Authenticating,
  Registering,
  LoggedOut,
  Error
}

class AuthProvider with ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;

  Status get loggedInStatus => _loggedInStatus;

  Failure? _failure;
  Failure get failure => _failure!;
  final UserProvider userProvider = UserProvider();
  final AuthService authService = AuthService();

  Future signUp(User userModel) async {
    authService.signUp(userModel).then((http.Response response) {
      // _user = User.fromReqBody(response.body);
      notifyListeners();
    });
  }

  Future<void> login({required User userModel}) async {
    _loggedInStatus = Status.Authenticating;
    http.Response response = await authService.loginService(userModel);

    if (response.statusCode == 200) {
      userProvider.userNotifier(response.body);
      _loggedInStatus = Status.LoggedIn;
      notifyListeners();
    } else {
      _failure = failureFromJson(response.body);
      _loggedInStatus = Status.Error;
      notifyListeners();
    }
  }

  backToLogin() {
    _loggedInStatus = Status.NotLoggedIn;

    notifyListeners();
  }

  Future logout(User user) async {
    backToLogin();
    print('object $loggedInStatus');
    await authService.logout(user).then((http.Response response) {
      userProvider.logoutUser(response.body);
      // // Navigator.pushReplacementNamed(context, Routes.loginRoute);
    });

    notifyListeners();
  }
}
