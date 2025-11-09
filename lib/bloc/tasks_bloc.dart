import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:task_tracker_with_bloc/tasks.dart'; 

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksLoadedState(const [])) {
    on<GetTasksEvent>(_onGetTasks);
    on<AddTaskEvent>(_onAddTask);
    on<CompleteTaskEvent>(_onCompleteTask);
    on<IncompleteTaskEvent>(_onIncomplete);
    on<TaskDeleteEvent>(_onDelelteTask);
  }

  final List<Tasks> _tasks = [];

  _onAddTask(AddTaskEvent event, Emitter<TasksState> emit) async {    
    _tasks.add(event.task);
    emit(TasksLoadedState(List.from(_tasks)));
  }

  _onGetTasks(GetTasksEvent event, Emitter<TasksState> emit) async {
    emit(TasksLoadingState());
    await Future.delayed(const Duration(seconds: 1));     
    emit(TasksLoadedState(List.from(_tasks))); 
  }
  
  _onCompleteTask(CompleteTaskEvent event, Emitter<TasksState> emit){
    final index = _tasks.indexOf(event.task);
    if(index != -1){
      _tasks[index].isCompleted = true;
    }
    emit(TasksLoadedState(List.from(_tasks)));
  }

  _onIncomplete(IncompleteTaskEvent event, Emitter<TasksState> emit){
      final index = _tasks.indexOf(event.task);
      _tasks[index].isCompleted = false;
      emit(TasksLoadedState(List.from(_tasks)));
  }

  _onDelelteTask(TaskDeleteEvent event, Emitter<TasksState>emit){
    final index = _tasks.indexOf(event.task);
    _tasks.removeAt(index);
    emit(TasksLoadedState(List.from(_tasks)));
  }
}