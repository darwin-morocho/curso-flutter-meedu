import 'package:flutter/widgets.dart' show GlobalKey, FormState;
import 'package:flutter_meedu/meedu.dart';
import 'package:meedu_example/app/domain/repositories/account_repository.dart';
import 'package:meedu_example/app/domain/repositories/authentication_repository.dart';
import 'package:meedu_example/app/ui/global/controllers/session_controller.dart';
import 'login_state.dart';

class LoginController extends StateNotifier<LoginState> {
  final _authenticationRepository = Get.i.find<AuthenticationRepository>();
  final _accountRepository = Get.i.find<AccountRepository>();
  final GlobalKey<FormState> formKey = GlobalKey();
  final SessionController _sessionController;

  LoginController(this._sessionController) : super(LoginState.initialState);

  void onEmailChanged(String text) {
    state = state.copyWith(email: text);
  }

  void onPasswordChanged(String text) {
    state = state.copyWith(password: text);
  }

  Future<bool> submit() async {
    state = state.copyWith(fetching: true);
    final token = await _authenticationRepository.login(state.email, state.password);
    state = state.copyWith(fetching: false);
    if (token != null) {
      await _authenticationRepository.setSession(token);
      final user = await _accountRepository.getUserInfo();
      if (user != null) {
        _sessionController.setUser(user);
        return true;
      }
    }
    return false;
  }
}
