import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/rx.dart';

class RxPage extends StatefulWidget {
  @override
  _RxPageState createState() => _RxPageState();
}

class _RxPageState extends State<RxPage> {
  final _counter = 0.obs;
  final _user = Rx<_User?>(null);

  final _list = Rx<List<int>>([]);

  List<int> get list => _list.value;

  @override
  void dispose() {
    _counter.close();
    _user.close();
    _list.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RxBuilder(
          (_) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${_counter.value}",
                style: TextStyle(fontSize: 20),
              ),
              if (_user.value != null)
                Text(
                  "${_user.value!.name}, ${_user.value!.age}",
                  style: TextStyle(fontSize: 15),
                ),
            ],
          ),
        ),
      ),
      body: RxBuilder(
        (_) => ListView.builder(
          itemBuilder: (_, index) => ListTile(
            title: Text("$index"),
          ),
          itemCount: list.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_user.value == null) {
            _user.value = _User(name: "Darwin", age: 20);
          } else {
            _user.value = _user.value!.copyWith(age: 20 + _counter.value);
          }

          _counter.value++;
          final copyList = [...list];
          copyList.add(copyList.length + 1);
          _list.value = copyList;
        },
      ),
    );
  }
}

class _User {
  final String name;
  final int age;

  _User({
    required this.name,
    required this.age,
  });

  _User copyWith({String? name, int? age}) {
    return _User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }
}
