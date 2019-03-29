import 'package:flutter/material.dart';
import 'package:flutter_counter/counter_bloc.dart';

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
        child: StreamBuilder<int>(
          initialData: counterBloc.counter,
          stream: counterBloc.stream,
          builder: (context, snapshot) {
            int count = snapshot.hasData ? snapshot.data : 0;
            print("> $count");
            return Text(
              '$count',
              style: Theme.of(context).textTheme.display1,
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
