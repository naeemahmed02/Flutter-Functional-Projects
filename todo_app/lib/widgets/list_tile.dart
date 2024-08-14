import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/save_todo_provider.dart';
import 'package:todo_app/task_models/task_model.dart';

class CustomListTile extends StatefulWidget {
  final int index;
  const CustomListTile({super.key, required this.index});

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    print("object");
    // final todoProvider = Provider.of<SaveTodoProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        margin: EdgeInsets.only(top: 5, bottom: 10),
        padding: EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(blurRadius: 10, spreadRadius: 2, offset: Offset(0, 3), color: Colors.grey.withOpacity(0.5))
          ]
        ),
        child: Consumer<SaveTodoProvider>(builder: (context, task, child){
          return ListTile(
        leading: Checkbox(
          value: task.todos[widget.index].completed,
          onChanged: (value){
            task.ChangeStatus(widget.index);
          }),
          title: Text(task.todos[widget.index].taskName, style: TextStyle(decoration: task.todos[widget.index].completed? TextDecoration.lineThrough: TextDecoration.none),),
          trailing: Icon(Icons.more_vert),
      );
        })
      ),
    );
  }
}