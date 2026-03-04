import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rrf/rrf.dart';
import 'package:rrf/src/json/rrf_json_converter.dart';
import 'package:uuid/uuid.dart';
part 'rrf_dtos.freezed.dart';
part 'rrf_dtos.g.dart';

@freezed
abstract class MessageDto with _$MessageDto {
  static const uuid = Uuid();
  static const eventType = "Event";
  static const requestType = "Request";
  static const responseType = "Response";

  const factory MessageDto({
    required String type,
    required Map<String, dynamic> data,
    required String messageId,
  }) = _MessageDto;

  factory MessageDto.fromJson(Map<String, Object?> json) => _$MessageDtoFromJson(json);

  factory MessageDto.request(Request request, MessageDtoJsonConverter jsonConverter) =>
      MessageDto(type: requestType, data: jsonConverter.messageToJson(request), messageId: uuid.v4());

  factory MessageDto.event(Event event, MessageDtoJsonConverter jsonConverter) =>
      MessageDto(type: eventType, data: jsonConverter.messageToJson(event), messageId: uuid.v4());

  factory MessageDto.response(
    Response response,
    Request request,
    String messageId,
    MessageDtoJsonConverter jsonConverter,
  ) => MessageDto(
    type: responseType,
    data: jsonConverter.responseToJson(request, response),
    messageId: messageId,
  );
}
