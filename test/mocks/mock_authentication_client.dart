import 'package:meedu_example/app/data/data_sources/local/authentication_client.dart';

class MockAuthenticationClient implements AuthenticationClient {
  final _storage = <String, String>{};

  @override
  Future<String?> get accessToken async {
    return _storage[TOKEN];
  }

  @override
  Future<void> setSession(String token) async {
    _storage[TOKEN] = token;
  }

  @override
  Future<void> clear() {
    // TODO: implement clear
    throw UnimplementedError();
  }
}
