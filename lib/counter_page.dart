import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Center(
        child: Text(
          "contador aqui",
          style: Theme.of(context).textTheme.display1,
        ),
      ),
    );
  }
}
