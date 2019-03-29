import 'package:flutter/material.dart';
import 'package:flutter_counter/bloc_provider.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of(context).bloc;

    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Center(
        child: StreamBuilder<int>(
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
}
