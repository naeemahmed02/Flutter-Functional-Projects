import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/task_models/save_todo_provider.dart';
import 'package:todo_app/task_models/task_model.dart';
import 'package:todo_app/widgets/custom_app_bar.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController taskNameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    final taskProvider = Provider.of<SaveTodoProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                const SizedBox(height: 30),
                const Text(
                  "Add New Task",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: taskNameController,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      hintText: "Title",
                      hintStyle: TextStyle(fontSize: 16),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: descriptionController,
                    maxLines: 8,
                    decoration: InputDecoration(
                      hintText: "Note something down",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[600],
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(15),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      taskProvider.addTask(ToDo(
                        taskName: taskNameController.text,
                        id: DateTime.now().toString(),
                        description: descriptionController.text,
                      ));
                      taskNameController.clear();
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                      shadowColor: Colors.purpleAccent,
                      elevation: 5,
                    ),
                    child: const Text(
                      "Add Task",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
