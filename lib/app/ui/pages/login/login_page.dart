import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:meedu_example/app/routes/routes.dart';
import 'package:meedu_example/app/ui/global/controllers/session_controller.dart';

import 'package:meedu_example/app/ui/pages/login/controller/login_state.dart';
import 'package:meedu_example/app/ui/pages/login/widgets/login_fetching.dart';
import 'controller/login_controller.dart';

final loginProvider = StateProvider<LoginController, LoginState>(
  (_) => LoginController(sessionProvider.read),
);

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(15),
          child: Stack(
            children: [
              Form(
                key: loginProvider.read.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextFormField(
                      key: Key('login-email'),
                      onChanged: loginProvider.read.onEmailChanged,
                      decoration: InputDecoration(
                        labelText: "Email",
                      ),
                      validator: (text) {
                        if (text!.contains("@")) {
                          return null;
                        }
                        return "Invalid email";
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      key: Key('login-password'),
                      obscureText: true,
                      onChanged: loginProvider.read.onPasswordChanged,
                      decoration: InputDecoration(
                        labelText: "Password",
                      ),
                      validator: (text) {
                        if (text!.trim().length >= 5) {
                          return null;
                        }
                        return "Invalid password";
                      },
                    ),
                    SizedBox(height: 30),
                    CupertinoButton(
                      child: Text("SEND"),
                      color: Colors.blue,
                      onPressed: () => _submit(context),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
              LoginFetching(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit(BuildContext context) async {
    final controller = loginProvider.read;
    final isOk = controller.formKey.currentState!.validate();
    if (isOk) {
      final isLogged = await controller.submit();
      if (isLogged) {
        Navigator.pushReplacementNamed(context, HOME);
      } else {
        showCupertinoDialog(
          context: context,
          builder: (_) => CupertinoAlertDialog(
            title: Text("ERROR"),
            actions: [
              CupertinoDialogAction(
                child: Text("OK"),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        );
      }
    }
  }
}
