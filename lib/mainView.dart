// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './TodoList.dart';
import './NewTodo.dart';
import 'model.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TIG169 TODO"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
              onSelected: (int value) {
                Provider.of<Mystate>(context, listen: false).setFilterBy(value);
              },
              itemBuilder: (context) => [
                    const PopupMenuItem(child: Text('Alla'), value: 1),
                    const PopupMenuItem(child: Text('Klara'), value: 2),
                    const PopupMenuItem(child: Text('Oklara'), value: 3),
                  ]),
        ],
      ),
      body: Consumer<Mystate>(
          builder: (context, state, child) =>
              TodoList(_filterList(state.list, state.filterBy))),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          var nyuppgift = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    NewTodo(Todo(id: '', title: 'Tom uppgift'))),
          );
          if (nyuppgift != null) {
            Provider.of<Mystate>(context, listen: false).adduppgift(nyuppgift);
          }
        },
      ),
    );
  }

  List<Todo> _filterList(list, value) {
    if (value == 1) return list;
    if (value == 2) {
      return list.where((uppgift) => uppgift.done == true).toList();
    }
    if (value == 3) {
      return list.where((uppgift) => uppgift.done == false).toList();
    }
    return list;
  }
}
