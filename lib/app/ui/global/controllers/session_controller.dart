import 'package:flutter_meedu/meedu.dart';
import 'package:meedu_example/app/domain/entities/user.dart';
import 'package:meedu_example/app/domain/repositories/authentication_repository.dart';

class SessionController extends SimpleNotifier {
  User? _user;
  User? get user => _user;

  final _authenticationRepository = Get.i.find<AuthenticationRepository>();

  void setUser(User user) {
    _user = user;
    notify();
  }

  Future<void> logOut() async {
    _user = null;
    await _authenticationRepository.logOut();
  }
}

final sessionProvider = SimpleProvider(
  (_) => SessionController(),
  autoDispose: false,
);
