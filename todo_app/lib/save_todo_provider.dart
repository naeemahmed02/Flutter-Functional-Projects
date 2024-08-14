import 'package:flutter/foundation.dart';
import 'package:todo_app/task_models/task_model.dart';

class SaveTodoProvider with ChangeNotifier {

  List<ToDo> _todos = [];

  List<ToDo> get todos => _todos;

  void addTask(ToDo taskName){
    todos.add(taskName);
    notifyListeners();
  }

  void ChangeStatus(int index){
    todos[index].isDone();
    notifyListeners();
  }

}