import 'package:elfatek/app/app_prefs.dart';
import 'package:elfatek/features/auth/domain/models/user.dart';
import 'package:elfatek/features/auth/domain/services/auth_service.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  User get user => _user!;
  final AppPreferences _appPreferences = AppPreferences.instance;
  userNotifier(String body) {
    _user = User.fromReqBody(body);
    _appPreferences.setUserToken(_user!.token!);
    _appPreferences.setIsUserLoggedIn(true);
    notifyListeners();
  }

  Future getUser() async {
    final String token = await _appPreferences.getUserToken();
    AuthService().getUserByToken(token).then((response) {
      if (response.statusCode == 200) {
        _user = User.fromReqBody(response.body);
        notifyListeners();
      }
    });
  }

  void logoutUser(String body) {
    _user = User.fromReqBodyToken(body);
    _appPreferences.setIsUserLoggedIn(false);

    _appPreferences.logout();
  }
}
