import 'package:flutter/material.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  late final TextEditingController todoTitleController;
  late final TextEditingController todoDescription;

  @override
  void initState() {
    todoTitleController = TextEditingController();
    todoDescription = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Todo",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: todoTitleController,
            ),
            TextFormField(
              controller: todoDescription,
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
