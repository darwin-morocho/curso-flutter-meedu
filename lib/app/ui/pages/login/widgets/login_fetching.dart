import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import '../login_page.dart';

class LoginFetching extends ConsumerWidget {
  @override
  Widget build(_, ScopedReader watch) {
    final state = watch(
      loginProvider.select((_) => _.fetching),
    ).state;

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 200),
      child: state.fetching
          ? Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    color: Colors.white54,
                    alignment: Alignment.center,
                    child: CupertinoActivityIndicator(radius: 15),
                  ),
                ),
              ],
            )
          : Container(),
    );
  }
}
