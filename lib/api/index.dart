import 'package:dio/dio.dart';

class API {
  static var dio = Dio(
      BaseOptions(baseUrl: 'https://tdt-flutter-server.up.railway.app/api/'));

  Future login(String idToken) async {
    try {
      var response =
          await dio.post('/auth/login/google', data: {'idToken': idToken});

      return response;
    } catch (error) {
      throw ("Server error");
    }
  }

  Future signUp({
    required String username,
    required String password,
    required String name,
    required String email,
    required String phone,
    required String birthday,
  }) async {
    var response = await dio.post('/auth/signup', data: {
      'username': username,
      'password': password,
      'name': name,
      'email': email,
      'phone': phone,
      'birthday': birthday,
    });

    return response;
  }
}
