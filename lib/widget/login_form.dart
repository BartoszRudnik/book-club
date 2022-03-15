import 'package:book_club/utils/my_theme.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 2,
                child: Text(
                  "Log In",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 3,
                      child: TextFormField(
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
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 2,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "Log In",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "Don't have an account?",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          Flexible(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Sign up here",
                                style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
