import 'package:flutter/material.dart';
import 'package:mytodolist/models/task_list.dart';

class TaskData extends ChangeNotifier{
  List<Task> tasks = [
    Task(title: 'pergi beli susu'),
    Task(title: 'pergi gym'),
  ];

  void addNewTask(String task){
    var newTask = Task(title: task);
    tasks.add(newTask);
    notifyListeners();
  }

  void updateState(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    tasks.remove(task);
    notifyListeners();
  }



}