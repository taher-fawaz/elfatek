import 'package:elfatek/domain/controller/services/api/base_api.dart';
import 'package:elfatek/domain/model/user.dart';
import 'package:http/http.dart' as http;

class AuthAPI extends BaseAPI {
  Future<http.Response> signUp(User user) async {
    var body = userToJson(user);
    http.Response response = await http.post(Uri.parse(super.register),
        headers: super.headers, body: body);
    return response;
  }

  Future<http.Response> login(User user) async {
    http.Response response = await http.post(Uri.parse(super.loginPath),
        headers: super.headers, body: userToJson(user));

    return response;
  }

  Future<http.Response> logout(User user) async {
    http.Response response = await http.post(Uri.parse(super.logoutPath),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Connection': 'keep-alive',
          "Authorization": "Bearer ${user.token}",
        },
        body: userToJson(user));
// ?token=
    return response;
  }
}
