import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;
  const TasksList({
    required this.tasks,
});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
              isChecked: widget.tasks[index].isDone,
              taskTitle: widget.tasks[index].taskName,
            checkBoxCallback:(checkboxState){
              setState(() {
                widget.tasks[index].toggleDone();
              });
            }
          );
        });
  }
}

