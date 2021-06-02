import 'package:meedu_example/app/domain/responses/users_response.dart';

abstract class UsersRepository {
  Future<UsersResponse?> getUsersPerPage(int page);
}
