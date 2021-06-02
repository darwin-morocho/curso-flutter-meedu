import 'package:dio/dio.dart';
import 'package:meedu_example/app/domain/responses/users_response.dart';

class UsersAPI {
  final Dio _dio;
  UsersAPI(this._dio);

  Future<UsersResponse?> getUsersPerPage(int page) async {
    try {
      final response = await _dio.get('/api/users', queryParameters: {
        'page': page,
      });
      return UsersResponse.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}
