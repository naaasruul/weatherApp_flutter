import 'package:flutter/material.dart';
import 'package:mudahjev3/Utils/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';


final _auth = FirebaseAuth.instance;

class ProfileCard extends StatelessWidget {
  final User? user;

  ProfileCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      clipBehavior: Clip.hardEdge,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Text(user?.displayName?.substring(0, 1).toUpperCase() ?? 'U'),
                ),
                SizedBox(width: 8,),
                Text(user?.displayName ?? '',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
              ],
            ),
            const SizedBox(
              height: 15,
            ),
             Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [Text('950',style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold
              ),), Text('Points'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
