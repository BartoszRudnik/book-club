import 'package:book_club/provider/auth_provider.dart';
import 'package:book_club/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          onPressed: () async {
            await Provider.of<AuthProvider>(context, listen: false).logout();
          },
          icon: const Icon(
            Icons.logout_outlined,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.noClub);
          },
          icon: const Icon(
            Icons.abc,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
