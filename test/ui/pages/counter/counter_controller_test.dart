import 'package:flutter_test/flutter_test.dart';
import 'package:meedu_example/app/ui/pages/counter/controller/counter_controller.dart';

void main() {
  test('CounterController', () {
    final controller = CounterController();
    expect(controller.disposed, false);
    expect(controller.counter, 0);
    controller.stream.listen(
      expectAsync1(
        (_) {},
        count: 3,
      ),
    );

    controller.increment();
    controller.increment();
    controller.increment();
    expect(controller.counter, 3);
    controller.dispose();
    expect(controller.disposed, true);
  });
}
