import 'package:book_club/utils/const_values.dart';
import 'package:book_club/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddBookScreen extends StatelessWidget {
  const AddBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.close_outlined,
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
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Spacer(),
              Expanded(
                flex: 7,
                child: Column(
                  children: [
                    Flexible(
                      flex: 4,
                      child: SvgPicture.asset(
                        ConstValues.addBook,
                      ),
                    ),
                    const Spacer(),
                    Flexible(
                      flex: 2,
                      child: Center(
                        child: Text(
                          "To create a club we first need a book",
                          style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Flexible(
                flex: 3,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        Routes.bookDue,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Add Book",
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
