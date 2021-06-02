import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meedu_example/app/ui/global/controllers/session_controller.dart';
import 'package:meedu_example/app/ui/pages/home/home_page.dart';
import 'package:meedu_example/app/ui/pages/home/widgets/avatar.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../mocks/mock_account_api.dart';
import '../../../mocks/mock_users_api.dart';
import '../../../utils.dart';

void main() {
  setUp(() {
    initializeTests();
  });

  testWidgets('home page - ok users', (tester) async {
    sessionProvider.read.setUser(mockUser);
    await mockNetworkImages(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(),
        ),
      );
      expect(find.byType(UserAvatar), findsOneWidget);
      expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.byType(CupertinoActivityIndicator), findsNothing);
      expect(find.byType(ListTile), findsWidgets);
    });
  });

  testWidgets('home page - error users', (tester) async {
    sessionProvider.read.setUser(mockUser);
    when(() => Get.i.find<MockUsersAPI>().getUsersPerPage(1)).thenAnswer((_) async {
      await Future.delayed(Duration(milliseconds: 100));
      return null;
    });
    await mockNetworkImages(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(CupertinoActivityIndicator), findsNothing);
      expect(find.byType(ListTile), findsNothing);
      expect(find.text("Error"), findsOneWidget);
    });
  });
}
