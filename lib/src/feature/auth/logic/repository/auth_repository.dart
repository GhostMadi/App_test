import 'package:dio/dio.dart';
import 'package:flutter_application_2/src/core/server/dio.dart';
import 'package:flutter_application_2/src/feature/auth/logic/model/user.dart';

abstract class AuthRepository {
  Future<AuthResponse> logIn({required String email, required String password});
  Future<AuthResponse> refreshToken(String refresh);
}

class AuthRepoImpl extends AuthRepository {
  Dio dio = DioSettings().dio;

  @override
  Future<AuthResponse> logIn({
    required String email,
    required String password,
  }) async {
    Response response = await dio.post(
      '/auth/token/',
      data: {
        'email': email,
        'password': password,
      },
    );
    return AuthResponse.fromJson(response.data);
  }

  @override
  Future<AuthResponse> refreshToken(String refresh) async {
    Response response =
        await dio.post('/auth/token/refresh/', data: {'refresh': refresh});
    return AuthResponse.fromJson(response.data);
  }
}
