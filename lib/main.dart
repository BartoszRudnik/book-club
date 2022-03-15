import 'package:book_club/screen/auth_screen.dart';
import 'package:book_club/utils/my_theme.dart';
import 'package:book_club/utils/routes.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Club',
      theme: MyTheme().buildTheme(),
      debugShowCheckedModeBanner: false,
      home: const AuthScreen(),
      routes: Routes.routes,
    );
  }
}
