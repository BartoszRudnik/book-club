import 'package:book_club/widget/sign_up_form.dart';

class Routes {
  static const String signUpForm = "/signUpForm";

  static final routes = {
    signUpForm: (ctx) => const SignUpForm(),
  };
}
