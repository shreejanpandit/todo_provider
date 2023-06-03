import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_firabase_flutter_yoddha/features/auth/presentations/widgets/login_screen.dart';
import 'package:todo_firabase_flutter_yoddha/features/todos/presentation/pages/home_screen.dart';
import 'package:todo_firabase_flutter_yoddha/features/todos/presentation/provider/todo_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => TodoProvider(),
          )
        ],
        child: MaterialApp(
          title: 'Todo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        ));
  }
}
