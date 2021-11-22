import 'package:flutter/material.dart';

class Todo {
  String? title;
  bool done;

  Todo({this.title, this.done = false});

  void toggleDone(Todo uppgift) {
    done = !done;
  }
}

class Mystate extends ChangeNotifier {
  List<Todo> _list = [];
  int _filterBy = 1;

  List<Todo> get list => _list;

  int get filterBy => _filterBy;

  void adduppgift(Todo uppgift) {
    _list.add(uppgift);
    notifyListeners();
  }

  void removeuppgift(Todo uppgift) {
    _list.remove(uppgift);
    notifyListeners();
  }

  void done(Todo uppgift) {
    uppgift.toggleDone(uppgift);
    notifyListeners();
  }

  void setFilterBy(int filterBy) async {
    _filterBy = filterBy;
    notifyListeners();
  }
}
