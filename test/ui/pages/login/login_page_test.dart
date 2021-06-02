import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meedu_example/app/routes/routes.dart';
import 'package:meedu_example/app/ui/pages/login/login_page.dart';
import '../../../utils.dart';

void main() {
  setUp(() {
    initializeTests();
    // final authenticationRepository = MockAuthenticationRepository();
    // loginProvider.overrideProvider(
    //   (_) => LoginController(authenticationRepository),
    // );
  });

  testWidgets('LoginPage', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: LoginPage(),
        routes: {
          HOME: (_) => Text("HOME"),
        },
      ),
    );
    final controller = loginProvider.read;

    expect(controller.state.email, "");
    expect(controller.state.password, "");
    expect(controller.state.fetching, false);

    final finderEmail = find.byKey(Key('login-email'));
    final finderPassword = find.byKey(Key('login-password'));
    await tester.enterText(finderEmail, "test@test.com1");
    await tester.enterText(finderPassword, "test123");
    expect(controller.state.email, "test@test.com1");
    expect(controller.state.password, "test123");
    await tester.pump();
    await tester.tap(find.text("SEND"));
    await tester.pump();
    expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.text("ERROR"), findsOneWidget);
    await tester.tap(find.text("OK"));
    await tester.pumpAndSettle();
    expect(find.text("ERROR"), findsNothing);
    await tester.enterText(finderEmail, "eve.holt@reqres.in");
    await tester.enterText(finderPassword, "cityslicka");
    expect(controller.state.email, "eve.holt@reqres.in");
    expect(controller.state.password, "cityslicka");
    await tester.pump();
    await tester.tap(find.text("SEND"));
    await tester.pump();
    expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.text("HOME"), findsOneWidget);
  });
}
