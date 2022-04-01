import 'package:book_club/screen/auth_screen.dart';
import 'package:book_club/screen/add_book_screen.dart';
import 'package:book_club/screen/book_due_screen.dart';
import 'package:book_club/screen/club_name.dart';
import 'package:book_club/screen/create_club_screen.dart';
import 'package:book_club/screen/no_club_screen.dart';
import 'package:book_club/screen/reset_password_screen.dart';
import 'package:book_club/widget/sign_up_form.dart';

class Routes {
  static const String signUpForm = "/signUpForm";
  static const String resetPasswordScreen = "/resetPasswordScreen";
  static const String authScreen = "/authScreen";
  static const String noClub = "/noGroup";
  static const String addClub = "/addClub";
  static const String bookDue = "/bookDue";
  static const String clubName = "/clubName";
  static const String createClub = "/createClub";

  static final routes = {
    createClub: (ctx) => const CreateClubScreen(),
    clubName: (ctx) => const ClubName(),
    bookDue: (ctx) => const BookDueScreen(),
    addClub: (ctx) => const AddBookScreen(),
    resetPasswordScreen: (ctx) => const ResetPasswordScreen(),
    signUpForm: (ctx) => const SignUpForm(),
    authScreen: (ctx) => const AuthScreen(),
    noClub: (ctx) => const NoClubScreen(),
  };
}
