import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final ValueChanged addTaskCallback;

  AddTaskScreen({required this.addTaskCallback});


  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';

    return Container(
      color: const Color(0xFF757575),
      child: Container(
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              TextField(
                autofocus: true,
                onChanged: (newText){
                  newTaskTitle = newText;
                },
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 4,horizontal:6),

                ),
              ),
              SizedBox(height: 16,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                ),
                  onPressed: (){
                  addTaskCallback(newTaskTitle);
                  Navigator.pop(context);
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(fontSize: 25,color: Colors.white),
                  ))
            ],
          )),
    );
  }
}
