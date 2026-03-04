import 'dart:convert';
import 'dart:io';
import 'package:rrf/rrf.dart';
import 'package:rrf/rrf_json.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketServer {
  final Object address;
  final int port;
  bool _isRunning = false;
  HttpServer? _httpServer;
  bool get isRunning => _isRunning;
  final MessageDtoJsonConverter _jsonConverter;
  final Executor _internalExecutor;
  final List<WebSocketChannel> _clients = [];

  WebSocketServer(this._jsonConverter, this._internalExecutor, {required this.address, required this.port});

  Future<void> start() async {
    if (_isRunning) {
      return;
    }

    _isRunning = true;
    final handler = webSocketHandler((WebSocketChannel webSocket, String? _) {
      _clients.add(webSocket);
      print('Client connected: ${webSocket.hashCode}');

      webSocket.stream.listen(
        (jsonMessage) async {
          print('Received: $jsonMessage');
          final jsonMessageData = jsonDecode(jsonMessage);
          final message = MessageDto.fromJson(jsonMessageData);
          switch (message.type) {
            case MessageDto.eventType:
              final event = _jsonConverter.messageFromJson(message.data) as Event;
              _internalExecutor.send(event);
              break;
            case MessageDto.requestType:
              final request = _jsonConverter.messageFromJson(message.data) as Request;
              final response = await _internalExecutor.execute(request);
              final responseMessage = MessageDto.response(
                response,
                request,
                message.messageId,
                _jsonConverter,
              );
              final responseMessageJson = responseMessage.toJson();
              print('Sent: $responseMessageJson');
              webSocket.sink.add(jsonEncode(responseMessageJson));
              break;
            default:
              throw ArgumentError();
          }
        },
        onDone: () => print('Client disconnected: ${webSocket.hashCode}'),
        onError: (error) => print('WebSocket error: $error'),
      );
    });

    _httpServer = await serve(handler, 'localhost', 5000);
  }

  Future<void> end() async {
    if (!_isRunning) {
      return;
    }

    _isRunning = false;
    await _httpServer?.close();
  }
}
