import 'dart:convert';

import 'package:elfatek/app/api/base_api.dart';
import 'package:elfatek/features/auth/domain/repositories/auth_repository.dart';

import '../models/user.dart';
import 'package:http/http.dart' as http;

class AuthService extends BaseAPI {
  final AuthRepository authRepository = AuthRepository();

  Future<http.Response> signUp(User user) async {
    http.Response response = await authRepository.post(
      url: super.register,
      headers: super.headers,
      user: user,
    );

    return response;
  }

  Future<http.Response> loginService(User user) async {
    http.Response response = await authRepository.post(
      url: 'http://192.168.1.9/elfatek/public/api/login',
      //super.loginPath,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Connection': 'keep-alive'
      },
      //super.headers,
      user: user,
    );

    print('auth service ${response.statusCode}');

    print('auth service');

    return response;
  }

  Future<http.Response> logout(User user) async {
    http.Response response = await authRepository.post(
      url: super.logoutPath,
      headers: super.headersToken(user.token!)!,
      user: user,
    );

    return response;
  }

  Future<http.Response> getUserByToken(String token) async {
    http.Response response = await authRepository.get(
      url: super.getUser,
      headers: super.headersToken(token)!,
    );

    return response;
  }
}
