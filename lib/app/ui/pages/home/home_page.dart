import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/state.dart';
import 'package:meedu_example/app/routes/routes.dart';
import 'package:meedu_example/app/ui/global/controllers/session_controller.dart';
import 'controller/home_state.dart';
import 'controller/home_controller.dart';
import 'widgets/avatar.dart';

final homeProvider = StateProvider<HomeController, HomeState>(
  (_) => HomeController(),
);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: UserAvatar(),
        actions: [
          IconButton(
            key: Key('log-out-button'),
            onPressed: () => _logOut(context),
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Consumer(
        builder: (context, watch, child) {
          final controller = watch(homeProvider);
          final state = controller.state;
          if (state.loading) return child!;

          return RefreshIndicator(
            child: LayoutBuilder(
              builder: (_, constraints) {
                if (state.pages == -1) {
                  return ListView(
                    children: [
                      Container(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                        child: Center(
                          child: Text("Error"),
                        ),
                      )
                    ],
                  );
                }

                return ListView.builder(
                  itemBuilder: (_, index) {
                    final user = state.users[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                      title: Text(user.firstName),
                      subtitle: Text(user.email),
                    );
                  },
                  itemCount: state.users.length,
                );
              },
            ),
            onRefresh: controller.onRefresh,
          );
        },
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }

  Future<void> _logOut(BuildContext context) async {
    await sessionProvider.read.logOut();
    Navigator.pushNamedAndRemoveUntil(
      context,
      LOGIN,
      (_) => false,
    );
  }
}
