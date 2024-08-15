import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/task_models/save_todo_provider.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_list_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    print('Home');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              const SizedBox(height: 30),
              Text(
                'All ToDos',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[800],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Consumer<SaveTodoProvider>(builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.todos.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CustomListTile(index: index),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "add_task");
          },
          backgroundColor: Colors.purple,
          child: const Icon(Icons.add, color: Colors.white,),
        ),
      ),
    );
  }
}
