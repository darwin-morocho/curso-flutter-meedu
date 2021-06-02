import 'package:meedu_example/app/data/data_sources/local/authentication_client.dart';
import 'package:meedu_example/app/data/data_sources/remote/authentication_api.dart';
import 'package:meedu_example/app/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationAPI _api;
  final AuthenticationClient _client;
  AuthenticationRepositoryImpl(this._api, this._client);
  @override
  Future<String?> login(String email, String password) async {
    return _api.login(email, password);
  }

  @override
  Future<String?> get accessToken => _client.accessToken;

  @override
  Future<void> setSession(String token) {
    return _client.setSession(token);
  }

  @override
  Future<void> logOut() {
    return _client.clear();
  }
}
