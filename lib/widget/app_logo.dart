import 'package:book_club/utils/const_values.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 4,
      child: Image.asset(
        ConstValues.logo,
      ),
    );
  }
}
