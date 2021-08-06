import 'package:flutter_meedu/meedu.dart';

class CounterController extends SimpleNotifier {
  CounterController([int? initialCounter]) {
    _counter = initialCounter ?? 0;
  }

  late int _counter;
  int get counter => _counter;

  void increment() {
    _counter++;
    notify();
  }

  @override
  void dispose() {
    print("onDispose CounterController");
    super.dispose();
  }
}
