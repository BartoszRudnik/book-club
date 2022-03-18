import 'package:book_club/utils/routes.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.authScreen);
          },
          child: const Text(
            "Start",
          ),
        ),
      ),
    );
  }
}
