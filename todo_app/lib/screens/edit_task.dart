// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_app/task_models/save_todo_provider.dart';
// import 'package:todo_app/task_models/task_model.dart';
// import 'package:todo_app/widgets/custom_app_bar.dart';

// class EditTask extends StatefulWidget {
//   final ToDo task;
//   final int index;
//   const EditTask({super.key, required this.index, required this.task});

//   @override
//   State<EditTask> createState() => _EditTaskState();
// }

// class _EditTaskState extends State<EditTask> {
//   late TextEditingController _taskController, _taskDescController;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _taskController = TextEditingController(text: widget.task.taskName);
//     _taskDescController = TextEditingController(text: widget.task.description);
//   }
//   @override
//   Widget build(BuildContext context) {
//     final UpdatetaskProvider = Provider.of<SaveTodoProvider>(context, listen: false);

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.grey[100],
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const CustomAppBar(),
//                 const SizedBox(height: 30),
//                 const Text(
//                   "Edit Task",
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.purple,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 10,
//                         offset: Offset(0, 5),
//                       ),
//                     ],
//                   ),
//                   child: TextFormField(
//                     controller: _taskController,
//                     maxLines: 1,
//                     decoration: const InputDecoration(
//                       hintText: "Title",
//                       hintStyle: TextStyle(fontSize: 16),
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.all(15),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 10,
//                         offset: Offset(0, 5),
//                       ),
//                     ],
//                   ),
//                   child: TextFormField(
//                     controller: _taskDescController,
//                     maxLines: 5,
//                     decoration: InputDecoration(
//                       hintText: "Update notes",
//                       hintStyle: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.normal,
//                         color: Colors.grey[600],
//                       ),
//                       border: InputBorder.none,
//                       contentPadding: const EdgeInsets.all(15),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       UpdatetaskProvider.updateTask(widget.index, _taskController.text, _taskDescController.text);
//                       Navigator.pop(context);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: Colors.white,
//                       backgroundColor: Colors.purple,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
//                       shadowColor: Colors.purpleAccent,
//                       elevation: 5,
//                     ),
//                     child: const Text(
//                       "Update Task",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }







import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/task_models/save_todo_provider.dart';
import 'package:todo_app/task_models/task_model.dart';
import 'package:todo_app/widgets/custom_app_bar.dart';

class EditTask extends StatefulWidget {
  final ToDo task;
  final int index;
  const EditTask({super.key, required this.index, required this.task});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  late TextEditingController _taskController;
  late TextEditingController _taskDescController;

  @override
  void initState() {
    super.initState();
    _taskController = TextEditingController(text: widget.task.taskName);
    _taskDescController = TextEditingController(text: widget.task.description);
  }

  @override
  Widget build(BuildContext context) {
    final updateTaskProvider = Provider.of<SaveTodoProvider>(context, listen: false);

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
                  "Edit Task",
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
                    controller: _taskController,
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
                    controller: _taskDescController,
                    maxLines: 8,
                    decoration: InputDecoration(
                      hintText: "Update notes",
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
                      updateTaskProvider.updateTask(
                        widget.index,
                        _taskController.text,
                        _taskDescController.text,
                      );
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
                      "Update Task",
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
