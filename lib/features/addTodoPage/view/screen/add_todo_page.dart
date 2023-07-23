import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../homepage/model/todo_model.dart';
import '../../../homepage/provider/todo_state.dart';

class AddTodoPage extends ConsumerStatefulWidget {
  const AddTodoPage({super.key});

  @override
  ConsumerState<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends ConsumerState<AddTodoPage> {
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
              decoration: InputDecoration(labelText: "Title"),
              controller: todoTitleController,
            ),
            TextFormField(
              controller: todoDescription,
              decoration: InputDecoration(
                labelText: "Description",
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(todoProvider).addTodo(TodoModel(
                    id: Uuid().v4(),
                    title: todoTitleController.text,
                    description: todoDescription.text,
                    isCompleted: false));
                Navigator.pop(context);
              },
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
