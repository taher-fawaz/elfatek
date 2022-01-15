import 'dart:convert';

import 'package:elfatek/constants.dart';
import 'package:elfatek/model/user.dart';
import 'package:elfatek/screens/sign_in/sign_in_screen.dart';
import 'package:elfatek/services/api/auth_api.dart';

import 'package:flutter/cupertino.dart';
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

  Future login(User userModel) async {
    _authAPI.login(userModel).then((http.Response response) {
      _user = User.fromReqBody(response.body);
      saveToken(_user.token!);

      print('login ${_user.email}');
      print('login ${_user.token}');
      notifyListeners();
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
    await prefs.setString(accessToken, token);
  }

  Future<bool> isSignOut() async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    _isloggedOut = _prefs.then((SharedPreferences prefs) {
      return prefs.getString(accessToken) == '' ? true : false;
    });
    return _isloggedOut;
  }
}
