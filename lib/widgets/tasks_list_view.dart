import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_tracker_with_bloc/bloc/tasks_bloc.dart';
import 'package:task_tracker_with_bloc/pages/details_page.dart';
import 'package:task_tracker_with_bloc/tasks.dart';
import 'package:task_tracker_with_bloc/widgets/task_item.dart';

class TasksListView extends StatelessWidget {
  final String filterType;

  const TasksListView({super.key, required this.filterType});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        if (state is TasksLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is TasksLoadedState) {
          List<Tasks> filteredTasks = [];

          if(filterType == 'all'){
            filteredTasks = state.tasks;
          }else if(filterType == 'active'){
            filteredTasks = state.tasks.where((t) => !t.isCompleted).toList();
          }else if(filterType == 'completed'){
            filteredTasks = state.tasks.where((t) => t.isCompleted).toList(); 
          }

          if(filteredTasks.isEmpty){
            return const Center(child: Text('NO Tasks'));
          }

          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: filteredTasks.length,
            itemBuilder: (context, index) {
              final task = filteredTasks[index];
              return TaskItem(
                task: task,
                details: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (newContext) => BlocProvider.value(
                        value: BlocProvider.of<TasksBloc>(context),
                        child: DetailsPage(task: task),
                      ),
                    ),
                  );
                },
                deleteTask: (){
                  context.read<TasksBloc>().add(TaskDeleteEvent(task));
                },
              );
            },
          );
        }

        return const Center(child: Text('Something went wrong'));
      },
    );
  }
}
