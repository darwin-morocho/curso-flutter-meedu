import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:meedu_example/app/ui/pages/counter/controller/counter_controller.dart';
import 'package:meedu_example/app/ui/pages/counter/counter_page.dart';

import '../../../utils.dart';

void main() {
  setUp(() {
    initializeTests();
    counterProviderWithTag.overrideTagProvider((ref) => CounterController(20));
  });

  testWidgets('counterPage - list ', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CounterPage(),
      ),
    );
    expect(find.text("20"), findsWidgets);
    await tester.tap(find.text("20").first);
    await tester.pump();
    expect(find.text("21"), findsWidgets);
    final ScrollableState scrollableState = tester.state(find.byType(Scrollable));
    final maxOffset = scrollableState.position.maxScrollExtent;
    scrollableState.position.jumpTo(maxOffset);
    await tester.pump();
    expect(find.text("21"), findsNothing);
    scrollableState.position.jumpTo(0);
    await tester.pump();
    expect(find.text("21"), findsWidgets);
    await tester.tap(find.text("21"));
    await tester.pump();
    expect(find.text("22"), findsWidgets);
  });

  // testWidgets(
  //   'CounterPage',
  //   (tester) async {
  //     await tester.pumpWidget(
  //       MaterialApp(
  //         navigatorObservers: [
  //           router.observer,
  //         ],
  //         home: Scaffold(
  //           body: Center(
  //             child: Builder(
  //               builder: (context) => ElevatedButton(
  //                 child: Text("GO COUNTER"),
  //                 onPressed: () {
  //                   final route = MaterialPageRoute(
  //                     builder: (_) => CounterPage(),
  //                   );
  //                   Navigator.push(context, route);
  //                 },
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     );

  //     expect(find.text("0"), findsNothing);
  //     await tester.tap(find.text("GO COUNTER"));
  //     await tester.pumpAndSettle();
  //     expect(find.text("0"), findsOneWidget);
  //     await tester.tap(find.byType(FloatingActionButton));
  //     await tester.pump();
  //     expect(find.text("0"), findsOneWidget);
  //     await tester.tap(find.byType(FloatingActionButton));
  //     await tester.pump();
  //     expect(find.text("2"), findsOneWidget);
  //     await tester.tap(find.byType(FloatingActionButton));
  //     await tester.pump();
  //     expect(find.text("3"), findsOneWidget);
  //     await tester.pageBack();
  //     await tester.pumpAndSettle();
  //     expect(find.text("3"), findsNothing);
  //     await tester.tap(find.text("GO COUNTER"));
  //     await tester.pumpAndSettle();
  //     expect(find.text("0"), findsOneWidget);
  //     await tester.tap(find.byType(FloatingActionButton));
  //     await tester.pump();
  //     expect(find.text("0"), findsOneWidget);
  //     await tester.tap(find.byType(FloatingActionButton));
  //     await tester.pump();
  //     expect(find.text("2"), findsOneWidget);
  //   },
  // );

  // testWidgets('CounterPage 2', (tester) async {
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       navigatorObservers: [
  //         router.observer,
  //       ],
  //       home: CounterPage(),
  //     ),
  //   );
  //   expect(find.text("0"), findsOneWidget);
  //   await tester.tap(find.byType(FloatingActionButton));
  //   await tester.pump();
  //   expect(find.text("0"), findsOneWidget);
  //   await tester.tap(find.byType(FloatingActionButton));
  //   await tester.pump();
  //   expect(find.text("2"), findsOneWidget);
  // });
}
