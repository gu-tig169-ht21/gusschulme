import 'package:flutter/material.dart';
import 'api.dart';

class Todo {
  String id;
  String title;
  bool done;

  Todo({required this.id, required this.title, this.done = false});

  void toggleDone(Todo uppgift) {
    done = !done;
  }

  static Map<String, dynamic> toJson(Todo uppgift) {
    return {
      'title': uppgift.title,
      'done': (uppgift.done),
    };
  }

  static Todo fromJson(Map<String, dynamic> json) {
    return Todo(id: json['id'], title: json['title'], done: json['done']);
  }
}

class Mystate extends ChangeNotifier {
  List<Todo> _list = [];
  int _filterBy = 1;

  List<Todo> get list => _list;

  int get filterBy => _filterBy;

  Future getList() async {
    List<Todo> list = await Api.getUppgift();
    _list = list;
    notifyListeners();
  }

  void adduppgift(Todo uppgift) async {
    _list = await Api.addUppgift(uppgift);
    notifyListeners();
  }

  void removeuppgift(Todo uppgift) async {
    _list = await Api.deleteUppgift(uppgift.id);
    notifyListeners();
  }

  void checkuppgift(Todo activity) async {
    activity.toggleDone(activity);
    _list = await Api.checkuppgift(activity);
    notifyListeners();
  }

  void setFilterBy(int filterBy) async {
    _filterBy = filterBy;
    notifyListeners();
  }
}
