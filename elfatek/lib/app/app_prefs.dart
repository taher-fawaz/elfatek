import '../presentation/resources/language_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_ONBOARDING_SCREEN = "PREFS_KEY_ONBOARDING_SCREEN";
const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";
const String PREFS_KEY_TOKEN = "PREFS_KEY_TOKEN";

class AppPreferences {
  static AppPreferences? _instance;

  AppPreferences._();

  static AppPreferences get instance => _instance ??= AppPreferences._();
  final Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();

  Future<String> getAppLanguage() async {
    String? language = await _sharedPreferences
        .then((prefs) => prefs.getString(PREFS_KEY_LANG));

    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<void> setLanguageChanged() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.ARABIC.getValue()) {
      // save prefs with english lang
      _sharedPreferences.then((prefs) =>
          prefs.setString(PREFS_KEY_LANG, LanguageType.ENGLISH.getValue()));
    } else {
      // save prefs with arabic lang
      _sharedPreferences.then((prefs) =>
          prefs.setString(PREFS_KEY_LANG, LanguageType.ARABIC.getValue()));
    }
  }

  Future<Locale> getLocal() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.ARABIC.getValue()) {
      // return arabic local
      return ARABIC_LOCAL;
    } else {
      // return english local
      return ENGLISH_LOCAL;
    }
  }

  Future<void> setOnBoardingScreenViewed() async {
    await _sharedPreferences
        .then((prefs) => prefs.setBool(PREFS_KEY_ONBOARDING_SCREEN, true));
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return await _sharedPreferences
        .then((prefs) => prefs.getBool(PREFS_KEY_ONBOARDING_SCREEN) ?? false);
  }

  Future<void> setUserToken(String token) async {
    await _sharedPreferences
        .then((prefs) => prefs.setString(PREFS_KEY_TOKEN, token));
  }

  Future<String> getUserToken() async {
    return await _sharedPreferences
        .then((prefs) => prefs.getString(PREFS_KEY_TOKEN) ?? "");
  }

  Future<void> setIsUserLoggedIn() async {
    await _sharedPreferences
        .then((prefs) => prefs.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true));
  }

  Future<bool> isUserLoggedIn() async {
    return await _sharedPreferences
        .then((prefs) => prefs.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false);
  }

  Future<void> logout() async {
    await _sharedPreferences
        .then((prefs) => prefs.remove(PREFS_KEY_IS_USER_LOGGED_IN));
  }
}
