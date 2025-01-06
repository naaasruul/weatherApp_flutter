import 'package:flutter/material.dart';
import 'package:mudahjev3/Screen/LessonScreen.dart';
import 'package:mudahjev3/Utils/constant.dart';
import 'package:mudahjev3/Widgets/ProfileCard.dart';
class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProfileCard(),
          SizedBox(
            height: 32,
          ),
          Text(
            'Categories',
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
                  onTap: (){
                    print(index);
                  },
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LessonScreen()));
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

