import 'package:flutter/material.dart';
import 'package:flutter_counter/home_page.dart';
import 'package:flutter_counter/redux/reducers.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  // Create your store as a final variable in a base Widget. This works better
  // with Hot Reload than creating it directly in the `build` function.
  final store = new Store<int>(counterReducer, initialState: 0);

  runApp(new MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  final Store<int> store;

  const MyApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}