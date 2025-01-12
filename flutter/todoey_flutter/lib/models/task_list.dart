import 'package:flutter/cupertino.dart';

class Task extends ChangeNotifier{
  String taskName;
  bool isDone;

  Task({
    this.taskName = '',
    this.isDone = false,
});

  void toggleDone(){
    isDone = !isDone;
  }
}