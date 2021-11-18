// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class TodoList extends StatelessWidget {
  final List<Todo> list;

  TodoList(this.list);
  bool klar = false;

  Widget build(BuildContext context) {
    return ListView(
        children:
            list.map((uppgift) => _uppgiftitem(context, uppgift)).toList());
  }

  Widget _uppgiftitem(context, uppgift) {
    return ListTile(
      leading: const checkbox(),
      title: Text(uppgift.message),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          var state = Provider.of<Mystate>(context, listen: false);
          state.removeuppgift(uppgift);
        },
      ),
    );
  }
}
