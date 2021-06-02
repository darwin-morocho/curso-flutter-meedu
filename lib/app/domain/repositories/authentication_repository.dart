abstract class AuthenticationRepository {
  Future<String?> get accessToken;
  Future<void> setSession(String token);
  Future<String?> login(String email, String password);
  Future<void> logOut();
}
