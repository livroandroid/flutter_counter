import 'package:flutter/material.dart';
import 'package:flutter_counter/home_page.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  final Store<int> store;

  const MyApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}