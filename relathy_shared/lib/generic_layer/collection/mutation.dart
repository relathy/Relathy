import 'dart:collection';
import 'dart:math';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

abstract interface class ReadOnlyList<E> implements Iterable<E> {
  E operator [](int index);

  int indexOf(E element, [int start = 0]);
  int lastIndexOf(E element, [int? start]);
}

abstract interface class ObservableReadOnlyList<E> implements ReadOnlyList<E> {
  Dispose observe(Listener<ListChange<E>> listener, {bool fireImmediately = false});
}

class PlainList<E> extends ListMixin<E> implements ReadOnlyList<E> {
  final List<E> _inner;

  PlainList.of([Iterable<E>? items]) : _inner = List<E>.of(items ?? const []);

  factory PlainList.fromJson(List<dynamic> json, E Function(Object? item) fromJsonE) =>
      PlainList.of(json.map(fromJsonE));

  List<dynamic> toJson(Object? Function(E item) toJsonE) => _inner.map(toJsonE).toList(growable: false);

  @override
  int get length => _inner.length;

  @override
  set length(int newLength) => _inner.length = newLength;

  @override
  E operator [](int index) => _inner[index];

  @override
  void operator []=(int index, E value) => _inner[index] = value;

  ImmutableList<E> toImmutableList() => ImmutableList.of(_inner);

  ImmutableList<E1> mapToImmutableList<E1>(E1 Function(E) mapper) => ImmutableList.of(_inner.map(mapper));
}

class MutableList<E> extends ListBase<E> implements ObservableReadOnlyList<E> {
  final ObservableList<E> _inner;

  const MutableList._(this._inner);
  MutableList() : this._(ObservableList<E>());
  MutableList.of(Iterable<E> items) : this._(ObservableList<E>.of(items));

  factory MutableList.fromJson(List<dynamic> json, E Function(Object? item) fromJsonE) =>
      MutableList.of(json.map(fromJsonE));

  List<dynamic> toJson(Object? Function(E item) toJsonE) => _inner.map(toJsonE).toList(growable: false);

  @override
  int get length => _inner.length;

  @override
  set length(int newLength) => _inner.length = newLength;

  @override
  E operator [](int index) => _inner[index];

  @override
  void operator []=(int index, E value) => _inner[index] = value;

  @override
  void add(E element) => _inner.add(element);

  @override
  void addAll(Iterable<E> iterable) => _inner.addAll(iterable);

  @override
  void insert(int index, E element) => _inner.insert(index, element);

  @override
  void insertAll(int index, Iterable<E> iterable) => _inner.insertAll(index, iterable);

  @override
  bool remove(Object? element) => _inner.remove(element);

  @override
  E removeAt(int index) => _inner.removeAt(index);

  @override
  E removeLast() => _inner.removeLast();

  @override
  void removeRange(int start, int end) => _inner.removeRange(start, end);

  @override
  void removeWhere(bool Function(E element) test) => _inner.removeWhere(test);

  @override
  void retainWhere(bool Function(E element) test) => _inner.retainWhere(test);

  @override
  void clear() => _inner.clear();

  @override
  void setAll(int index, Iterable<E> iterable) => _inner.setAll(index, iterable);

  @override
  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) =>
      _inner.setRange(start, end, iterable, skipCount);

  @override
  void replaceRange(int start, int end, Iterable<E> newContents) =>
      _inner.replaceRange(start, end, newContents);

  @override
  void fillRange(int start, int end, [E? fill]) => _inner.fillRange(start, end, fill);

  @override
  void sort([int Function(E a, E b)? compare]) => _inner.sort(compare);

  @override
  void shuffle([Random? random]) => _inner.shuffle(random);

  @override
  Dispose observe(Listener<ListChange<E>> listener, {bool fireImmediately = false}) =>
      _inner.observe(listener, fireImmediately: fireImmediately);

  ImmutableList<E> toImmutableList() => ImmutableList.of(_inner);

  ImmutableList<E1> mapToImmutableList<E1>(E1 Function(E) mapper) => ImmutableList.of(_inner.map(mapper));
}

class ImmutableList<E> with IterableBase<E> implements ReadOnlyList<E> {
  const ImmutableList.empty() : this(const []);
  const ImmutableList(this._inner);
  final List<E> _inner;

  factory ImmutableList.of([Iterable<E>? items]) => ImmutableList(items?.toList(growable: false) ?? const []);

  factory ImmutableList.fromJson(List<dynamic> json, E Function(Object? item) fromJsonE) =>
      ImmutableList.of(json.map(fromJsonE));

  List<dynamic> toJson(Object? Function(E item) toJsonE) => _inner.map(toJsonE).toList(growable: false);

  @override
  int get length => _inner.length;

  @override
  E operator [](int index) => _inner[index];

  @override
  Iterator<E> get iterator => _inner.iterator;

  @override
  int indexOf(E element, [int start = 0]) => _inner.indexOf(element, start);

  @override
  int lastIndexOf(E element, [int? start]) => _inner.lastIndexOf(element, start);

  PlainList<E> toPlainList() => PlainList.of(_inner);
  MutableList<E> toMutableList() => MutableList.of(_inner);

  PlainList<E1> mapToPlainList<E1>(E1 Function(E) mapper) => PlainList.of(_inner.map(mapper));
  MutableList<E1> mapToMutableList<E1>(E1 Function(E) mapper) => MutableList.of(_inner.map(mapper));

  int indexWhere(bool Function(E element) predicate) => _inner.indexWhere(predicate);
}

extension ListExtension<T> on List<T> {
  void replaceOrAdd(bool Function(T) predicate, T value) {
    var contextIndex = indexWhere((x) => predicate(value));
    if (contextIndex == -1) {
      add(value);
    } else {
      this[contextIndex] = value;
    }
  }
}

abstract interface class ReadOnlyMap<K, V> {
  V? operator [](Object? key);

  bool containsKey(Object? key);
  bool containsValue(Object? value);

  Iterable<K> get keys;
  Iterable<V> get values;
  Iterable<MapEntry<K, V>> get entries;

  int get length;
  bool get isEmpty;
  bool get isNotEmpty;
}

extension ReadOnlyMapExtension<K, V> on ReadOnlyMap<K, V> {}

abstract interface class ObservableReadOnlyMap<K, V> implements ReadOnlyMap<K, V> {
  Dispose observe(Listener<MapChange<K, V>> listener, {bool fireImmediately = false});
}

class PlainMap<K, V> extends MapMixin<K, V> implements ReadOnlyMap<K, V> {
  final Map<K, V> _inner;

  PlainMap.of([Map<K, V>? items]) : _inner = Map<K, V>.of(items ?? const {});

  factory PlainMap.fromJson(
    Map<String, dynamic> json, {
    required K Function(String key) fromJsonK,
    required V Function(Object? value) fromJsonV,
  }) => PlainMap.of(json.map((k, v) => MapEntry(fromJsonK(k), fromJsonV(v))));

  Map<String, dynamic> toJson({
    required String Function(K key) toJsonK,
    required Object? Function(V value) toJsonV,
  }) => _inner.map((k, v) => MapEntry(toJsonK(k), toJsonV(v)));

  @override
  V? operator [](Object? key) => _inner[key];

  @override
  void operator []=(K key, V value) => _inner[key] = value;

  @override
  void clear() => _inner.clear();

  @override
  Iterable<K> get keys => _inner.keys;

  @override
  Iterable<V> get values => _inner.values;

  @override
  Iterable<MapEntry<K, V>> get entries => _inner.entries;

  @override
  V? remove(Object? key) => _inner.remove(key);

  @override
  int get length => _inner.length;

  @override
  bool get isEmpty => _inner.isEmpty;

  @override
  bool get isNotEmpty => _inner.isNotEmpty;

  ImmutableMap<K, V> toImmutableMap() => ImmutableMap.of(_inner);

  ImmutableMap<K1, V1> mapToImmutableMap<K1, V1>(MapEntry<K1, V1> Function(K, V) mapper) =>
      ImmutableMap.of(_inner.map(mapper));
}

class MutableMap<K, V> extends MapBase<K, V> implements ObservableReadOnlyMap<K, V> {
  final ObservableMap<K, V> _inner;

  const MutableMap._(this._inner);
  MutableMap() : this._(ObservableMap<K, V>());
  MutableMap.of(Map<K, V> items) : this._(ObservableMap<K, V>.of(items));

  factory MutableMap.fromJson(
    Map<String, dynamic> json, {
    required K Function(String key) fromJsonK,
    required V Function(Object? value) fromJsonV,
  }) => MutableMap.of(json.map((k, v) => MapEntry(fromJsonK(k), fromJsonV(v))));

  Map<String, dynamic> toJson({
    required String Function(K key) toJsonK,
    required Object? Function(V value) toJsonV,
  }) => _inner.map((k, v) => MapEntry(toJsonK(k), toJsonV(v)));

  // ---- MapBase core ----
  @override
  V? operator [](Object? key) => _inner[key];

  @override
  void operator []=(K key, V value) => _inner[key] = value;

  @override
  void clear() => _inner.clear();

  @override
  Iterable<K> get keys => _inner.keys;

  @override
  V? remove(Object? key) => _inner.remove(key);

  @override
  int get length => _inner.length;

  @override
  bool get isEmpty => _inner.isEmpty;

  @override
  bool get isNotEmpty => _inner.isNotEmpty;

  @override
  Iterable<V> get values => _inner.values;

  @override
  Iterable<MapEntry<K, V>> get entries => _inner.entries;

  @override
  void addAll(Map<K, V> other) => _inner.addAll(other);

  @override
  void addEntries(Iterable<MapEntry<K, V>> newEntries) => _inner.addEntries(newEntries);

  @override
  Dispose observe(Listener<MapChange<K, V>> listener, {bool fireImmediately = false}) =>
      _inner.observe(listener, fireImmediately: fireImmediately);

  ImmutableMap<K, V> toImmutableMap() => ImmutableMap.of(_inner);

  ImmutableMap<K1, V1> mapToImmutableMap<K1, V1>(MapEntry<K1, V1> Function(K, V) mapper) =>
      ImmutableMap.of(_inner.map(mapper));
}

class ImmutableMap<K, V> implements ReadOnlyMap<K, V> {
  const ImmutableMap.empty() : this(const {});
  const ImmutableMap(this._inner);
  final Map<K, V> _inner;

  factory ImmutableMap.of([Map<K, V>? items]) => ImmutableMap(Map<K, V>.unmodifiable(items ?? const {}));

  factory ImmutableMap.fromJson(
    Map<String, dynamic> json, {
    required K Function(String key) fromJsonK,
    required V Function(Object? value) fromJsonV,
  }) => ImmutableMap.of(json.map((k, v) => MapEntry(fromJsonK(k), fromJsonV(v))));

  Map<String, dynamic> toJson({
    required String Function(K key) toJsonK,
    required Object? Function(V value) toJsonV,
  }) => _inner.map((k, v) => MapEntry(toJsonK(k), toJsonV(v)));

  @override
  V? operator [](Object? key) => _inner[key];

  Map<K, V> toMap() => Map<K, V>.of(_inner);

  @override
  bool containsKey(Object? key) => _inner.containsKey(key);

  @override
  bool containsValue(Object? value) => _inner.containsValue(value);

  @override
  Iterable<K> get keys => _inner.keys;

  @override
  Iterable<V> get values => _inner.values;

  @override
  Iterable<MapEntry<K, V>> get entries => _inner.entries;

  @override
  int get length => _inner.length;

  @override
  bool get isEmpty => _inner.isEmpty;

  @override
  bool get isNotEmpty => _inner.isNotEmpty;

  PlainMap<K, V> toPlainMap() => PlainMap.of(_inner);
  MutableMap<K, V> toMutableMap() => MutableMap.of(_inner);

  PlainMap<K1, V1> mapToPlainMap<K1, V1>(MapEntry<K1, V1> Function(K, V) mapper) =>
      PlainMap<K1, V1>.of(_inner.map(mapper));

  MutableMap<K1, V1> mapToMutableMap<K1, V1>(MapEntry<K1, V1> Function(K, V) mapper) =>
      MutableMap<K1, V1>.of(_inner.map(mapper));

  Map<K1, V1> map<K1, V1>(MapEntry<K1, V1> Function(K, V) mapper) => _inner.map(mapper);
}

abstract class ArgsHelper {
  static MutableList<T> toMutableList<T>(Iterable<T>? list) =>
      list is MutableList<T> ? list : MutableList.of(list ?? []);

  static MutableMap<K, V> toMutableMap<K, V>(Map<K, V>? map) =>
      map is MutableMap<K, V> ? map : MutableMap.of(map ?? {});

  static MutableMap<K, MutableList<V>> toMutableMapWithList<K, V>(Map<K, List<V>>? map) {
    if (map is MutableMap<K, MutableList<V>>) {
      return map;
    }
    final result = MutableMap<K, MutableList<V>>();
    if (map == null) return result;
    for (final x in map.entries) {
      result[x.key] = MutableList.of(x.value);
    }
    return result;
  }
}

class ImmutableListConverter<T> implements JsonConverter<ImmutableList<T>, List<T>> {
  const ImmutableListConverter();

  @override
  ImmutableList<T> fromJson(List<T> json) => ImmutableList.of(json);

  @override
  List<T> toJson(ImmutableList<T> object) => object.toList(growable: false);
}

class NullableImmutableListConverter<T> implements JsonConverter<ImmutableList<T>?, List<T>?> {
  const NullableImmutableListConverter();

  @override
  ImmutableList<T>? fromJson(List<T>? json) => json == null ? null : ImmutableList.of(json);

  @override
  List<T>? toJson(ImmutableList<T>? object) => object?.toList(growable: false);
}

class ImmutableStringKeyMapConverter<V> implements JsonConverter<ImmutableMap<String, V>, Map<String, V>> {
  const ImmutableStringKeyMapConverter();

  @override
  ImmutableMap<String, V> fromJson(Map<String, V> json) => ImmutableMap.of(json);

  @override
  Map<String, V> toJson(ImmutableMap<String, V> object) => object.map((k, v) => MapEntry(k, v));
}

class ImmutableStringObjectMapConverter extends ImmutableStringKeyMapConverter<Object> {
  const ImmutableStringObjectMapConverter();
}
