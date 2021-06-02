import 'package:flutter/widgets.dart' show Widget, BuildContext;
import 'package:meedu_example/app/routes/routes.dart';
import 'package:meedu_example/app/ui/pages/error/error_page.dart';
import 'package:meedu_example/app/ui/pages/home/home_page.dart';
import 'package:meedu_example/app/ui/pages/login/login_page.dart';
import 'package:meedu_example/app/ui/pages/splash/splash_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  SPLASH: (_) => SplashPage(),
  LOGIN: (_) => LoginPage(),
  HOME: (_) => HomePage(),
  ERROR: (_) => ErrorPage(),
};
