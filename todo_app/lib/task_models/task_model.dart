class ToDo {
  final String taskName;
  bool completed;
  String id;

  ToDo({
    required this.taskName, 
    this.completed = false, 
    required this.id});

    void isDone(){
      completed = !completed;
    }
}
