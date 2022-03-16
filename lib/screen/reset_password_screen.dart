import 'package:book_club/model/notifier_state.dart';
import 'package:book_club/provider/auth_provider.dart';
import 'package:book_club/utils/const_values.dart';
import 'package:book_club/utils/my_theme.dart';
import 'package:book_club/widget/button/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<AuthProvider>(context, listen: false).clearError();

        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: Theme.of(context).primaryColorDark,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                bottom: 32,
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Theme.of(context).primaryColorDark,
                    Theme.of(context).canvasColor,
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 1.0),
                  stops: const <double>[0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 8,
                    child: Image.asset(
                      ConstValues.resetPasswordLogo,
                    ),
                  ),
                  const Spacer(),
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Enter your email adress below to reset password",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Flexible(
                    flex: 8,
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
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 32),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              flex: 2,
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
                              flex: 4,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Consumer<AuthProvider>(
                                  builder: (_, authProvider, __) => authProvider.notifierState == NotifierState.loading
                                      ? Center(
                                          child: CircularProgressIndicator(
                                            backgroundColor: Theme.of(context).primaryColorDark,
                                          ),
                                        )
                                      : Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            authProvider.authResult.fold(
                                              (failure) => Padding(
                                                padding: const EdgeInsets.all(8),
                                                child: Text(
                                                  failure.message,
                                                  style: Theme.of(context).textTheme.headline3!.copyWith(
                                                        color: Colors.red,
                                                      ),
                                                ),
                                              ),
                                              (r) => Container(),
                                            ),
                                            AuthButton(
                                              title: "Reset Password",
                                              onTap: () async {
                                                await authProvider.resetPassword(emailController.text);
                                              },
                                            ),
                                          ],
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
