import 'package:book_club/provider/club_provider.dart';
import 'package:book_club/screen/club_screen.dart';
import 'package:book_club/screen/no_club_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numberOfClubs = Provider.of<ClubProvider>(context).userClubsNumber;

    return numberOfClubs == 0 ? const NoClubScreen() : const ClubScreen();
  }
}
