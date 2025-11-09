import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_tracker_with_bloc/bloc/tasks_bloc.dart';
import 'package:task_tracker_with_bloc/pages/home_page.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => TasksBloc()..add(GetTasksEvent()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}