import 'package:flutter/material.dart';
import 'package:mytodolist/models/task_data.dart';
import 'package:provider/provider.dart';

class TaskItem extends StatelessWidget {
  final id = DateTime.now();
  final String title;
  final bool isDone;
  final ValueChanged? checkState;
  final  void Function()? delete;

  TaskItem(
      {super.key, this.isDone = false, required this.title, required this.checkState, this.delete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: delete,
      child: Card(
        elevation: 6,
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
          trailing: Checkbox(value: isDone, onChanged: checkState),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
