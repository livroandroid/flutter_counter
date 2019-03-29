import 'package:flutter/material.dart';
import 'package:flutter_counter/counter_model.dart';
import 'package:flutter_counter/counter_page.dart';
import 'package:scoped_model/scoped_model.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
              ScopedModelDescendant<CounterModel>(
                builder: (context, child, model) {
                  int count = model.counter;
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
    final model = CounterModel.of(context);
    model.increment();
  }

  void _onClickCounter() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CounterPage(),
    ));
  }
}
