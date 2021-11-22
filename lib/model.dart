import 'package:flutter/material.dart';

class Todo {
  String message;
  bool klar;
  Todo({required this.message, this.klar = false});

  void toggleDone(Todo uppgift) {
    klar = !klar;
  }
}

class Mystate extends ChangeNotifier {
  final List<Todo> _list = [];

  List<Todo> get list => _list;

  int get filterBy => _filterBy;

  void adduppgift(Todo uppgift) {
    _list.add(uppgift);
    notifyListeners();
  }

  void getList() {}

  void removeuppgift(Todo uppgift) {
    _list.remove(uppgift);
    notifyListeners();
  }

    void klar(Todo uppgift) {
    uppgift.toggleDone(uppgift);
    notifyListeners();
  }

  void setFilterBy(int filterBy) async {
    _filterBy = filterBy;
    notifyListeners();
  }
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
