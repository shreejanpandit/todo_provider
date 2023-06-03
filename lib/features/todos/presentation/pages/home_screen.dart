import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_firabase_flutter_yoddha/features/todos/data/models/todo_models.dart';
import 'package:todo_firabase_flutter_yoddha/features/todos/presentation/pages/add_todo_screen.dart';
import 'package:todo_firabase_flutter_yoddha/features/todos/presentation/pages/todo_description_screen.dart';
import 'package:todo_firabase_flutter_yoddha/features/todos/presentation/provider/todo_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final TodoProvider todoProvider = Provider.of<TodoProvider>(context);
    final List<Todo> todoList = todoProvider.todoList;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Todo App By Shreejan Pandit'),
        ),
        leading: IconButton(
            tooltip: 'Clear all todos',
            onPressed: () {
              todoProvider.clearTodos();
            },
            icon: Icon(
              Icons.clear_all_outlined,
              color: Colors.red,
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          todoList.isEmpty
              ? const Center(
                  child: Text('Add a todo'),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    final Todo todo = todoList[index];

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TodoDescriptionScreen(todo: todo),
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(
                          todo.title,
                          style: TextStyle(
                            decoration:
                                todo.done ? TextDecoration.lineThrough : null,
                          ),
                        ),
                        subtitle: Text(
                          todo.subtitle,
                          style: TextStyle(
                            decoration:
                                todo.done ? TextDecoration.lineThrough : null,
                          ),
                        ),
                        trailing: InkWell(
                          onTap: () {
                            todoProvider.toggleTodoStatus(todo);
                          },
                          child: todo.done
                              ? const Text(
                                  'Complete',
                                  style: TextStyle(color: Colors.greenAccent),
                                )
                              : const Text(
                                  'Incomplete',
                                  style: TextStyle(color: Colors.red),
                                ),
                        ),
                      ),
                    );
                  },
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTodoScreen(),
            ),
          );
        },
        tooltip: 'add items',
        child: const Icon(Icons.add),
      ),
    );
  }
}
