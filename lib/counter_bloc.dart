import 'package:rxdart/rxdart.dart';

class CounterBloc {
  int _counter = 0;

  final _controller = BehaviorSubject<int>();
  get stream => _controller.stream;

  CounterBloc() {
    print("CounterBloc()");
  }

  void increment() {
    _counter++;
    print("increment");
    _controller.sink.add(_counter);
  }

  void close() {
    print("close");
    _controller.close();
  }
}