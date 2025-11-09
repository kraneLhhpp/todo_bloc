  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:task_tracker_with_bloc/pages/task_add_page.dart';
  import 'package:task_tracker_with_bloc/bloc/tasks_bloc.dart';
  // import 'package:task_tracker_with_bloc/widgets/task_item.dart';
  import 'package:task_tracker_with_bloc/widgets/tasks_list_view.dart';

  class HomePage extends StatelessWidget {
    const HomePage({super.key});

    @override
    Widget build(BuildContext context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<TasksBloc>(
            create: (context) => TasksBloc()..add(GetTasksEvent(3)),
          ),
        ],
        child: const HomePageContent(),
      );
    }
  }

  class HomePageContent extends StatefulWidget {
    const HomePageContent({super.key});

    @override
    State<HomePageContent> createState() => _HomePageContentState();
  }

  class _HomePageContentState extends State<HomePageContent>
      with TickerProviderStateMixin {
    late TabController _tabController;
    final filterType = ['all', 'active', 'completed'];

    @override
    void initState() {
      super.initState();
      _tabController = TabController(length: 3, vsync: this);
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 10),
            IconButton(
              onPressed: () async {
                final newTask = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TaskAddPage()),
                );
                if(newTask != null){
                  context.read<TasksBloc>().add(AddTaskEvent(newTask));
                }
              },
              icon: const Icon(Icons.add_task, size: 40, color: Colors.green),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabs:  [Text(filterType[0].toUpperCase()), Text(filterType[1].toUpperCase()), Text(filterType[2].toUpperCase())],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TabBarView(
                    controller: _tabController,
                    children:  [
                      TasksListView(filterType: filterType[0]),
                      TasksListView(filterType: filterType[1]),
                      TasksListView(filterType: filterType[2]),
                    ]
                  )
                ),
              ),
            ],
          ),
        ),
      );
    }
  }