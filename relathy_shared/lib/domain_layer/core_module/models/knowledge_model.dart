import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
import 'package:relathy_shared/domain_layer/core_module/data/system_property_types.dart';
import 'package:relathy_shared/generic_layer/flags/flags.dart';

abstract class KnowledgeModelIds {
  static const knowledge = ObjectId(
    Flags.isDebug
        ? "knowledge [Model] e22820b1-4bf3-4cbb-91a8-76c49dbf703f"
        : "e22820b1-4bf3-4cbb-91a8-76c49dbf703f",
  );
}

abstract class KnowledgeKindIds {
  static const topicEntity = ObjectId(
    Flags.isDebug
        ? "topicEntity [Type] a99a3110-1d12-48fa-9bf1-7cbd8a562d42"
        : "a99a3110-1d12-48fa-9bf1-7cbd8a562d42",
  );

  static const topicSource = ObjectId(
    Flags.isDebug
        ? "topicSource [Type] ab6f84da-b489-40a9-8577-5e5c65496a25"
        : "ab6f84da-b489-40a9-8577-5e5c65496a25",
  );

  static const topicAuthor = ObjectId(
    Flags.isDebug
        ? "topicAuthor [Type] 067f71fd-5e9a-40b9-bcff-149fd6ba1dc8"
        : "067f71fd-5e9a-40b9-bcff-149fd6ba1dc8",
  );
}

abstract class KnowledgeTypeIds {
  static const knowledgeBase = ObjectId(
    Flags.isDebug
        ? "knowledgeBase [Type] d9c93dce-1988-4547-a90e-1c918fcb328c"
        : "d9c93dce-1988-4547-a90e-1c918fcb328c",
  );

  static const resource = ObjectId(
    Flags.isDebug
        ? "resource [Type] 341b4d6e-b3a2-43f7-adb3-799a140070c3"
        : "341b4d6e-b3a2-43f7-adb3-799a140070c3",
  );

  static const videoResource = ObjectId(
    Flags.isDebug
        ? "videoResource [Type] cd5c1d82-6ace-4177-879a-7fdd483acb0b"
        : "cd5c1d82-6ace-4177-879a-7fdd483acb0b",
  );

  static const audioResource = ObjectId(
    Flags.isDebug
        ? "audioResource [Type] 517f8d6d-eebb-483c-9b76-9f7c69f80b0b"
        : "517f8d6d-eebb-483c-9b76-9f7c69f80b0b",
  );

  static const imageResource = ObjectId(
    Flags.isDebug
        ? "imageResource [Type] d9124b9f-a9c1-4daa-883c-b41b8355afd1"
        : "d9124b9f-a9c1-4daa-883c-b41b8355afd1",
  );

  static const textResource = ObjectId(
    Flags.isDebug
        ? "textResource [Type] 3b40e4c3-4398-4898-a7ef-c7c5bd2e9c2c"
        : "3b40e4c3-4398-4898-a7ef-c7c5bd2e9c2c",
  );

  static const dataResource = ObjectId(
    Flags.isDebug
        ? "dataResource [Type] 675117cb-902d-4b95-b3eb-8d130349a1f8"
        : "675117cb-902d-4b95-b3eb-8d130349a1f8",
  );

  static const interactiveResource = ObjectId(
    Flags.isDebug
        ? "dataResource [Type] 0aab231c-e306-4d3d-a4ac-55989ae21673"
        : "0aab231c-e306-4d3d-a4ac-55989ae21673",
  );

  static const resourcePart = ObjectId(
    Flags.isDebug
        ? "resourcePart [Type] 06871d4d-2c42-4827-922e-89cc2075ef16"
        : "06871d4d-2c42-4827-922e-89cc2075ef16",
  );

  static const topic = ObjectId(
    Flags.isDebug
        ? "topic [Type] c5214feb-c699-4e51-a294-005f84b2a903"
        : "c5214feb-c699-4e51-a294-005f84b2a903",
  );

  static const operatingProposal = ObjectId(
    Flags.isDebug
        ? "operatingProposal [Type] 10ba62ac-4e88-45ef-8cdc-d20010da0a21"
        : "10ba62ac-4e88-45ef-8cdc-d20010da0a21",
  );

  static const author = ObjectId(
    Flags.isDebug
        ? "author [Type] a44b49f2-a5b5-496d-8c0d-b08a833b0b5a"
        : "a44b49f2-a5b5-496d-8c0d-b08a833b0b5a",
  );

  static const humanAuthor = ObjectId(
    Flags.isDebug
        ? "humanAuthor [Type] 4d190ae0-4649-499f-bf24-dfa3333f05a6"
        : "4d190ae0-4649-499f-bf24-dfa3333f05a6",
  );

  static const pseudonymousAuthor = ObjectId(
    Flags.isDebug
        ? "pseudonymousAuthor [Type] bacedf87-23ec-4706-a92e-4bc3e804f8a0"
        : "bacedf87-23ec-4706-a92e-4bc3e804f8a0",
  );

  static const artificialAuthor = ObjectId(
    Flags.isDebug
        ? "artificialAuthor [Type] d2398c7b-8977-4074-a982-ef497303024e"
        : "d2398c7b-8977-4074-a982-ef497303024e",
  );

  static const collectiveAuthor = ObjectId(
    Flags.isDebug
        ? "collectiveAuthor [Type] eaafd289-f634-4771-9af9-6d863feebb11"
        : "eaafd289-f634-4771-9af9-6d863feebb11",
  );

  static const source = ObjectId(
    Flags.isDebug
        ? "source [Type] 58b47072-d2ae-44de-8a22-7cec743c4f53"
        : "58b47072-d2ae-44de-8a22-7cec743c4f53",
  );
}

abstract class OperatingProposalPropertyTypes {}

abstract class SourcePropertyTypes {
  static const authors = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "authors [Property-Type] 8149edfe-4ddb-4778-a91a-61d9fb7a203c"
          : "8149edfe-4ddb-4778-a91a-61d9fb7a203c",
    ),
  );

  static const topicEntities = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "topicEntities [Property-Type] 807ba00d-51b8-449f-af8c-696e98cf53b7"
          : "807ba00d-51b8-449f-af8c-696e98cf53b7",
    ),
  );

  static const topicAuthors = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "topicAuthors [Property-Type] f35e73b1-4987-4f1a-ad14-b37c58dfefc8"
          : "f35e73b1-4987-4f1a-ad14-b37c58dfefc8",
    ),
  );

  static const topicSources = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "topicSources [Property-Type] 7fef6cf0-c3e1-49be-8094-7e0e3f8faa70"
          : "7fef6cf0-c3e1-49be-8094-7e0e3f8faa70",
    ),
  );
}

abstract class AuthorPropertyTypes {
  static const sources = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "sources [Property-Type] ed737b03-610b-40b2-8503-b6b9b39ee28e"
          : "ed737b03-610b-40b2-8503-b6b9b39ee28e",
    ),
  );
}

abstract class TopicEntityPropertyTypes {
  static const sources = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "sources [Property-Type] bde2f74f-647e-401d-8deb-2b6ac512acbf"
          : "bde2f74f-647e-401d-8deb-2b6ac512acbf",
    ),
  );
}

abstract class TopicAuthorPropertyTypes {
  static const sources = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "sources [Property-Type] a4a0575e-0bdb-4be1-bc0b-d4881a5974d8"
          : "af40e48b-5113-4bb7-bee3-38febff9b4a1",
    ),
  );
}

abstract class TopicSourcePropertyTypes {
  static const sources = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "sources [Property-Type] d6a9b25d-2e3c-48ee-9102-607bae247cc4"
          : "d6a9b25d-2e3c-48ee-9102-607bae247cc4",
    ),
  );
}
