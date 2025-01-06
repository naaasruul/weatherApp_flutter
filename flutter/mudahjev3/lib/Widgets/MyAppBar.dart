import 'package:flutter/material.dart';
import 'package:mudahjev3/Utils/constant.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool backButton;

  MyAppBar({required this.title, required this.backButton});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      automaticallyImplyLeading: backButton,
      backgroundColor: Color(kMainColor),
      leading: backButton
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                  Icons.chevron_left,
                color: Colors.white, // Customize icon color
                size: 30,
              ))
          : null,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // Required
}
