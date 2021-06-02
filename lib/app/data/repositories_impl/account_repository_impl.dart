import 'package:meedu_example/app/data/data_sources/remote/account_api.dart';
import 'package:meedu_example/app/domain/entities/user.dart';
import 'package:meedu_example/app/domain/repositories/account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountAPI _api;

  AccountRepositoryImpl(this._api);
  @override
  Future<User?> getUserInfo() {
    return _api.getUserInfo();
  }
}
