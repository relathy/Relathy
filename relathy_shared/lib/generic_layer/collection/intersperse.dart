Iterable<T> _intersperse<T>(T element, Iterable<T> iterable) sync* {
  final iterator = iterable.iterator;
  if (iterator.moveNext()) {
    yield iterator.current;
    while (iterator.moveNext()) {
      yield element;
      yield iterator.current;
    }
  }
}

Iterable<T> _intersperseOuter<T>(T element, Iterable<T> iterable) sync* {
  final iterator = iterable.iterator;
  if (iterable.isNotEmpty) {
    yield element;
  }
  while (iterator.moveNext()) {
    yield iterator.current;
    yield element;
  }
}

extension IntersperseExtensions<T> on Iterable<T> {
  Iterable<T> intersperse(T element) {
    return _intersperse(element, this);
  }

  Iterable<T> intersperseOuter(T element) {
    return _intersperseOuter(element, this);
  }
}
