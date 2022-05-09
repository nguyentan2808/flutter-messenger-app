import 'package:dio/dio.dart';

class API {
  static var dio = Dio(BaseOptions(baseUrl: 'http://192.168.1.5:5000/api/'));

  Future login(String idToken) async {
    var response = await dio.post('/auth/login', data: {'idToken': idToken});
    print(response);

    return response;
  }
}
