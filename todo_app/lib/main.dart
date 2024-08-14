import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/save_todo_provider.dart';
import 'package:todo_app/screens/add_task.dart';
import 'package:todo_app/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=> SaveTodoProvider(),
    child: MaterialApp(
      routes: {
        '/': (context) => Home(),
        'add_task': (context) => AddTask(),
      },
    ),);
  }
}