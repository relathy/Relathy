import 'package:rrf/rrf_json.dart';
import 'package:rrf/rrf.dart';

abstract class AppJsonConverterFactory {
  static MessageDtoJsonConverter create() {
    return MessageDtoJsonConverter(
      exceptionJsonConverterCollection: TypeJsonConverterCollection([
        TypeJsonConverter.create((json) => ValidationClientError.fromJson(json)),
        TypeJsonConverter.create((json) => InternalAppError.fromJson(json)),
        TypeJsonConverter.create((json) => InternalClientError.fromJson(json)),
        TypeJsonConverter.create((json) => InternalServerError.fromJson(json)),
        TypeJsonConverter.create((json) => DataNotFoundException.fromJson(json)),
        TypeJsonConverter.create((json) => NetworkAppException.fromJson(json)),
        TypeJsonConverter.create((json) => AuthenticationClientException.fromJson(json)),
        TypeJsonConverter.create((json) => AuthorizationClientException.fromJson(json)),
      ]),
      resultJsonConverterCollection: ResultJsonConverterCollection([]),
      messageJsonConverterCollection: TypeJsonConverterCollection([]),
    );
  }
}
