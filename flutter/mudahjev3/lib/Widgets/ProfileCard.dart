import 'package:flutter/material.dart';
import 'package:mudahjev3/Utils/constant.dart';
class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
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
                  'Hi Nasrul!',
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
