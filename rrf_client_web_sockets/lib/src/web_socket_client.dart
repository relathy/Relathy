import 'dart:async';
import 'dart:convert';
import 'package:rrf/rrf.dart';
import 'package:rrf/rrf_json.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class _PendingResponse {
  final Request request;
  final Completer<Response> completer = Completer<Response>();

  _PendingResponse(this.request);
}

class WebSocketClient implements Executor {
  final Uri uri;
  bool _isRunning = false;
  WebSocketChannel? _channel;
  bool get isRunning => _isRunning;
  final _pendingResponses = <String, _PendingResponse>{};
  final MessageDtoJsonConverter _jsonConverter;

  WebSocketClient(this.uri, this._jsonConverter);

  Future<void> start() async {
    if (_isRunning) {
      return;
    }

    _isRunning = true;
    final channel = _channel = WebSocketChannel.connect(uri);
    await channel.ready;
    channel.stream.listen(_onMessage, onError: _onError, onDone: _onDone);
  }

  @override
  void send(Event event) {
    if (!_isRunning) {
      throw StateError("is not running");
    }

    final message = MessageDto.event(event, _jsonConverter);
    _channel!.sink.add(jsonEncode(message));
  }

  @override
  Future<Response<TResult>> execute<TResult>(Request<TResult> request) async {
    if (!_isRunning) {
      throw StateError("is not running");
    }

    final message = MessageDto.request(request, _jsonConverter);
    final pendingResponse = _PendingResponse(request);
    _pendingResponses[message.messageId] = pendingResponse;
    _channel!.sink.add(jsonEncode(message));
    final result = await pendingResponse.completer.future;
    return result as Response<TResult>;
  }

  void _onMessage(dynamic jsonMessage) {
    print(jsonMessage);
    final jsonMessageData = json.decode(jsonMessage);
    final message = MessageDto.fromJson(jsonMessageData);
    switch (message.type) {
      case MessageDto.eventType:
        throw UnimplementedError();
      case MessageDto.responseType:
        final pendingResponse = _pendingResponses[message.messageId]!;
        _pendingResponses.remove(message.messageId);
        final response = _jsonConverter.responseFromJson(pendingResponse.request, message.data);
        pendingResponse.completer.complete(response);
        break;
      default:
        throw ArgumentError();
    }
  }

  void _onError(dynamic error) {
    print('WebSocket error: $error');
    for (final x in _pendingResponses.values) {
      x.completer.completeError(error);
    }
    _pendingResponses.clear();
  }

  void _onDone() {
    print('WebSocket connection closed');
    for (final x in _pendingResponses.values) {
      x.completer.completeError('Connection closed');
    }
    _pendingResponses.clear();
  }

  Future<void> end() async {
    if (!_isRunning) {
      return;
    }

    _isRunning = false;
    _channel?.sink.close();
    _channel = null;
  }
}
