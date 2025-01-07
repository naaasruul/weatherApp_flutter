import 'package:flutter/material.dart';
import 'package:mudahjev3/Screen/InstructionScreen.dart';
import 'package:mudahjev3/Screen/QuizScreen.dart';
import 'package:mudahjev3/Widgets/ProfileCard.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ExerciseScreen extends StatefulWidget {
  final User username;

  ExerciseScreen({required this.username});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProfileCard(
            user: widget.username,
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            'Exercises',
            style: TextStyle(fontSize: 32),
          ),
          SizedBox(
            height: 32,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(20, (index) {
                return GestureDetector(
                  onTap: () {
                    print(index);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InstructionScreen()));
                  },
                  child: Card(
                    elevation: 4.0,
                    child: Center(
                      child: Text(
                        'Bpaak kau',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
