import 'package:meedu_example/app/data/data_sources/remote/authentication_api.dart';

class MockAuthenticationAPI implements AuthenticationAPI {
  @override
  Future<String?> login(String email, String password) async {
    await Future.delayed(Duration(milliseconds: 100));
    if (email == "eve.holt@reqres.in" && password == "cityslicka") {
      return "assahashhas";
    }
    return null;
  }
}
