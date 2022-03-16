import 'package:book_club/provider/auth_provider.dart';
import 'package:book_club/utils/bubble_indicator_painter.dart';
import 'package:book_club/utils/const_values.dart';
import 'package:book_club/widget/login_form.dart';
import 'package:book_club/widget/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );
  }

  void _onSignUpButtonPress() {
    _pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(bottom: 32, left: 20, right: 20),
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
                Flexible(
                  flex: 4,
                  child: Image.asset(
                    ConstValues.logo,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50.0,
                    decoration: const BoxDecoration(
                      color: Color(0x552B2B2B),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                    child: CustomPaint(
                      painter: BubbleIndicatorPainter(pageController: _pageController),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: TextButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(Colors.transparent),
                              ),
                              onPressed: () => _onSignInButtonPress(),
                              child: Text(
                                'Existing',
                                style: Theme.of(context).textTheme.headline2!.copyWith(color: left),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(Colors.transparent),
                              ),
                              onPressed: () => _onSignUpButtonPress(),
                              child: Text(
                                'New',
                                style: Theme.of(context).textTheme.headline2!.copyWith(color: right),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    onPageChanged: (int i) {
                      Provider.of<AuthProvider>(context, listen: false).clearError();

                      FocusScope.of(context).requestFocus(FocusNode());
                      if (i == 0) {
                        setState(() {
                          right = Colors.white;
                          left = Colors.black;
                        });
                      } else if (i == 1) {
                        setState(() {
                          right = Colors.black;
                          left = Colors.white;
                        });
                      }
                    },
                    controller: _pageController,
                    children: const [
                      LoginForm(),
                      SignUpForm(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
