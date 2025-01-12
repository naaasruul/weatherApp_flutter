import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/models/task_list.dart';

class AddTaskScreen extends StatelessWidget {
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
              const SizedBox(height: 16,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                ),
                  onPressed: (){
                  Provider.of<TaskData>(context,listen: false).addTask(Task(taskName:newTaskTitle ));
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
