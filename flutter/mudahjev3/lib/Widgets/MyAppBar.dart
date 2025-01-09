import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mudahjev3/Screen/LoginScreen.dart';
import 'package:mudahjev3/Utils/constant.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool backButton;

  MyAppBar({required this.title, required this.backButton});

  @override
  Widget build(BuildContext context) {

// Logout Functionality
    void _performLogout() async {
      // Add your logout logic here (e.g., FirebaseAuth sign out)
      await FirebaseAuth.instance.signOut();

      // Navigate to login screen
      Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
    }
    void logout() {
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Optional Animated Image/Icon
                SizedBox(
                  height: 100,
                  child: Icon(
                    Icons.logout,
                    size: 60,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'Are you sure you want to log out? Your session will end.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        foregroundColor: Colors.black,
                      ),
                      child: const Text('CANCEL'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the bottom sheet
                        _performLogout(); // Call the logout function
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text('LOG OUT',style: TextStyle(color: Colors.white ),),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }


    return AppBar(
      title: Text(title),
      actions: [
        GestureDetector(
          onTap: logout,
          child: Container(
              margin: EdgeInsets.only(right: 12),
              child: Icon(
                Icons.settings,
                color: Colors.white,
              )),
        )
      ],
      automaticallyImplyLeading: backButton,
      backgroundColor: const Color(kMainColor),
      leading: backButton
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.white, // Customize icon color
                size: 30,
              ))
          : null,
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Required
}
