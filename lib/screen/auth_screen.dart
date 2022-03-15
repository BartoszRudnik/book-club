import 'package:book_club/utils/const_values.dart';
import 'package:book_club/widget/login_form.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: Image.asset(
                  ConstValues.logo,
                ),
              ),
              const Flexible(
                flex: 5,
                child: LoginForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
