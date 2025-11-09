part of 'tasks_bloc.dart';

@immutable
sealed class TasksEvent {}

class GetTasksEvent extends TasksEvent {}

class AddTaskEvent extends TasksEvent {
  final Tasks task;
  AddTaskEvent(this.task);
}

class CompleteTaskEvent extends TasksEvent{
  final Tasks task;

  CompleteTaskEvent(this.task);
}

class IncompleteTaskEvent extends TasksEvent{
  final Tasks task;

  IncompleteTaskEvent(this.task);
}

class TaskDeleteEvent extends TasksEvent{
  final Tasks task;

  TaskDeleteEvent(this.task);
}