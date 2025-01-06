import 'package:flutter/material.dart';
import 'package:mudahjev3/Screen/ExerciseScreen.dart';
import 'package:mudahjev3/Screen/NoteScreen.dart';
import 'package:mudahjev3/Screen/SearchScreen.dart';
import 'package:mudahjev3/Widgets/MyAppBar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:mudahjev3/Utils/constant.dart';
class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _isSelected = 0;

  // List of pages to navigate to
  final List<Widget> _pages = [
    NoteScreen(),
    SearchScreen(),
    ExerciseScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Home Page',backButton: false,),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(kMainColor),
        items: <Widget>[
          Icon(Icons.book_rounded, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.bolt, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _isSelected = index;
          });
        },
      ),
      body: _pages[_isSelected],
    );
  }
}
