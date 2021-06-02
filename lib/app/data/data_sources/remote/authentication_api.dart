import 'package:dio/dio.dart';

class AuthenticationAPI {
  final Dio _dio;
  AuthenticationAPI(this._dio);

  Future<String?> login(String email, String password) async {
    try {
      final response = await _dio.post('/api/login', data: {
        'email': email,
        'password': password,
      });
      return response.data['token'];
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }
}
