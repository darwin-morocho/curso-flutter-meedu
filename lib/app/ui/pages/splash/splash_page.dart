import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/state.dart';
import 'package:meedu_example/app/ui/global/controllers/session_controller.dart';
import 'splash_controller.dart';

final splashProvider = SimpleProvider(
  (_) => SplashController(sessionProvider.read),
);

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener(
      provider: splashProvider,
      onChange: (_, SplashController controller) {
        if (controller.routeName != null) {
          Navigator.pushReplacementNamed(context, controller.routeName!);
        }
      },
      builder: (_, __) => Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
