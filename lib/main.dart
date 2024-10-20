import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/add_page.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/provider/todo_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/add',
        builder: (context, state) => AddPage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
    
      debugShowCheckedModeBanner: false,
    );
  }
}




