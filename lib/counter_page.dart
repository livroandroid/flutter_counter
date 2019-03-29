import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/counter_bloc.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Center(
        child: BlocBuilder<CounterEvent, int>(
            bloc: counterBloc,
            builder: (context, int state) {
              int count = state;
              print("> $count");
              return Text(
                '$count',
                style: Theme.of(context).textTheme.display1,
              );
            }
        ),
      ),
    );
  }
}
