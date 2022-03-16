import 'package:book_club/widget/app_logo.dart';
import 'package:book_club/widget/auth_mode_switcher.dart';
import 'package:book_club/widget/current_auth_mode.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();

    _pageController.dispose();
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
    );
  }

  void _onSignUpButtonPress() {
    _pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
    );
  }

  void leftBlack() {
    setState(() {
      left = Colors.black;
      right = Colors.white;
    });
  }

  void leftWhite() {
    setState(() {
      left = Colors.white;
      right = Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottomOpacity: 0,
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(
              bottom: 32,
              left: 20,
              right: 20,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Theme.of(context).primaryColorDark,
                  Theme.of(context).canvasColor,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 1.0),
                stops: const <double>[0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppLogo(),
                AuthModeSwitcher(
                  pageController: _pageController,
                  onSignInButtonPress: _onSignInButtonPress,
                  onSignUpButtonPress: _onSignUpButtonPress,
                  left: left,
                  right: right,
                ),
                CurrentAuthMode(
                  leftBlack: leftBlack,
                  leftWhite: leftWhite,
                  pageController: _pageController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
