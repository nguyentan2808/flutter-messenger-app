import 'package:dio/dio.dart';

class API {
  static var dio = Dio(BaseOptions(
      baseUrl: 'http://10.0.2.2:5000/api/', connectTimeout: 1000 * 5));

  Future googleLogin(String idToken) async {
    try {
      var response =
          await dio.post('/auth/login/google', data: {'idToken': idToken});

      return response;
    } catch (error) {
      throw ("Some thing went wrong!");
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
    try {
      var response = await dio.post('/auth/signup', data: {
        'username': username,
        'password': password,
        'name': name,
        'email': email,
        'phone': phone,
        'birthday': birthday,
      });
      return response;
    } catch (error) {
      if (error is DioError) {
        throw (error.response?.data['message'] ?? "Some thing went wrong!");
      }
      throw "Some thing went wrong!";
    }
  }

  Future localLogin({
    required String username,
    required String password,
  }) async {
    try {
      var response = await dio.post('/auth/login/local', data: {
        'username': username,
        'password': password,
      });
      return response;
    } catch (error) {
      if (error is DioError) {
        throw (error.response?.data['message'] ?? "Some thing went wrong!");
      }
      // throw "Some thing went wrong!";
    }
  }
}
