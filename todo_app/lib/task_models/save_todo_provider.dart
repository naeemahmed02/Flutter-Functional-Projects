import 'package:flutter/foundation.dart';
import 'package:todo_app/task_models/task_model.dart';

class SaveTodoProvider with ChangeNotifier {

  List<ToDo> _todos = [];

  List<ToDo> get todos => _todos;

  void addTask(ToDo taskName){
    todos.add(taskName);
    notifyListeners();
  }

  // remove task
  void removeTask(String id){
    _todos.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void updateTask(int index, String newTaskName, String description){
    _todos[index].taskName = newTaskName;
    _todos[index].description = description;
    notifyListeners();
  }

  void ChangeStatus(int index){
    todos[index].isDone();
    notifyListeners();
  }

}
