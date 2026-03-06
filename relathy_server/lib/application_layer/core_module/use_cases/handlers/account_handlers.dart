import 'package:relathy_shared/application_layer/core_module/messages/account.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
import 'package:rrf/rrf_server.dart';
import 'package:rrf/rrf.dart';

class CreateAccountHandler implements CommandHandler<CreateAccount, ObjectId> {
  CreateAccountHandler();

  @override
  Future<Response<ObjectId>> handle(CreateAccount command) async {
    var accountId = ObjectId.generate();

    return SuccessResponse(accountId);
  }
}
