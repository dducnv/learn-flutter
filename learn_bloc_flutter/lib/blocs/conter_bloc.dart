import 'dart:async';

class CounterBloc {
  final _stateStreanController = StreamController<int>();

  StreamSink<int> get _inCounter => _stateStreanController.sink;
  Stream<int> get counterStream => _stateStreanController.stream;

}
