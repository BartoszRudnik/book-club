import 'package:book_club/model/club.dart';
import 'package:flutter/material.dart';

class ClubProvider with ChangeNotifier {
  List<Club> clubs;

  ClubProvider({
    required this.clubs,
  });

  int get userClubsNumber => clubs.length;
}
