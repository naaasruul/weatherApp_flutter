import 'package:flutter/material.dart';
import 'package:practiceflutter_provider/models/tasks.dart';
import 'package:practiceflutter_provider/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;

  const TasksList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (
        BuildContext context,
        int index,
      ) =>
          TaskTile(
              taskTitle: tasks[index].name,
              isChecked: tasks[index].isDone,
              checkBoxCallBack: (newValue) {
                tasks[index].toggleDone();
              }),
    );
  }
}
