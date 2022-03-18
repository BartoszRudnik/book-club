import 'package:book_club/model/notifier_state.dart';
import 'package:book_club/provider/auth_provider.dart';
import 'package:book_club/utils/my_theme.dart';
import 'package:book_club/utils/routes.dart';
import 'package:book_club/widget/button/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Flexible(
            flex: 11,
            child: Card(
              color: Colors.white,
              elevation: 10,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    20,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            flex: 3,
                            child: TextFormField(
                              controller: emailController,
                              decoration: MyTheme().loginFormFieldDecoration(context, "Email", Icons.email_outlined),
                              style: Theme.of(context).textTheme.headline3!.copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                          ),
                          const Spacer(),
                          Flexible(
                            flex: 3,
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: MyTheme().loginFormFieldDecoration(context, "Password", Icons.lock_outlined),
                              style: Theme.of(context).textTheme.headline3!.copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: Consumer<AuthProvider>(
                        builder: (_, authProvider, __) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: authProvider.notifierState == NotifierState.loading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      authProvider.authResult.fold(
                                        (failure) => Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: failure.message.isEmpty
                                              ? Container()
                                              : Text(
                                                  failure.message,
                                                  style: Theme.of(context).textTheme.headline3!.copyWith(
                                                        color: Colors.red,
                                                      ),
                                                ),
                                        ),
                                        (r) => Container(),
                                      ),
                                      AuthButton(
                                        title: "LOGIN",
                                        onTap: () async {
                                          await authProvider.signInUserWithEmail(emailController.text, passwordController.text);
                                        },
                                      ),
                                    ],
                                  ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.resetPasswordScreen);
                },
                child: Text(
                  'Forgot Password?',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: <Color>[
                            Colors.white10,
                            Colors.white,
                          ],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(1.0, 1.0),
                          stops: <double>[0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    width: 100.0,
                    height: 1.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Text(
                      'Or',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: <Color>[
                            Colors.white,
                            Colors.white10,
                          ],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(1.0, 1.0),
                          stops: <double>[0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    width: 100.0,
                    height: 1.0,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Consumer<AuthProvider>(
            builder: (_, authProvider, __) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 40.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        FontAwesomeIcons.facebookF,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: GestureDetector(
                    onTap: () async {
                      await authProvider.signInWithGoogle();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        FontAwesomeIcons.google,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
