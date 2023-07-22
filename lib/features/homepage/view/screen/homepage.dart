import 'package:flutter/material.dart';
import 'package:todoapp/features/addTodoPage/view/screen/add_todo_page.dart';
import 'package:todoapp/features/homepage/view/widgets/todo_item_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late final tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
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
        body: TabBarView(
          children: [
            ListView.separated(
              padding: EdgeInsets.all(16),
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 8,
                );
              },
              itemCount: 5,
              itemBuilder: (context, index) {
                return TodoItemWidget(
                    title: "hello",
                    description: "This is the description of task",
                    taskCompleted: false,
                    onChanged: (_) {},
                    deleteFunction: (_) {});
              },
            ),
            Container(),
            Container(),
          ],
          controller: tabController,
        ));
  }
}
