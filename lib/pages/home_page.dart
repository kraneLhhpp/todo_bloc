  import 'package:flutter/material.dart';
  import 'package:task_tracker_with_bloc/pages/task_add_page.dart';
  import 'package:task_tracker_with_bloc/widgets/tasks_list_view.dart';

  class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
        floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
            maximumSize: Size(300, 200),
            backgroundColor: Colors.black,
          ),
          onPressed: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const TaskAddPage(), 
              ),
            );
          }, 
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Add Task', style: TextStyle(color: Colors.green, fontSize: 24)),
                Icon(Icons.add_task_outlined, color: Colors.green,size: 40,)
              ],
            ),
          )
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TabBar(
                  controller: _tabController,
                  isScrollable: false,
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