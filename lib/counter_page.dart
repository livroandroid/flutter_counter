import 'package:flutter/material.dart';
import 'package:flutter_counter/counter_bloc.dart';
import 'package:scoped_model/scoped_model.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final CounterBloc _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _bloc.stream,
          builder: (context, snapshot) {
            int count = snapshot.hasData ? snapshot.data : 0;
            print("> $count");
            return Text(
              'Este counter não funciona.\nVeja próxima aula. $count',
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
    _bloc.close();
  }
}
