import 'package:flutter_meedu/meedu.dart';
import 'package:meedu_example/app/domain/repositories/account_repository.dart';
import 'package:meedu_example/app/domain/repositories/authentication_repository.dart';
import 'package:meedu_example/app/routes/routes.dart';
import 'package:meedu_example/app/ui/global/controllers/session_controller.dart';

class SplashController extends SimpleNotifier {
  SplashController(this._sessionController) {
    _init();
  }

  final SessionController _sessionController;

  final _authenticationRepository = Get.i.find<AuthenticationRepository>();
  final _accountRepository = Get.i.find<AccountRepository>();

  String? _routeName;
  String? get routeName => _routeName;

  Future<void> _init() async {
    final isLogged = (await _authenticationRepository.accessToken) != null;

    if (isLogged) {
      final user = await _accountRepository.getUserInfo();
      _routeName = user == null ? ERROR : HOME;
      if (user != null) {
        _sessionController.setUser(user);
      }
    } else {
      _routeName = LOGIN;
    }

    notify();
  }
}
