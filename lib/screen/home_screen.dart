import 'package:book_club/widget/appbar/home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      appBar: HomeAppBar(),
      body: SafeArea(
        child: Center(
          child: Text("Home"),
        ),
      ),
    );
  }
}
