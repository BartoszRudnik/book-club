import 'package:book_club/utils/const_values.dart';
import 'package:book_club/widget/appbar/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoClubScreen extends StatelessWidget {
  const NoClubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const HomeAppBar(),
      body: Container(
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
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Lottie.asset(ConstValues.bookLottie),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Welcome to Book Club",
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Since you are not in a club, you can can select either to club or creaate a new one!",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Create",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(
                          Size(
                            MediaQuery.of(context).size.width * 0.7,
                            50,
                          ),
                        ),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 0.45,
                  ),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Join",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(
                          Size(
                            MediaQuery.of(context).size.width * 0.7,
                            50,
                          ),
                        ),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 0.45,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
