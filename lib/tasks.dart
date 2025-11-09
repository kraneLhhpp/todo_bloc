class Tasks {
  final String taskName;
  final String taskDescription;
  bool isCompleted;

  Tasks({required this.taskName, required this.taskDescription, this.isCompleted = false});
}