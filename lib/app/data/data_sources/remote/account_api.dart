import 'package:dio/dio.dart';
import 'package:meedu_example/app/data/data_sources/local/authentication_client.dart';
import 'package:meedu_example/app/domain/entities/user.dart';

class AccountAPI {
  final Dio _dio;
  final AuthenticationClient _client;
  AccountAPI(this._dio, this._client);

  Future<User?> getUserInfo() async {
    try {
      if (await _client.accessToken == null) {
        throw Exception('access denied');
      }
      final response = await _dio.get('/api/users/1');
      return User.fromJson(response.data['data']);
    } catch (e) {
      return null;
    }
  }
}
