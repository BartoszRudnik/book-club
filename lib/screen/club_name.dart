import 'package:book_club/utils/const_values.dart';
import 'package:book_club/utils/my_theme.dart';
import 'package:book_club/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClubName extends StatelessWidget {
  const ClubName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
            size: 32,
          ),
        ),
        title: Text(
          "Create a club",
          style: Theme.of(context).textTheme.headline2!.copyWith(
                color: Colors.white,
              ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
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
              Expanded(
                flex: 7,
                child: Column(
                  children: [
                    Flexible(
                      flex: 9,
                      child: SvgPicture.asset(
                        ConstValues.clubName,
                      ),
                    ),
                    const Spacer(),
                    Flexible(
                      flex: 3,
                      child: Text(
                        "We also need a club name",
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              color: Colors.black,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 3,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    decoration: MyTheme().loginFormFieldDecoration(
                      context,
                      "Club name",
                      Icons.book_outlined,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Flexible(
                flex: 3,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                    style: MyTheme().disabledButtonStyle(context),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        Routes.createClub,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "I Like This Name",
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
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
