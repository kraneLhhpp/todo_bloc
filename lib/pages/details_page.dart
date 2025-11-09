import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_tracker_with_bloc/bloc/tasks_bloc.dart';
import 'package:task_tracker_with_bloc/tasks.dart';

class DetailsPage extends StatelessWidget {
  final Tasks task;
  const DetailsPage({super.key, required this.task,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
              task.taskName, 
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold
              ),
            ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.taskDescription,
              style: TextStyle(
                fontSize: 30
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                if(!task.isCompleted){
                  return Center(
                  child: ElevatedButton(
                    onPressed: (){
                      context.read<TasksBloc>().add(CompleteTaskEvent(task));
                    }, 
                    style: ElevatedButton.styleFrom(
                      maximumSize: Size(200, 100),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(),
                    ),
                    child: Text('Complete', style: TextStyle(color: Colors.white))
                  ),
                  );
                }else{
                  return Center(
                  child: ElevatedButton(
                    onPressed: (){
                      context.read<TasksBloc>().add(IncompleteTaskEvent(task));
                    }, 
                    style: ElevatedButton.styleFrom(
                      maximumSize: Size(200, 100),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(),
                    ),
                    child: Text('Incomplete', style: TextStyle(color: Colors.white))
                  ),
                );
                }
              },
            )     
          ],
        ), 
      ), 
    );
  }
}
