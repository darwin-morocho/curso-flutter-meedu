import 'package:meedu_example/app/domain/entities/user.dart';

abstract class AccountRepository {
  Future<User?> getUserInfo();
}
