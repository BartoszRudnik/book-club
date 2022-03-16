import 'package:book_club/provider/auth_provider.dart';
import 'package:book_club/widget/login_form.dart';
import 'package:book_club/widget/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentAuthMode extends StatelessWidget {
  const CurrentAuthMode({
    Key? key,
    required this.leftBlack,
    required this.leftWhite,
    required this.pageController,
  }) : super(key: key);

  final Function leftBlack;
  final Function leftWhite;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: PageView(
        physics: const ClampingScrollPhysics(),
        onPageChanged: (int i) {
          Provider.of<AuthProvider>(context, listen: false).clearError();

          FocusScope.of(context).requestFocus(FocusNode());
          if (i == 0) {
            leftBlack();
          } else if (i == 1) {
            leftWhite();
          }
        },
        controller: pageController,
        children: const [
          LoginForm(),
          SignUpForm(),
        ],
      ),
    );
  }
}
