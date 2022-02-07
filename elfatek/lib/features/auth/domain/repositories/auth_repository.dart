import 'dart:convert';

import 'package:elfatek/app/app_prefs.dart';
import 'package:elfatek/domain/controller/services/api/base_api.dart';
import 'package:elfatek/features/auth/domain/models/user.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final AppPreferences _appPreferences = AppPreferences.instance;

  Future<http.Response> post(
      {required String url,
      required Map<String, String> headers,
      required User user}) async {
    http.Response response = await http.post(Uri.parse(url),
        headers: headers, body: userToJson(user));
    print('auth repo ${response.statusCode}');
    print('auth provider ${jsonDecode(response.body)}');

    // if (response.statusCode == 200) {
    //   print('auth repo');
    return response;
    // } else {
    //   throw Exception(
    //       'there is problem with status code ${response.statusCode}');
    // }
  }

  Future<http.Response> get({
    required String url,
    required Map<String, String> headers,
  }) async {
    http.Response response = await http.get(Uri.parse(url), headers: headers);

    return response;
  }
}
