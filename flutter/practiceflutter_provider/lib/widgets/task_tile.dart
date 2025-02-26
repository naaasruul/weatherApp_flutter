import 'package:flutter/material.dart';
import 'package:practiceflutter_provider/models/tasks.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?> checkBoxCallBack;
  final String taskTitle;

  TaskTile({super.key,
    required this.isChecked,
    required this.taskTitle,
    required  this.checkBoxCallBack
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkBoxCallBack,
        activeColor: Colors.lightBlueAccent,
      ),
      title: Text(
          taskTitle,
          style: TextStyle(
      decoration: isChecked ? TextDecoration.lineThrough : null),
    ),);
  }
}
