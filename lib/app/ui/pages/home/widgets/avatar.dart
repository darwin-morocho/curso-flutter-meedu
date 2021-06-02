import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'package:meedu_example/app/ui/global/controllers/session_controller.dart';

class UserAvatar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final user = watch(sessionProvider).user!;
    return CupertinoButton(
      onPressed: () {},
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundImage: NetworkImage(user.avatar),
      ),
    );
  }
}
