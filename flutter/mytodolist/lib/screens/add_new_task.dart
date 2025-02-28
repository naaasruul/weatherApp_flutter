import 'package:flutter/material.dart';
import 'package:mytodolist/models/task_data.dart';
import 'package:provider/provider.dart';

class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var text='';
    return Container(
      height: 300,
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Add New Task'),
          TextField(
            onChanged: (newVal){
              text = newVal;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: () {
                Provider.of<TaskData>(context,listen: false).addNewTask(text);
                Navigator.pop(context);
              }, child: const Text('Add New Task'))
        ],
      ),
    );
  }
}
