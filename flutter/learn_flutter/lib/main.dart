import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'My App',
          style: TextStyle(
            fontSize: 40.0,
            letterSpacing: 2.0,
            color: Colors.grey[600],
            fontFamily: 'Quicksand',
          ),
        )),
        backgroundColor: Colors.red,
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.cyan,
              padding: EdgeInsets.all(30),
              child: Text('1'),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.pinkAccent,
              padding: EdgeInsets.all(30),
              child: Text('2'),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.yellowAccent,
              padding: EdgeInsets.all(30),
              child: Text('3'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Click'),
        onPressed: (){
          print('mak kau');
        },
        backgroundColor: Colors.red,
      ),
    );
  }
}
