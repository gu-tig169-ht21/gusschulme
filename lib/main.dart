import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(MyApp());
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
      body: Center(
        child: Column(
          children: [
            Container(height: 15),
            item("Plugg", false),
            const Divider(),
            item("Jobb", true),
            const Divider(),
            item("Handla mat", false),
            const Divider(),
            item("Träna", true),
            const Divider(),
            item("Programmering", false),
            const Divider(),
            item("Tandläkaren", false),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondView()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget item(String attGora, bool klart) {
    return ListTile(
      leading: Checkbox(
        value: klart,
        onChanged: (val) {},
      ),
      title: Text(attGora, style: _textstyle(klart)),
      trailing: Icon(Icons.delete),
    );
  }

  TextStyle _textstyle(klart) {
    if (klart) {
      return TextStyle(fontSize: 24, decoration: TextDecoration.lineThrough);
    } else {
      return TextStyle(fontSize: 24);
    }
  }
}

class SecondView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIG169 TODO"),
      ),
      body: Center(
          child: Column(
        children: [
          Container(height: 30),
          _quizrow(),
          Container(height: 30),
          _addrow(),
        ],
      )),
    );
  }

  Widget _quizrow() {
    return Container(
      height: 50,
      width: 351,
      padding: EdgeInsets.only(left: 10),
      decoration:
          BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
      child: TextField(
        decoration: InputDecoration(hintText: "What to do?"),
      ),
    );
  }

  Widget _addrow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.add, size: 18),
        Text("ADD", style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
