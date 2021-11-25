// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model.dart';

class NewTodo extends StatefulWidget {
  final Todo uppgift;

  NewTodo(this.uppgift);

  @override
  State<StatefulWidget> createState() {
    return NewTodoState(uppgift);
  }
}

class NewTodoState extends State<NewTodo> {
  late String title;

  late TextEditingController textEditingController;

  NewTodoState(Todo uppgift) {
    this.title = uppgift.title;

    textEditingController = TextEditingController();

    textEditingController.addListener(() {
      setState(() {
        title = textEditingController.text;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIG169 TODO"),
      ),
      body: Center(
          child: Column(
        children: [
          Container(height: 30),
          TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              hintText: "Vad ska du göra?",
              border: OutlineInputBorder(),
            ),
          ),
          Container(height: 30),
          ElevatedButton(
            child: const Text("+ ADD"),
            onPressed: () {
              Navigator.pop(context, Todo(title: title, id: ''));
            },
          ),
        ],
      )),
    );
  }
}
