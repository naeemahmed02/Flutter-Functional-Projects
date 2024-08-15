class ToDo {
  String taskName;
  bool completed;
  final String id;
  String description;

  ToDo({
    required this.taskName, 
    this.completed = false, 
    required this.id,
    this.description = ''});

    void isDone(){
      completed = !completed;
    }
}
