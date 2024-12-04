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
        title: Center(child: Text(
          'My Nigga App',
          style: TextStyle(
            fontSize: 40.0,

            letterSpacing: 2.0,
            color: Colors.grey[600],
            fontFamily: 'Quicksand',
          ),
        )),
        backgroundColor: Colors.red,
      ),
      body: Center(
          child: Image(image: AssetImage('assets/image1.jpg') )
      ),
      floatingActionButton: FloatingActionButton(child: Text('Click'), onPressed: null, backgroundColor: Colors.red,),
    );
  }
}
