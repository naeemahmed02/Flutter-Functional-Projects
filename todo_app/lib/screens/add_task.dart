// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/save_todo_provider.dart';
import 'package:todo_app/task_models/task_model.dart';
import 'package:todo_app/widgets/custom_app_bar.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController taskNameController = TextEditingController();
    final taskProvider = Provider.of<SaveTodoProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              CustomAppBar(),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: TextField(
                  controller: taskNameController,
                  decoration: InputDecoration(
                      hintText: "Enter task title here",
                      border: InputBorder.none),
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: (){
                taskProvider.addTask(ToDo(taskName: taskNameController.text, id: DateTime.now().toString()));
                taskNameController.clear();
                Navigator.pop(context);
              }, child: Text("Add Task"))
            ],
          ),
        ),
      ),
    );
  }
}
