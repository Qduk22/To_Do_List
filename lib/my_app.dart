import 'package:flutter/material.dart';
import 'package:homework/screens/demo/demo_screen.dart';

class MyApp extends StatelessWidget {
  /// Constructor của MyApp
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'To-Do List',
      home: DemoScreen(),
    );
  }
}
