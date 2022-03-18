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
  final PageController _pageController = PageController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        bottomOpacity: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Scrollbar(
        isAlwaysShown: true,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: MediaQuery.of(context).size.height * 1.1,
            width: MediaQuery.of(context).size.width,
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
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppLogo(),
                  AuthModeSwitcher(
                    pageController: _pageController,
                    onSignInButtonPress: _onSignInButtonPress,
                    onSignUpButtonPress: _onSignUpButtonPress,
                  ),
                  CurrentAuthMode(
                    pageController: _pageController,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
