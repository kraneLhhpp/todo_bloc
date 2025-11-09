import 'package:flutter/material.dart';
import 'package:task_tracker_with_bloc/tasks.dart';

class TaskItem extends StatelessWidget {
  final Tasks task;
  final VoidCallback onShowdetails;
  final VoidCallback onDeleteTask;

  const TaskItem({super.key, required this.task, required this.onShowdetails, required this.onDeleteTask});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.taskName,
                  style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              const SizedBox(height: 10),
              Text(task.taskDescription, style: const TextStyle(fontSize: 15)),
              
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: onShowdetails, 
                icon: Icon(Icons.arrow_forward_ios,size: 40,)
              ),
              const SizedBox(width: 10),

              IconButton(
                onPressed: onDeleteTask, 
                icon: Icon(Icons.delete, color: Colors.black)
              )
            ],
          )
        ],
      ),
    );
  }
}