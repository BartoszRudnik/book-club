import 'package:book_club/utils/const_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateClubScreen extends StatelessWidget {
  const CreateClubScreen({Key? key}) : super(key: key);

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
            color: Colors.black,
            size: 32,
          ),
        ),
        title: Text(
          "Create a Club",
          style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 8,
                child: Column(
                  children: [
                    Flexible(
                      flex: 8,
                      child: SvgPicture.asset(
                        ConstValues.done,
                      ),
                    ),
                    const Spacer(),
                    Flexible(
                      flex: 3,
                      child: Text(
                        "Is this looking good?",
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        "You club is called: ",
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              color: Colors.grey[700],
                            ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        "Your first book will be: ",
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              color: Colors.grey[700],
                            ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        "The book is due: ",
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              color: Colors.grey[700],
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Flexible(
                flex: 3,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Looking Great!",
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
