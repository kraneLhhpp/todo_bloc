import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_tracker_with_bloc/bloc/tasks_bloc.dart';
import 'package:task_tracker_with_bloc/tasks.dart';

class TaskAddPage extends StatefulWidget {
  const TaskAddPage({super.key});

  @override
  State<TaskAddPage> createState() => _TaskAddPageState();
}

class _TaskAddPageState extends State<TaskAddPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
          }, 
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: (){
          if(_nameController.text.trim().isEmpty ||
             _descriptionController.text.trim().isEmpty
          ){
            return;
          }
          final newTask = Tasks(
            taskName: _nameController.text, 
            taskDescription: _descriptionController.text,
          ); 

          context.read<TasksBloc>().add(AddTaskEvent(newTask));
          Navigator.pop(context);
        },
        icon: Icon(Icons.add_box_rounded, size: 30, color: Colors.blue)
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Task Name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            TextField(  
              controller: _nameController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()
              ),
            ),

            const SizedBox(height: 15),

            const Text('Description', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()
              ),
            )
          ],
        ), 
      ),
    );
  }
}