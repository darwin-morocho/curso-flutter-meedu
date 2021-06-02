import 'package:flutter/material.dart';
import 'package:meedu_example/app/routes/pages.dart';
import 'package:meedu_example/app/routes/routes.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:meedu_example/dependency_injection.dart';

void main() {
  injectDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [
        router.observer,
      ],
      initialRoute: SPLASH,
      routes: appRoutes,
    );
  }
}
