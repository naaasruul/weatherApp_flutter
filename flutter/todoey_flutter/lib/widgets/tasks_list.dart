import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context,taskData, child){
        return ListView.builder(
            itemCount: taskData.taskCount,
            itemBuilder: (context, index) {
              final taskItem = taskData.tasks[index];
              return TaskTile(
                  isChecked: taskItem.isDone,
                  taskTitle: taskItem.taskName,
                  checkBoxCallback:(checkboxState){
                   taskData.updateTask(taskItem);
                  }
              );
            });
      },
    );
  }
}

