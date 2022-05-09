import 'package:dio/dio.dart';

class API {
  static var dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:5000/api/'));

  Future login(String idToken) async {
    var response = await dio.post('/auth/login', data: {'idToken': idToken});

    return response;
  }
}
