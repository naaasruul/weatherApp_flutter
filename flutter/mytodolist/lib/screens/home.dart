import 'package:flutter/material.dart';
import 'package:mytodolist/screens/add_new_task.dart';
import 'package:mytodolist/widgets/task_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.menu,
              size: 30,
              color: Colors.lightBlueAccent,
            ),
            Expanded(
                child: Center(
                    child: Text(
              'All Tasks',
            ))),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: const Column(
              children: [
                TaskList()
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            alignment: Alignment.bottomCenter,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  backgroundColor: Colors.lightBlueAccent,
                  shape: const CircleBorder(),
                  fixedSize: const Size(100, 100)),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return const AddNewTaskScreen();
                    });
              },
              label: const Icon(
                Icons.add,
                size: 50,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

