import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:meedu_example/app/domain/repositories/authentication_repository.dart';
import 'package:meedu_example/app/routes/routes.dart';
import 'package:meedu_example/app/ui/global/controllers/session_controller.dart';
import 'package:meedu_example/app/ui/pages/home/home_page.dart';
import 'package:meedu_example/app/ui/pages/home/widgets/avatar.dart';
import 'package:meedu_example/app/ui/pages/splash/splash_page.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import '../../../utils.dart';

void main() {
  setUp(() {
    initializeTests();
  });

  testWidgets('SplashPage - login', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        navigatorObservers: [
          router.observer,
        ],
        initialRoute: SPLASH,
        routes: {
          SPLASH: (_) => SplashPage(),
          LOGIN: (_) => Center(
                child: Text("LOGIN"),
              ),
          HOME: (_) => Center(
                child: Text("HOME"),
              ),
        },
      ),
    );
    splashProvider.read.stream.listen(
      expectAsync1((_) {}, count: 1),
    );
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.text("LOGIN"), findsOneWidget);
  });

  testWidgets('SplashPage - home', (tester) async {
    Get.i.find<AuthenticationRepository>().setSession("lalaslaskaskaska");
    await mockNetworkImages(() async {
      await tester.pumpWidget(
        MaterialApp(
          navigatorObservers: [
            router.observer,
          ],
          initialRoute: SPLASH,
          routes: {
            SPLASH: (_) => SplashPage(),
            LOGIN: (_) => Center(
                  child: Text("LOGIN"),
                ),
            HOME: (_) => HomePage(),
          },
        ),
      );

      splashProvider.read.stream.listen(
        expectAsync1((_) {}, count: 1),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.byType(UserAvatar), findsOneWidget);
      expect(sessionProvider.read.user, isNotNull);
      await tester.tap(find.byKey(Key('log-out-button')));
      await tester.pumpAndSettle();
      expect(find.byType(UserAvatar), findsNothing);
      expect(sessionProvider.read.user, isNull);
      expect(find.text("LOGIN"), findsOneWidget);
    });
  });
}
