import 'dart:async';

final counterBloc = CounterBloc();

class CounterBloc {

  // -- Singleton --
  static final CounterBloc _instance = new CounterBloc._internal();
  factory CounterBloc(){
    return _instance;
  }
  CounterBloc._internal();
  // -- Singleton --

  int _counter = 0;

  final _controller = StreamController<int>.broadcast();
  get stream => _controller.stream;

  get counter => _counter;

  void increment() {
    _counter++;

    _controller.sink.add(_counter);
  }

  void close() {
    _controller.close();
  }
}