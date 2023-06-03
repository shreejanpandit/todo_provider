import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_firabase_flutter_yoddha/features/todos/data/models/todo_models.dart';
import 'package:todo_firabase_flutter_yoddha/features/todos/presentation/provider/todo_provider.dart';

class TodoDescriptionScreen extends StatefulWidget {
  final Todo todo;

  const TodoDescriptionScreen({Key? key, required this.todo}) : super(key: key);

  @override
  State<TodoDescriptionScreen> createState() => _TodoDescriptionScreenState();
}

class _TodoDescriptionScreenState extends State<TodoDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    final TodoProvider todoProvider = Provider.of<TodoProvider>(context);
    final Todo todo = widget.todo;
    final int todoIndex = todoProvider.todoList.indexOf(todo);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              todoProvider.removeTodoAt(todoIndex);
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
        title: const Center(
          child: Text('Test'),
        ),
      ),
      body: Column(
        children: [
          Text(
            todo.title,
            style: const TextStyle(fontSize: 25),
          ),
          Text(todo.subtitle),
          Text(todo.des),
        ],
      ),
    );
  }
}
