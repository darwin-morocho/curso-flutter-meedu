import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:meedu_example/app/data/data_sources/local/authentication_client.dart';
import 'package:meedu_example/app/data/repositories_impl/account_repository_impl.dart';
import 'package:meedu_example/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:meedu_example/app/data/repositories_impl/users_repository_impl.dart';
import 'package:meedu_example/app/domain/repositories/account_repository.dart';
import 'package:meedu_example/app/domain/repositories/authentication_repository.dart';
import 'package:meedu_example/app/domain/repositories/users_repository.dart';
import 'package:meedu_example/app/domain/responses/users_response.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mock_account_api.dart';
import 'mocks/mock_authentication_api.dart';
import 'mocks/mock_authentication_client.dart';
import 'mocks/mock_secure_storage.dart';
import 'mocks/mock_users_api.dart';

void initializeTests() {
  Get.i.clear();
  ProviderScope.clear();

  Get.i.lazyPut<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      MockAuthenticationAPI(),
      AuthenticationClient(MockSecureStorage()),
    ),
  );

  Get.i.lazyPut<AccountRepository>(
    () => AccountRepositoryImpl(MockAccountAPI()),
  );

  final usersAPI = MockUsersAPI();
  Get.i.put<MockUsersAPI>(usersAPI);
  when(() => usersAPI.getUsersPerPage(1)).thenAnswer(
    (_) async {
      await Future.delayed(
        Duration(milliseconds: 100),
      );
      return UsersResponse.fromJson(usersMockResponse);
    },
  );

  Get.i.lazyPut<UsersRepository>(
    () => UsersRepositoryImpl(
      usersAPI,
    ),
  );
}
