import 'dart:async';

class CounterBloc {

  int _counter = 0;

  final _controller = StreamController<int>();
  get stream => _controller.stream;

  void increment() {
    _counter++;

    _controller.sink.add(_counter);
  }

  void close() {
    _controller.close();
  }
}