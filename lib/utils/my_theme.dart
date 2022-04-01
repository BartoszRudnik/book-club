import 'package:flutter/material.dart';

class MyTheme {
  final Color _darkerGrey = Colors.black;

  ThemeData buildTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      canvasColor: Colors.white,
      primaryColor: Colors.black,
      primaryColorDark: _darkerGrey,
      colorScheme: const ColorScheme.dark().copyWith(secondary: _darkerGrey),
      textTheme: textTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
          ),
          onPrimary: Colors.white,
          primary: _darkerGrey,
        ),
      ),
    );
  }

  TextTheme textTheme() {
    return TextTheme(
      headline1: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: _darkerGrey,
      ),
      headline2: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      headline3: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: _darkerGrey,
      ),
    );
  }

  InputDecoration loginFormFieldDecoration(BuildContext context, String labelText, IconData iconData) {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColorDark, width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColorDark, width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColorDark, width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      errorStyle: const TextStyle(
        height: 0,
        color: Colors.transparent,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      labelText: labelText,
      labelStyle: TextStyle(color: _darkerGrey),
      prefixIcon: Icon(
        iconData,
        color: _darkerGrey,
      ),
    );
  }
}
