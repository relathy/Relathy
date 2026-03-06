import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
import 'package:relathy_shared/domain_layer/core_module/data/system_property_types.dart';
import 'package:relathy_shared/generic_layer/flags/flags.dart';

abstract class OSModelIds {
  static const os = ObjectId("3977b4ad-f70c-4990-9a93-31eb89a7780d");
}

abstract class OSPhaseIds {
  static const publishedOS = ObjectId(
    Flags.isDebug
        ? "publishedOS [Type] b6ae268d-f634-4c61-adbb-249c656dbf29"
        : "b6ae268d-f634-4c61-adbb-249c656dbf29",
  );
}

abstract class OSRoleIds {
  static const osRole = ObjectId(
    Flags.isDebug
        ? "osRole [Type] 945dd6ca-ed18-44a2-b9d3-9307f04b154c"
        : "945dd6ca-ed18-44a2-b9d3-9307f04b154c",
  );
}

abstract class OSTypeIds {
  static const user = ObjectId(
    Flags.isDebug
        ? "user [Type] 0598016d-a64b-44d0-9124-01136b907287"
        : "0598016d-a64b-44d0-9124-01136b907287",
  );

  static const personalOS = ObjectId(
    Flags.isDebug
        ? "personalOS [Type] bc4c7771-94bc-4d1e-88a4-01923a599c93"
        : "bc4c7771-94bc-4d1e-88a4-01923a599c93",
  );

  static const collectiveOS = ObjectId(
    Flags.isDebug
        ? "collectiveOS [Type] 9a78fb9e-58ec-4967-9753-25daf6cc0b0b"
        : "9a78fb9e-58ec-4967-9753-25daf6cc0b0b",
  );
}

abstract class OSRolePropertyTypes {
  static const ownsMainAreas = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsMainAreas [Property-Type] a39b6476-e75c-4e90-9bb1-f3c9b0dd0f9b"
          : "a39b6476-e75c-4e90-9bb1-f3c9b0dd0f9b",
    ),
  );
}

abstract class OSUserPropertyTypes {}

abstract class PersonalOSPropertyTypes {
  static const ownsPersonalWorkspaces = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsPersonalWorkspaces [Property-Type] 82559b2e-9c77-41b8-ab87-a9f738f90572"
          : "82559b2e-9c77-41b8-ab87-a9f738f90572",
    ),
  );
}

abstract class CollectiveOSPropertyTypes {
  static const ownsMainTeamWorkspace = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsMainTeamWorkspace [Property-Type] 846fa6b1-e19e-4f64-81d7-6808c5331295"
          : "846fa6b1-e19e-4f64-81d7-6808c5331295",
    ),
  );

  static const ownsWorkbases = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? ">Workbases [Property-Type] 8e9928e1-492e-4d56-afdf-da445c85a789"
          : "8e9928e1-492e-4d56-afdf-da445c85a789",
    ),
  );
}
