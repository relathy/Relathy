import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
import 'package:relathy_shared/domain_layer/core_module/data/system_property_types.dart';
import 'package:relathy_shared/generic_layer/flags/flags.dart';

abstract class OrganizationModelIds {
  static const organization = ObjectId(
    Flags.isDebug
        ? "organization [Model] 5ce6e7e1-5662-409c-ab53-6d21a1b61cc2"
        : "5ce6e7e1-5662-409c-ab53-6d21a1b61cc2",
  );
}

abstract class OrganizationRoleIds {
  static const workSessionContainer = ObjectId(
    Flags.isDebug
        ? "workSessionContainer [Type] 6f380339-361a-4197-9514-9bcb36e47b8f"
        : "6f380339-361a-4197-9514-9bcb36e47b8f",
  );

  static const favoritesContainer = ObjectId(
    Flags.isDebug
        ? "favoritesContainer [Type] 66506ef5-afa6-426c-918f-581a4ca0ab38"
        : "66506ef5-afa6-426c-918f-581a4ca0ab38",
  );
}

abstract class OrganizationTypeIds {
  static const workspace = ObjectId(
    Flags.isDebug
        ? "workspace [Type] 2867a78f-d632-463f-86d1-ac319e48bb1c"
        : "2867a78f-d632-463f-86d1-ac319e48bb1c",
  );

  static const personalWorkspace = ObjectId(
    Flags.isDebug
        ? "personalWorkspace [Type] 02aef0ae-bd45-41af-8ce9-94fb27b2cd15"
        : "02aef0ae-bd45-41af-8ce9-94fb27b2cd15",
  );

  static const teamWorkspace = ObjectId(
    Flags.isDebug
        ? "teamWorkspace [Type] 11458e6a-5616-42ee-8ae1-41bb32684764"
        : "11458e6a-5616-42ee-8ae1-41bb32684764",
  );

  static const mainTeamWorkspace = ObjectId(
    Flags.isDebug
        ? "mainTeamWorkspace [Type] 817fd65d-9a37-4b89-bc10-555051643585"
        : "817fd65d-9a37-4b89-bc10-555051643585",
  );

  static const interactionWorkspace = ObjectId(
    Flags.isDebug
        ? "interactionWorkspace [Type] 6c2235e3-aeb9-429b-a385-fae60d402d4d"
        : "6c2235e3-aeb9-429b-a385-fae60d402d4d",
  );

  static const workbase = ObjectId(
    Flags.isDebug
        ? "workbase [Type] 13b48bc6-08b7-40af-9124-6e99cdf41414"
        : "13b48bc6-08b7-40af-9124-6e99cdf41414",
  );

  static const favorites = ObjectId(
    Flags.isDebug
        ? "favorites [type] 6888420d-bc10-4e14-8423-4716fade311d"
        : "6888420d-bc10-4e14-8423-4716fade311d",
  );

  static const workSession = ObjectId(
    Flags.isDebug
        ? "workSession [type] c5ee18fa-3807-4f1e-9d4b-fe240f69c317"
        : "c5ee18fa-3807-4f1e-9d4b-fe240f69c317",
  );
}

abstract class WorkbasePropertyTypes {
  static final ownsApps = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsApps [Property-Type] c9f13e7f-42e6-4b27-bf72-246b8632da4d"
          : "c9f13e7f-42e6-4b27-bf72-246b8632da4d",
    ),
  );

  static final ownsObjectives = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsObjectives [Property-Type] 09b73de2-a555-4332-992e-e8f9944feeaa"
          : "09b73de2-a555-4332-992e-e8f9944feeaa",
    ),
  );

  static const ownedByCollectiveOS = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByCollectiveOS [Property-Type] e8cdcdcd-0cb8-4679-8f45-e69d70c10e56"
          : "e8cdcdcd-0cb8-4679-8f45-e69d70c10e56",
    ),
  );

  static const ownedByWorkbases = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByWorkbases [Property-Type] 7c0c0afa-2307-4965-89b5-ee24079fb319"
          : "7c0c0afa-2307-4965-89b5-ee24079fb319",
    ),
  );

  static final ownsWorkbases = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? ">Workbases [Property-Type] 7a374559-406e-4482-b432-52deddb0b991"
          : "7a374559-406e-4482-b432-52deddb0b991",
    ),
  );

  static const ownsTeamWorkspaces = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsTeamWorkspaces [Property-Type] b3331e57-cc89-4824-8517-b85042e4a767"
          : "b3331e57-cc89-4824-8517-b85042e4a767",
    ),
  );

  static const ownsInteractionWorkspaces = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsInteractionWorkspaces [Property-Type] c958a334-74bf-4595-a356-a152c6e75c5e"
          : "c958a334-74bf-4595-a356-a152c6e75c5e",
    ),
  );

  static final ownsWorkbaseAreas = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? ">WorkbaseAreas [Property-Type] 5015fb83-3567-4f82-ad50-e4bebfb256a0"
          : "5015fb83-3567-4f82-ad50-e4bebfb256a0",
    ),
  );

  static final ownsGeneralArea = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsGeneralArea [Property-Type] fab9335d-53f6-4162-91db-be2205796889"
          : "fab9335d-53f6-4162-91db-be2205796889",
    ),
  );
}

abstract class FavoritesContainerPropertyTypes {
  static const ownsFavorites = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsFavorites [Property-Type] 9c125fb7-bd7d-4df4-bb0c-48d2a2920d64"
          : "9c125fb7-bd7d-4df4-bb0c-48d2a2920d64",
    ),
  );
}

abstract class WorkSessionContainerPropertyTypes {
  static const ownsWorkSessions = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsWorkSessions [Property-Type] df952310-3acb-47c5-97e0-78fe4ba2061e"
          : "df952310-3acb-47c5-97e0-78fe4ba2061e",
    ),
  );
}

abstract class WorkspacePropertyTypes {
  static final ownsObjectives = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsObjectives [Property-Type] b85bfd9d-07a4-4739-a273-06897c8f28a3"
          : "b85bfd9d-07a4-4739-a273-06897c8f28a3",
    ),
  );

  static final ownsGeneralArea = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsGeneralArea [Property-Type] ef9a709b-6388-4246-ad4a-bd728df5ef42"
          : "ef9a709b-6388-4246-ad4a-bd728df5ef42",
    ),
  );

  static final ownsWorkspaceAreas = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? ">WorkspaceAreas [Property-Type] 24f712ef-e099-4a53-bd00-d1c7eab4bc30"
          : "24f712ef-e099-4a53-bd00-d1c7eab4bc30",
    ),
  );

  static const ownsMicrotaskBatchers = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsMicrotaskBatchers [Type] d72aa5c9-8717-4b7e-aec3-1fff44d0e65f"
          : "d72aa5c9-8717-4b7e-aec3-1fff44d0e65f",
    ),
  );
}

abstract class PersonalWorkspacePropertyTypes {
  static const ownedByPersonalOS = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByPersonalOS [Property-Type] 9f7b5aba-a575-43ca-afdf-3d05c7c6df9a"
          : "9f7b5aba-a575-43ca-afdf-3d05c7c6df9a",
    ),
  );
}

abstract class MainTeamWorkspacePropertyTypes {
  static const ownedByCollectiveOS = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByCollectiveOS [Property-Type] 6f52ddac-5f96-428b-99ce-366e4f28f071"
          : "6f52ddac-5f96-428b-99ce-366e4f28f071",
    ),
  );
}

abstract class TeamWorkspacePropertyTypes {
  static const ownedByWorkbases = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByWorkbases [Property-Type] 4012efdf-7f2d-4a23-b144-c96d955076f4"
          : "4012efdf-7f2d-4a23-b144-c96d955076f4",
    ),
  );

  static const responsibleForWorkbaseAreas = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "responsibleForWorkbaseAreas [Type] 896248a1-a602-47a1-974f-0f57f8c934f1"
          : "896248a1-a602-47a1-974f-0f57f8c934f1",
    ),
  );

  static const responsibleForMainAreas = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "responsibleForMainAreas [Type] a87c4206-4217-48fd-a8a2-d630ba3163c2"
          : "a87c4206-4217-48fd-a8a2-d630ba3163c2",
    ),
  );
}

abstract class InteractionWorkspacePropertyTypes {
  static const ownedByWorkbases = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByWorkbases [Property-Type] 9e733d17-05e2-497c-b8be-72ea7d674d6c"
          : "9e733d17-05e2-497c-b8be-72ea7d674d6c",
    ),
  );
}

abstract class FavoritesPropertyTypes {
  static const ownedByOwner = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByOwner [Property-Type] ed2f3634-0f94-452b-b3aa-f24d56f9f6d5"
          : "ed2f3634-0f94-452b-b3aa-f24d56f9f6d5",
    ),
  );

  static const attachedTo = ObjectAttributeType(
    ObjectId(
      Flags.isDebug
          ? "attachedTo [Property-Type] 52dc8c67-9d68-4922-9d6c-2fec24e4ef2d"
          : "52dc8c67-9d68-4922-9d6c-2fec24e4ef2d",
    ),
  );
}

abstract class WorkSessionPropertyTypes {
  static const ownedByOwner = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByOwner [Property-Type] f836d23a-9806-4f2a-b6ae-1c235c02919d"
          : "f836d23a-9806-4f2a-b6ae-1c235c02919d",
    ),
  );

  static const linkedToWorkItem = ObjectAttributeType(
    ObjectId(
      Flags.isDebug
          ? "linkedToWorkItem [Property-Type] 7da9c8d5-f706-44b5-81c1-c8e0c8b19b87"
          : "7da9c8d5-f706-44b5-81c1-c8e0c8b19b87",
    ),
  );

  static const position = TextAttributeType(
    ObjectId(
      Flags.isDebug
          ? "position [Property-Type] 1f7850b1-6927-486a-9e71-d0493a4ed2a2"
          : "1f7850b1-6927-486a-9e71-d0493a4ed2a2",
    ),
  );
}
