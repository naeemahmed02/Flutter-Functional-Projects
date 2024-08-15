import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/detailed.dart';
import 'package:todo_app/screens/edit_task.dart';
import 'package:todo_app/task_models/save_todo_provider.dart';

class CustomListTile extends StatefulWidget {
  final int index;
  const CustomListTile({super.key, required this.index});

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<SaveTodoProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        margin: const EdgeInsets.only(top: 8, bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 5),
              color: Colors.grey.withOpacity(0.2),
            )
          ],
        ),
        child: Consumer<SaveTodoProvider>(
          builder: (context, task, child) {
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              leading: Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                activeColor: Colors.purple,
                value: task.todos[widget.index].completed,
                onChanged: (value) {                
                  task.ChangeStatus(widget.index);
                },
              ),
              title: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TaskDetailScreen(task: taskProvider.todos[widget.index],)));
                },
                child: Text(
                  task.todos[widget.index].taskName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    decoration: task.todos[widget.index].completed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
              trailing: InkWell(
                onTap: () {
                  showMenu(
                    context: context,
                    position: const RelativeRect.fromLTRB(100, 100, 0, 0),
                    items: [
                      const PopupMenuItem<String>(
                        value: "Edit",
                        child: Row(
                          children: [
                            Icon(Icons.edit, color: Colors.purple),
                            SizedBox(width: 8),
                            Text('Edit'),
                          ],
                        ),
                      ),
                      const PopupMenuItem<String>(
                        value: "Delete",
                        child: Row(
                          children: [
                            Icon(Icons.delete, color: Colors.red),
                            SizedBox(width: 8),
                            Text('Delete'),
                          ],
                        ),
                      ),
                      const PopupMenuItem<String>(
                        value: "Favorite",
                        child: Row(
                          children: [
                            Icon(Icons.favorite, color: Colors.pink),
                            SizedBox(width: 8),
                            Text('Add to Favorite'),
                          ],
                        ),
                      ),
                    ],
                  ).then((value) {
                    if (value == "Delete") {
                      taskProvider
                          .removeTask(taskProvider.todos[widget.index].id);
                    } else if (value == "Edit") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditTask(
                                  index: widget.index,
                                  task: taskProvider.todos[widget.index])));
                    }
                  });
                },
                child: const Icon(Icons.more_vert, color: Colors.grey),
              ),
            );
          },
        ),
      ),
    );
  }
}
