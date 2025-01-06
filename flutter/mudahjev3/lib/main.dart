import 'package:flutter/material.dart';
import 'package:mudahjev3/Screen/LoginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MUDAH JE V3',
      theme: ThemeData(
        fontFamily: 'Quicksand',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.grey)
        ),
        scaffoldBackgroundColor: Color(0xFFf1f1f1),
      ),
      home: LoginScreen(),
    );
  }
}
