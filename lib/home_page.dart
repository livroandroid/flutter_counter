import 'package:flutter/material.dart';
import 'package:flutter_counter/counter_bloc.dart';
import 'package:flutter_counter/counter_page.dart';
import 'package:scoped_model/scoped_model.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final CounterBloc _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _onClickCounter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              StreamBuilder<int>(
                stream: _bloc.stream,
                builder: (context, snapshot) {
                  int count = snapshot.hasData ? snapshot.data : 0;
                  print("> $count");
                  return Text(
                    '$count',
                    style: Theme.of(context).textTheme.display1,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClickIncrement,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void _onClickIncrement() {
    _bloc.increment();
  }

  void _onClickCounter() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CounterPage(),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }
}
