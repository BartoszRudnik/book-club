import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  final googleSignIn = GoogleSignIn();

  Future<Map<String, dynamic>> login() async {
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;

    final firstName = googleUser.displayName!.split(" ")[0];
    final lastName = googleUser.displayName!.split(" ")[1];

    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": googleUser.email,
      "accessToken": googleAuth.accessToken,
      "idToken": googleAuth.idToken,
    };
  }

  Future logout() => googleSignIn.disconnect();
}
