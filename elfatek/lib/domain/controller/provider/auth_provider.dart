import 'dart:convert';

import '../services/api/auth_api.dart';
import '../../model/user.dart';
import '../../../presentation/login/sign_in_screen.dart';
import '../../../presentation/resources/routes_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  late var _user;
  User get user => _user;

  late Future<bool> _isloggedOut;
  Future<bool> get isloggedOut => _isloggedOut;

  final AuthAPI _authAPI = AuthAPI();

  Future signUp(User userModel) async {
    _authAPI.signUp(userModel).then((http.Response response) {
      _user = User.fromReqBody(response.body);
      saveToken(_user.token!);
      notifyListeners();
    });
  }

  Future login({required User userModel, required BuildContext context}) async {
    _authAPI.login(userModel).then((http.Response response) {
      if (response.statusCode == 200) {
        _user = User.fromReqBody(response.body);
        saveToken(_user.token!);
        notifyListeners();
        Navigator.pushReplacementNamed(context, Routes.loginSuccessRoute);
        // print('object 1 $_user');
        // print('login ${_user.email}');
        // print('login ${_user.token}');
      } else {
        final alret = AlertDialog(
          title: const Text("Error Occured"),
          content: Text(response.reasonPhrase!),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Ok')),
          ],
        );
        showDialog(
          context: context,
          builder: (context) => alret,
        );
        notifyListeners();
      }
    });
  }

  Future logout(User user, context) async {
    _authAPI.logout(user).then((http.Response response) {
      _user = User.fromReqBodyToken(response.body);
      saveToken(_user.token!);
      _user = null;
      isSignOut();

      Navigator.pushReplacementNamed(context, SignInScreen.routeName);
      notifyListeners();
    });
  }

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppStrings.accessToken, token);
  }

  Future<bool> isSignOut() async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    _isloggedOut = _prefs.then((SharedPreferences prefs) {
      return prefs.getString(AppStrings.accessToken) == '' ? true : false;
    });
    return _isloggedOut;
  }
}
