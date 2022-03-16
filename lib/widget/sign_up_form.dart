import 'package:book_club/model/notifier_state.dart';
import 'package:book_club/provider/auth_provider.dart';
import 'package:book_club/utils/my_theme.dart';
import 'package:book_club/widget/button/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();

    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 3,
                      child: TextFormField(
                        controller: fullNameController,
                        decoration: MyTheme().loginFormFieldDecoration(context, "Full Name", Icons.person_outlined),
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                              color: Colors.black,
                            ),
                      ),
                    ),
                    const Spacer(),
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
                    const Spacer(),
                    Flexible(
                      flex: 3,
                      child: TextFormField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: MyTheme().loginFormFieldDecoration(context, "Confirm Password", Icons.lock_outlined),
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                              color: Colors.black,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Flexible(
                flex: 2,
                child: Consumer<AuthProvider>(
                  builder: (_, authProvider, __) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        flex: 2,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: authProvider.notifierState == NotifierState.loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                )
                              : Column(
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
                                      title: "SIGN UP",
                                      onTap: () async {
                                        await authProvider.signUpUser(
                                          emailController.text,
                                          passwordController.text,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ],
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
