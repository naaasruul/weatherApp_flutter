import 'package:flutter/material.dart';
import 'package:mytodolist/models/task_data.dart';
import 'package:mytodolist/widgets/task_item.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<TaskData>(
        builder: (BuildContext context, TaskData taskdata, Widget? child) {
          return ListView.builder(
            itemCount: taskdata.tasks.length,
            itemBuilder: (BuildContext context, int index) {
              var item = taskdata.tasks[index];
              return TaskItem(
                title: item.title,
                isDone: item.isDone,
                delete: (){
                  Provider.of<TaskData>(context,listen: false).deleteTask(item);
                },
                checkState: (newValue) {
                  Provider.of<TaskData>(context, listen: false)
                      .updateState(item);
                },
              );
            },
          );
        },
      ),
    );
  }
}
