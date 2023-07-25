import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/features/addTodoPage/view/screen/add_todo_page.dart';
import 'package:todoapp/features/homepage/provider/todo_state.dart';
import 'package:todoapp/features/homepage/view/widgets/completed_todo.dart';
import 'package:todoapp/features/homepage/view/widgets/todo.dart';
import 'package:todoapp/features/homepage/view/widgets/todo_item_widget.dart';

import '../widgets/all_todo_widget.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<Homepage> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage>
    with SingleTickerProviderStateMixin {
  late final tabController;
  bool isLoading = false;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    setState(() {
      isLoading = true;
    });
    ref.read(todoProvider).getTodo().then((_) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "My Todo Application",
          ),
          centerTitle: true,
          bottom: TabBar(
              controller: tabController,
              indicatorColor: Colors.white,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              tabs: [
                Tab(
                  text: "All Todos",
                ),
                Tab(
                  text: "Todos",
                ),
                Tab(
                  text: "Completed Todos",
                ),
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddTodoPage()));
          },
          child: Icon(Icons.add),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : TabBarView(
                children: [
                  AllTodoWidget(),
                  TodoWidget(),
                  CompletedTodoWidget(),
                ],
                controller: tabController,
              ));
  }
}
