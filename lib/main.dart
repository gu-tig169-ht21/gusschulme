import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';
import 'mainView.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainView(),
    );
  }
}
