import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String TOKEN = "token";

class AuthenticationClient {
  final FlutterSecureStorage _storage;
  AuthenticationClient(this._storage);

  Future<String?> get accessToken {
    return _storage.read(key: TOKEN);
  }

  Future<void> setSession(String token) {
    return _storage.write(key: TOKEN, value: token);
  }

  Future<void> clear() {
    return _storage.deleteAll();
  }
}
