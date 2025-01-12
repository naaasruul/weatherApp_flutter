import 'package:flutter/foundation.dart';
import 'task_list.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(taskName: 'Buy milk'),
    Task(taskName: 'Buy eggs'),
    Task(taskName: 'Buy bread'),
  ];

  int get taskCount {
    return tasks.length;
  }

  void addTask(Task newTask) {
    tasks.add(newTask);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    tasks.remove(task);
    notifyListeners();
  }
}
