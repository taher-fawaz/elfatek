import 'dart:convert';

import 'package:elfatek/model/user.dart';
import 'package:elfatek/services/api/auth_api.dart';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  late final User _user;
  User get user => _user;
  Future login(User userModel) async {
    AuthAPI().login(userModel).then((http.Response value) {
      final hre = jsonDecode(value.body);
      _user = User.fromReqBody(value.body);

      print(_user.email);
    });

    notifyListeners();
  }
}
