import 'package:rrf/rrf_json.dart';
import 'package:relathy_shared/application_layer/app_module/messages/auth.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
import 'package:relathy_shared/domain_layer/core_module/data/content.dart';
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
      resultJsonConverterCollection: ResultJsonConverterCollection([
        ResultJsonConverter.create<ImmutableContent>(
          (json) => ImmutableContent.fromJson(json),
          (x) => x.toJson(),
        ),
        ResultJsonConverter.create<ImmutableContent?>(
          (json) => json != null ? ImmutableContent.fromJson(json) : null,
          (x) => x?.toJson(),
        ),
        ResultJsonConverter.create<List<ImmutableWebObject?>>(
          (json) => (json as List).map((x) => x != null ? ImmutableWebObject.fromJson(x) : null).toList(),
          (x) => x.map((o) => o?.toJson()).toList(),
        ),
      ]),
      messageJsonConverterCollection: TypeJsonConverterCollection([
        TypeJsonConverter.create((json) => AuthSendOtp.fromJson(json)),
        TypeJsonConverter.create((json) => AuthVerifyOtp.fromJson(json)),
      ]),
    );
  }
}
