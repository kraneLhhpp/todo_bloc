part of 'tasks_bloc.dart';

@immutable
sealed class TasksState {}

final class TasksInitial extends TasksState {}

final class TasksLoadedState extends TasksState {
  final List<Tasks> tasks;
  TasksLoadedState(this.tasks);
}

final class TasksLoadingState extends TasksState {}