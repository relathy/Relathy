import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
import 'package:relathy_shared/domain_layer/core_module/data/system_property_types.dart';
import 'package:relathy_shared/generic_layer/flags/flags.dart';

abstract class WebverseAccountIds {
  static const webverse = ObjectId(
    Flags.isDebug
        ? "webverse [Model] 5d06d101-6a77-4ccc-987b-b5b24e21ab74"
        : "5d06d101-6a77-4ccc-987b-b5b24e21ab74",
  );
}

abstract class CitizenIds {
  static const webverse = ObjectId(
    Flags.isDebug
        ? "webverse [Model] 7c072681-6787-4e6a-88a9-58237b7c95c9"
        : "7c072681-6787-4e6a-88a9-58237b7c95c9",
  );
}

abstract class WebverseToolIds {
  static const webverse = ToolId(
    Flags.isDebug
        ? "webverse [Model] a78c672d-d8a3-4bd1-a872-9f150479a75d"
        : "a78c672d-d8a3-4bd1-a872-9f150479a75d",
  );
}

abstract class WebversePublishedToolIds {
  static const webverse = ObjectId(
    Flags.isDebug
        ? "webverse [Model] 86fa9ccf-60ac-4d03-aeab-8301bef7a8cd"
        : "86fa9ccf-60ac-4d03-aeab-8301bef7a8cd",
  );
}

abstract class WebversePublishedToolVersionIds {
  static const webverse_1_0_0 = ObjectId(
    Flags.isDebug
        ? "webverse_1_0_0 [Model] 1a473b28-2442-40f5-aa85-27de14524a6d"
        : "1a473b28-2442-40f5-aa85-27de14524a6d",
  );
}

abstract class WebversePublishedToolVersions {
  static const webverse_1_0_0 = "1.0.0";
}

abstract class WebversePublishedModelVersions {
  static const object_1_0_0 = "1.0.0";
  static const os_1_0_0 = "1.0.0";
}

abstract class WebversePublishedModelIds {
  static const object = ObjectId(
    Flags.isDebug
        ? "object [Model] bf0e2f50-03b6-4c87-bffa-68c53f3e8e80"
        : "bf0e2f50-03b6-4c87-bffa-68c53f3e8e80",
  );
  static const os = ObjectId(
    Flags.isDebug
        ? "os [Model] 4e773d82-689a-4125-a1fa-5eef1f858ac3"
        : "4e773d82-689a-4125-a1fa-5eef1f858ac3",
  );
}

abstract class WebversePublishedModelVersionIds {
  static const object_1_0_0 = ObjectId(
    Flags.isDebug
        ? "object_1_0_0 [Model] 67b407bf-3088-4803-a2f5-a742c10018a0"
        : "67b407bf-3088-4803-a2f5-a742c10018a0",
  );
  static const os_1_0_0 = ObjectId(
    Flags.isDebug
        ? "os_1_0_0 [Model] c75eba42-a5b1-46c4-a5be-d22194468465"
        : "c75eba42-a5b1-46c4-a5be-d22194468465",
  );
}

abstract class WebverseWorldIds {
  static const webverse = ObjectId(
    Flags.isDebug
        ? "webverse [Model] 381d5a7c-78aa-4ae1-8ad5-2eb579e14600"
        : "381d5a7c-78aa-4ae1-8ad5-2eb579e14600",
  );
}

abstract class WebverseModelIds {
  static const webverse = ObjectId(
    Flags.isDebug
        ? "webverse [Model] 3c547411-5b63-473b-9d86-6dcf711d9eea"
        : "3c547411-5b63-473b-9d86-6dcf711d9eea",
  );
}

abstract class WebverseTypeIds {
  static const webverseTool = ObjectId(
    Flags.isDebug
        ? "webverseTool [type] be496666-efb7-45ed-be83-81b50e63bf9f"
        : "be496666-efb7-45ed-be83-81b50e63bf9f",
  );

  static const account = ObjectId(
    Flags.isDebug
        ? "account [type] a7b0c4e9-4fbd-4400-b601-601ae93cd092"
        : "a7b0c4e9-4fbd-4400-b601-601ae93cd092",
  );

  static const citizen = ObjectId(
    Flags.isDebug
        ? "citizen [type] ac57d151-6ef0-4f2c-8e5c-e601d1723fc0"
        : "ac57d151-6ef0-4f2c-8e5c-e601d1723fc0",
  );

  static const world = ObjectId(
    Flags.isDebug
        ? "world [type] dc3750bc-79f7-4613-aa49-f0ca6ac43283"
        : "dc3750bc-79f7-4613-aa49-f0ca6ac43283",
  );

  static const publishedTool = ObjectId(
    Flags.isDebug
        ? "publishedTool [type] 61b809a4-40fe-4d73-85f2-eeeda4b59e42"
        : "61b809a4-40fe-4d73-85f2-eeeda4b59e42",
  );

  static const publishedToolVersion = ObjectId(
    Flags.isDebug
        ? "publishedToolVersion [type] 3394ecb1-7abc-4639-9989-140ad09a7138"
        : "3394ecb1-7abc-4639-9989-140ad09a7138",
  );

  static const publishedModel = ObjectId(
    Flags.isDebug
        ? "publishedModel [type] fed4528d-3515-461f-a4e8-ea91b0e77b4d"
        : "fed4528d-3515-461f-a4e8-ea91b0e77b4d",
  );

  static const publishedModelVersion = ObjectId(
    Flags.isDebug
        ? "publishedModelVersion [type] 61b809a4-40fe-4d73-85f2-eeeda4b59e42"
        : "61b809a4-40fe-4d73-85f2-eeeda4b59e42",
  );
}

abstract class WorldPropertyTypes {
  static const ownedByTool = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByTool [Property-Type] 6c480672-0b85-4095-8302-924d0e8c1f39"
          : "6c480672-0b85-4095-8302-924d0e8c1f39",
    ),
  );

  static const link = TextAttributeType(
    ObjectId(
      Flags.isDebug
          ? "link [Property-Type] 665f20f4-f5b9-46a2-a5b6-ddbb5b46c271"
          : "665f20f4-f5b9-46a2-a5b6-ddbb5b46c271",
    ),
  );

  static const builtByCitizens = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "builtByCitizens [Property-Type] d5520c1a-09d5-4126-afd8-762ca2db6180"
          : "d5520c1a-09d5-4126-afd8-762ca2db6180",
    ),
  );

  static const ownsPublishedTools = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsPublishedTools [Property-Type] bd93d0ed-c324-4516-9d19-0955af1a7397"
          : "bd93d0ed-c324-4516-9d19-0955af1a7397",
    ),
  );

  static const ownsPublishedModels = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsPublishedModels [Property-Type] 35efabff-011a-4b02-9c4f-cc94a3d96651"
          : "35efabff-011a-4b02-9c4f-cc94a3d96651",
    ),
  );

  static const partOfAccount = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "partOfAccount [Property-Type] e915b1cd-cf17-4bde-afee-7d2472660fd8"
          : "e915b1cd-cf17-4bde-afee-7d2472660fd8",
    ),
  );
}

abstract class CitizenPropertyTypes {
  static const buildingWorlds = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "buildingWorlds [Property-Type] 89515061-93be-4ff6-bf08-1eabb1c60df6"
          : "89515061-93be-4ff6-bf08-1eabb1c60df6",
    ),
  );

  static const partOfAccount = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "partOfAccount [Property-Type] 3a1ed2a4-1950-4dde-be82-38715ce57a25"
          : "3a1ed2a4-1950-4dde-be82-38715ce57a25",
    ),
  );

  static const usesTools = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "usesTools [Property-Type] 1c6b30a7-914f-47aa-b4af-24d7b1385902"
          : "1c6b30a7-914f-47aa-b4af-24d7b1385902",
    ),
  );
}

abstract class AccountPropertyTypes {
  static const ownedByTool = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByTool [Property-Type] 9f5f2381-2271-498e-adf6-0e31678ec1fe"
          : "9f5f2381-2271-498e-adf6-0e31678ec1fe",
    ),
  );

  static const email = TextAttributeType(
    ObjectId(
      Flags.isDebug
          ? "email [Property-Type] a5120a6d-a89f-4b74-9f8d-e8674d0488c6"
          : "a5120a6d-a89f-4b74-9f8d-e8674d0488c6",
    ),
  );

  static const ownsWebnames = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsWebnames [Property-Type] 6cf949ec-dfae-4cc5-a92e-881af35d633f"
          : "6cf949ec-dfae-4cc5-a92e-881af35d633f",
    ),
  );

  static const hasCitizens = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "hasCitizens [Property-Type] ff978f5b-1858-4666-ba33-b4abd964c7c4"
          : "ff978f5b-1858-4666-ba33-b4abd964c7c4",
    ),
  );

  static const hasWorlds = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "hasWorlds [Property-Type] bb4c218e-5ae3-491d-937d-1fa8ccafead7"
          : "bb4c218e-5ae3-491d-937d-1fa8ccafead7",
    ),
  );
}

abstract class PublishedToolPropertyTypes {
  static const ownedByWorld = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByWorld [Property-Type] 5c40c930-501f-42d5-bb82-c27766e6af65"
          : "5c40c930-501f-42d5-bb82-c27766e6af65",
    ),
  );

  static const usedByCitizens = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "usedByCitizens [Property-Type] c3e2fcd1-98a8-4e3e-987d-9135d703bd74"
          : "c3e2fcd1-98a8-4e3e-987d-9135d703bd74",
    ),
  );

  static const ownsVersions = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsVersions [Property-Type] 29f7f641-6b52-4900-bbd6-989f0b9ddc3e"
          : "29f7f641-6b52-4900-bbd6-989f0b9ddc3e",
    ),
  );
}

abstract class PublishedToolVersionPropertyTypes {
  static const version = TextAttributeType(
    ObjectId(
      Flags.isDebug
          ? "version [Property-Type] 72d0c914-68a4-42bb-a032-11f804802c94"
          : "72d0c914-68a4-42bb-a032-11f804802c94",
    ),
  );

  static const ownedByPublishedTool = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByPublishedTool [Property-Type] 861d22bd-9030-44bb-8396-ffc5f086df1a"
          : "861d22bd-9030-44bb-8396-ffc5f086df1a",
    ),
  );
}

abstract class PublishedModelPropertyTypes {
  static const ownedByWorld = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByWorld [Property-Type] db104cb7-2758-4f8d-bc48-9a96ea1eed1f"
          : "db104cb7-2758-4f8d-bc48-9a96ea1eed1f",
    ),
  );

  static const ownsVersions = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsVersions [Property-Type] 72d0c914-68a4-42bb-a032-11f804802c94"
          : "72d0c914-68a4-42bb-a032-11f804802c94",
    ),
  );
}

abstract class PublishedModelVersionPropertyTypes {
  static const version = TextAttributeType(
    ObjectId(
      Flags.isDebug
          ? "version [Property-Type] 2dda67c6-866d-4801-a686-c3b92191467b"
          : "2dda67c6-866d-4801-a686-c3b92191467b",
    ),
  );

  static const ownedByPublishedModel = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByPublishedModel [Property-Type] 7d959f6b-281d-4bb6-a9f9-6b1507ac1c8b"
          : "7d959f6b-281d-4bb6-a9f9-6b1507ac1c8b",
    ),
  );
}

class WebverseToolPropertyTypes {
  static const ownsWorlds = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsWorlds [Property-Type] 8dd787ee-cc49-4b28-a47f-12a3ef011dde"
          : "8dd787ee-cc49-4b28-a47f-12a3ef011dde",
    ),
  );

  static const ownsAccounts = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsAccounts [Property-Type] 21d04c19-1522-490e-a4be-0bd57dd9219c"
          : "21d04c19-1522-490e-a4be-0bd57dd9219c",
    ),
  );

  static const ownsCitizens = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsCitizens [Property-Type] 4b8586ac-c4c6-409d-985a-3594e370b995"
          : "4b8586ac-c4c6-409d-985a-3594e370b995",
    ),
  );
}
