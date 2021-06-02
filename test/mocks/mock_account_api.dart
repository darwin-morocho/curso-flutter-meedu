import 'package:meedu_example/app/data/data_sources/remote/account_api.dart';
import 'package:meedu_example/app/domain/entities/user.dart';

class MockAccountAPI implements AccountAPI {
  @override
  Future<User?> getUserInfo() async {
    return mockUser;
  }
}

const mockUser = User(
  id: 123,
  email: "test@test.com",
  firstName: "Darwin",
  lastName: "Morocho",
  avatar: "https://reqres.in/img/faces/12-image.jpg",
);
