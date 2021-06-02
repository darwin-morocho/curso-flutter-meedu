import 'package:flutter_test/flutter_test.dart';
import 'package:meedu_example/app/ui/global/controllers/session_controller.dart';
import 'package:meedu_example/app/ui/pages/splash/splash_controller.dart';

import '../../../utils.dart';

void main() {
  setUp(() {
    initializeTests();
  });
  test('SplashController', () {
    final controller = SplashController(SessionController());
    expect(controller.routeName, isNull);
    controller.stream.listen(
      expectAsync1((_) {
        expect(controller.routeName, isNotNull);
      }, count: 1),
    );
  });
}
