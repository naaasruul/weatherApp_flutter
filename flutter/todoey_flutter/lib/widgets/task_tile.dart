import 'package:flutter/material.dart ';

ListTile TaskTile() {
  return ListTile(
    title: Text('data'),
    trailing: TaskCheckBoxState(),
  );
}

class TaskCheckBoxState extends StatefulWidget {
  @override
  State<TaskCheckBoxState> createState() => _TaskCheckBoxStateState();
}

class _TaskCheckBoxStateState extends State<TaskCheckBoxState> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (newValue) {
          setState(() {
            isChecked = newValue!;
          });
        });
  }
}
