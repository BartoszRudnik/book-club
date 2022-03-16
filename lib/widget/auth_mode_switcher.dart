import 'package:book_club/utils/bubble_indicator_painter.dart';
import 'package:flutter/material.dart';

class AuthModeSwitcher extends StatelessWidget {
  const AuthModeSwitcher({
    Key? key,
    required this.pageController,
    required this.onSignInButtonPress,
    required this.onSignUpButtonPress,
    required this.left,
    required this.right,
  }) : super(key: key);

  final PageController pageController;
  final Function onSignInButtonPress;
  final Function onSignUpButtonPress;
  final Color left;
  final Color right;

  @override
  Widget build(BuildContext context) {
    return Flexible(
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
          painter: BubbleIndicatorPainter(pageController: pageController),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () => onSignInButtonPress(),
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
                  onPressed: () => onSignUpButtonPress(),
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
    );
  }
}
