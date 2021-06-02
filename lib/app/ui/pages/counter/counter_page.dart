import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/state.dart';
import 'controller/counter_controller.dart';

// final counterProvider = SimpleProvider(
//   (_) => CounterController(),
// );

final counterProviderWithTag = SimpleProvider.withTag(
  (ref) => CounterController(),
);

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return Consumer(
            builder: (context, watch, child) {
              final controller = watch(counterProviderWithTag.find('tag-$index'));

              return ListTile(
                contentPadding: EdgeInsets.all(20),
                title: Text(
                  "${controller.counter}",
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  controller.increment();
                },
              );
            },
          );
        },
        itemCount: 200,
      ),
    );
  }
}
