import 'package:flutter/material.dart';
import 'package:mytodolist/models/task_data.dart';
import 'package:mytodolist/models/task_list.dart';
import 'package:mytodolist/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (BuildContext context) { 
        return TaskData();
      },
      child: const MaterialApp(
        title: 'All Task',
        home: HomePage(),
      ),
    );
  }
}

