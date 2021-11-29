import 'dart:convert';

import 'package:http/http.dart' as http;
import 'model.dart';

const API_KEY = '0bd1173d-226f-415d-ab2f-46c4197c06ad';
const API_URL = 'https://todoapp-api-pyq5q.ondigitalocean.app';

class Api {
  static Future<List<Todo>> addUppgift(Todo uppgift) async {
    Map<String, dynamic> json = Todo.toJson(uppgift);
    var bodyString = jsonEncode(json);
    var response = await http.post(
      Uri.parse('$API_URL/todos?key=$API_KEY'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<Todo>((data) {
      return Todo.fromJson(data);
    }).toList();
  }

  static Future deleteUppgift(String uppgiftId) async {
    var response = await http.delete(
        Uri.parse('$API_URL/todos/$uppgiftId?key=$API_KEY&_confirm=true'));
    var bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<Todo>((data) {
      return Todo.fromJson(data);
    }).toList();
  }

  static Future<List<Todo>> getUppgift() async {
    var response = await http.get(Uri.parse('$API_URL/todos?key=$API_KEY'));
    String bodyString = response.body;
    print(bodyString);
    var json = jsonDecode(bodyString);

    return json.map<Todo>((data) {
      return Todo.fromJson(data);
    }).toList();
  }

  static Future checkuppgift(Todo uppgift) async {
    Map<String, dynamic> json = Todo.toJson(uppgift);
    var bodyString = jsonEncode(json);
    var uppgiftId = uppgift.id;
    var response = await http.put(
      Uri.parse('$API_URL/todos/$uppgiftId?key=$API_KEY'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    bodyString = response.body;
    var list = jsonDecode(bodyString);

    print(bodyString);
    print(uppgiftId);

    return list.map<Todo>((data) {
      return Todo.fromJson(data);
    }).toList();
  }
}
