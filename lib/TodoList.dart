// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class TodoList extends StatelessWidget {
  final List<Todo> list;

  TodoList(this.list);

  Widget build(BuildContext context) {
    return ListView(
        children:
            list.map((uppgift) => _uppgiftitem(context, uppgift)).toList());
  }

  Widget _uppgiftitem(context, uppgift) {
    var state = Provider.of<Mystate>(context, listen: false);
    return CheckboxListTile(
      title: Text(uppgift.title,
          style: TextStyle(
              decoration: uppgift.done ? TextDecoration.lineThrough : null)),
      secondary: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          var state = Provider.of<Mystate>(context, listen: false);
          state.removeuppgift(uppgift);
        },
      ),
      controlAffinity: ListTileControlAffinity.leading,
      value: uppgift.done,
      onChanged: (value) {
        state.checkuppgift(uppgift);
      },
    );
  }
}
