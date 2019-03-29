import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class CounterModel extends Model {
  static CounterModel of(BuildContext context) =>
      ScopedModel.of<CounterModel>(context);

  int _counter = 0;

  int get counter => _counter;

  void increment() {
    // First, increment the counter
    _counter++;

    // Then notify all the listeners.
    notifyListeners();
  }
}