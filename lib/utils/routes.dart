import 'package:book_club/screen/auth_screen.dart';
import 'package:book_club/screen/reset_password_screen.dart';
import 'package:book_club/widget/sign_up_form.dart';

class Routes {
  static const String signUpForm = "/signUpForm";
  static const String resetPasswordScreen = "/resetPasswordScreen";
  static const String authScreen = "/authScreen";

  static final routes = {
    resetPasswordScreen: (ctx) => const ResetPasswordScreen(),
    signUpForm: (ctx) => const SignUpForm(),
    authScreen: (ctx) => const AuthScreen(),
  };
}
