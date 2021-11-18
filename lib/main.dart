import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './TodoList.dart';
import './NewTodo.dart';
import 'model.dart';

void main() {
  var state = Mystate();
  state.getList();

  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TIG169 TODO"), actions: const [
        IconButton(
            icon: Icon(Icons.menu_outlined), tooltip: 'menu', onPressed: null),
      ]),
      body: Consumer<Mystate>(
          builder: (context, state, child) => TodoList(state.list)),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () async {
          var Nyuppgift = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewTodo(Todo(message: 'Tom uppgift'))),
          );

          if (NewTodo != null) {
            Provider.of<Mystate>(context, listen: false).adduppgift(Nyuppgift);
          }
        },
      ),
    );
  }
}
