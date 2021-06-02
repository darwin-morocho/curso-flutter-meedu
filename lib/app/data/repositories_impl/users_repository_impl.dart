import 'package:meedu_example/app/data/data_sources/remote/users_api.dart';
import 'package:meedu_example/app/domain/repositories/users_repository.dart';
import 'package:meedu_example/app/domain/responses/users_response.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersAPI _api;

  UsersRepositoryImpl(this._api);
  @override
  Future<UsersResponse?> getUsersPerPage(int page) {
    return _api.getUsersPerPage(page);
  }
}
