import 'package:book_club/model/failure.dart';
import 'package:book_club/provider/auth_provider.dart';
import 'package:book_club/screen/auth_screen.dart';
import 'package:book_club/screen/home_screen.dart';
import 'package:book_club/utils/my_theme.dart';
import 'package:book_club/utils/routes.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuthProvider(
            authResult: left(
              Failure(message: ""),
            ),
            firebaseAuth: FirebaseAuth.instance,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Book Club',
        theme: MyTheme().buildTheme(),
        debugShowCheckedModeBanner: false,
        home: Provider.of<AuthProvider>(context).isAuth ? const HomeScreen() : const AuthScreen(),
        routes: Routes.routes,
      ),
    );
  }
}
