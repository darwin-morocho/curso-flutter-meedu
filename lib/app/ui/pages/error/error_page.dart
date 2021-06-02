import 'package:flutter/material.dart';
import 'package:meedu_example/app/routes/routes.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Error"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, LOGIN);
              },
              child: Text("LOGIN AGAIN"),
            ),
          ],
        ),
      ),
    );
  }
}
