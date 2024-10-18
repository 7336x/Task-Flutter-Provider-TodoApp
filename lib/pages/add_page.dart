import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todo_provider.dart';

class AddPage extends StatelessWidget {
  AddPage({Key? key}) : super(key: key);
  
  final TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
        backgroundColor: Colors.amber.shade300,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: TextField(
                controller: todoController,
                decoration: InputDecoration(
                  hintText: 'Your todo',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final todoTitle = todoController.text;
                if (todoTitle.isNotEmpty) {
                  // Call the addTodo method from TodoProvider and pass the value
                  Provider.of<TodoProvider>(context, listen: false)
                      .addTodo(todoTitle);
                  // Navigate back 
                  GoRouter.of(context).go('/');
                }
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.amber.shade300),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Add"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


