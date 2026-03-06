import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
import 'package:relathy_shared/domain_layer/core_module/models/webverse_model.dart';

abstract class WebverseLinks {
  static final webversePublishedToolVersion = createLink(
    toolId: WebverseToolIds.webverse,
    objectId: WebversePublishedToolVersionIds.webverse_1_0_0,
  );
  static final objectPublishedModelVersion = createLink(
    toolId: WebverseToolIds.webverse,
    objectId: WebversePublishedToolVersionIds.webverse_1_0_0,
  );
  static final osPublishedModelVersion = createLink(
    toolId: WebverseToolIds.webverse,
    objectId: WebversePublishedModelVersionIds.os_1_0_0,
  );

  static String createWebverseToolLink({required ObjectId id}) =>
      createLink(toolId: WebverseToolIds.webverse, objectId: id);

  static String createLink({required ToolId toolId, required ObjectId? objectId}) =>
      objectId != null ? 'webverse.link/$toolId/$objectId' : 'webverse.link/$toolId';
}

abstract class Webnames {
  static final webverse = "Webverse (000-000-000)";
}

abstract class WorldLinks {
  static final webverse = "000-000-000-webverse.webverse.world";

  static String createLink({required String name, required String coordinates}) =>
      '$coordinates-${_toValidLinkName(name)}.webverse.world';
}

abstract class CitizenLinks {
  static final webverse = "000-000-000-webverse.webverse.me";

  static String createLink({required String name, required String coordinates}) =>
      '$coordinates-${_toValidLinkName(name)}.webverse.me';
}

// abstract class ExternalCitizenLinks {
//   static final webverse = createLink(name: "000-000-000-webverse");

//   static String createLink({required String name}) => '${_toValidLinkName(name)}.webverse.id';
// }

String _toValidLinkName(String name) => name.replaceAll(" ", "").toLowerCase();
