import 'package:rrf/rrf.dart';

typedef EventCallback = void Function(Event event);

abstract interface class ReadOnlyEventCallbackCollection {
  void invoke(Event event);
}

class EventCallbackCollection implements ReadOnlyEventCallbackCollection {
  final List<EventCallback> _callbacks = [];

  void add(EventCallback callback) {
    _callbacks.add(callback);
  }

  void remove(EventCallback callback) {
    _callbacks.remove(callback);
  }

  @override
  void invoke(Event event) {
    for (final callback in _callbacks) {
      callback(event);
    }
  }
}
