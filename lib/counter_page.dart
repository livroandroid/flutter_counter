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
        child: StoreConnector<int, int>(
          converter: (store) => store.state,
          builder: (context, count) {
            return Text(
              "$count",
              style: Theme.of(context).textTheme.display1,
            );
          },
        ),
      ),
    );
  }
}
