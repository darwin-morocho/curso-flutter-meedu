import 'package:dio/dio.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meedu_example/app/data/data_sources/local/authentication_client.dart';
import 'package:meedu_example/app/data/data_sources/remote/account_api.dart';
import 'package:meedu_example/app/data/data_sources/remote/authentication_api.dart';
import 'package:meedu_example/app/data/data_sources/remote/users_api.dart';
import 'package:meedu_example/app/data/repositories_impl/account_repository_impl.dart';
import 'package:meedu_example/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:meedu_example/app/data/repositories_impl/users_repository_impl.dart';
import 'package:meedu_example/app/domain/repositories/account_repository.dart';
import 'package:meedu_example/app/domain/repositories/authentication_repository.dart';
import 'package:meedu_example/app/domain/repositories/users_repository.dart';

void injectDependencies() {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://reqres.in'),
  );
  final authClient = AuthenticationClient(FlutterSecureStorage());
  Get.i.lazyPut<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      AuthenticationAPI(dio),
      authClient,
    ),
  );

  Get.i.lazyPut<AccountRepository>(
    () => AccountRepositoryImpl(
      AccountAPI(dio, authClient),
    ),
  );

  Get.i.lazyPut<UsersRepository>(
    () => UsersRepositoryImpl(
      UsersAPI(dio),
    ),
  );
}
