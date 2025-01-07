import 'package:flutter/material.dart';
import 'package:mudahjev3/Utils/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ProfileCard extends StatelessWidget {
  final User? user;
  ProfileCard({
   required this.user
});


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      clipBehavior: Clip.hardEdge,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hi ${user?.email?.split('@')[0]}!',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text('12/100')
              ],
            ),
            SizedBox(
              height: 15,
            ),
            LinearProgressIndicator(
              value: 0.9,
              minHeight: 12,
              backgroundColor: Color(kWhiteColor),
              valueColor: AlwaysStoppedAnimation<Color> (Color(kSecondaryColor)),
            )
          ],
        ),
      ),
    );
  }
}
