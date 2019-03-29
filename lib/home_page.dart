import 'package:flutter/material.dart';
import 'package:flutter_counter/counter_page.dart';
import 'package:flutter_counter/redux/counter_actions.dart';
import 'package:flutter_redux/flutter_redux.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

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
              StoreConnector<int, int>(
                converter: (store) => store.state,
                builder: (context, count) {
                  return Text(
                    "$count",
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
    final store = StoreProvider.of<int>(context);
    store.dispatch(CounterActions.Increment);
  }

  void _onClickCounter() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CounterPage()));
  }
}
