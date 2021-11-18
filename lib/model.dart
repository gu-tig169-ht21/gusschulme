import 'package:flutter/material.dart';

class Todo {
  String message;
  late bool klar;
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
