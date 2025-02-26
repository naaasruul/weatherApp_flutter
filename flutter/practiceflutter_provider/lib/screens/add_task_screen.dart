import 'package:flutter/material.dart';
import 'package:practiceflutter_provider/models/tasks.dart';
import 'package:practiceflutter_provider/screens/tasks_screen.dart';

class AddTaskScreen extends StatelessWidget {
  final Function(String)? addTaskCallBack;
  var newText = '';
  AddTaskScreen({super.key, required this.addTaskCallBack, this.newText = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add Task',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color: Colors.lightBlueAccent,
            ),
            textAlign: TextAlign.center,
          ),
          TextField(
            onChanged: (newText2) {
              newText = newText2;
            },
            autofocus: true,
            decoration:
                const InputDecoration(focusColor: Colors.lightBlueAccent),
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () {
              addTaskCallBack!(newText);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)))),
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
