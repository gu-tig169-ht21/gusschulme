import 'package:flutter/material.dart';

class Todo {
  String message;
  Todo({required this.message});
}

class Mystate extends ChangeNotifier {
  final List<Todo> _list = [];

  List<Todo> get list => _list;

  void adduppgift(Todo uppgift) {
    _list.add(uppgift);
    notifyListeners();
  }

  void getList() {}

  void removeuppgift(Todo uppgift) {
    _list.remove(uppgift);
    notifyListeners();
  }
}

class checkbox extends StatefulWidget {
  const checkbox({Key? key}) : super(key: key);

  @override
  State<checkbox> createState() => checkboxState();
}

class checkboxState extends State<checkbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
