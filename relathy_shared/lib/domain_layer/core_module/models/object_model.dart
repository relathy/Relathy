import 'package:relathy_shared/domain_layer/core_module/data/system_property_types.dart';
import 'package:relathy_shared/generic_layer/flags/flags.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';

abstract class ObjectActorIds {
  static const system = ObjectId("4bd75880-3d83-4d5e-a8aa-2e59f4536967");
}

abstract class ObjectModelIds {
  static const object = ObjectId("809f5f3f-b251-4be6-9367-d3a64b8ab027");
}

abstract class ObjectBlockTypeIds {
  static const text = ObjectId(
    Flags.isDebug
        ? "text [Block-Type] 497de569-11b2-4b69-91f6-7735fefdcfdf"
        : "497de569-11b2-4b69-91f6-7735fefdcfdf",
  );
  static const componentInstance = ObjectId(
    Flags.isDebug
        ? "componentInstance [Block-Type] 964c63bd-e2d3-4813-aaf2-47d313a86963"
        : "964c63bd-e2d3-4813-aaf2-47d313a86963",
  );
}

abstract class ObjectInlineTypeIds {
  static const text = ObjectId(
    Flags.isDebug
        ? "text [Inline-Type] a3fa8c06-10a1-401f-a362-80aef67c9940"
        : "a3fa8c06-10a1-401f-a362-80aef67c9940",
  );
}

abstract class ObjectValueTypeIds {
  static const text = ObjectId(
    Flags.isDebug
        ? "text [Value-Type] 00a8a0b2-f591-4df0-8524-1d4e48df8981"
        : "00a8a0b2-f591-4df0-8524-1d4e48df8981",
  );
  static const content = ObjectId(
    Flags.isDebug
        ? "content [Value-Type] 7b948d64-79ce-4a1d-bc45-34bc494a241e"
        : "7b948d64-79ce-4a1d-bc45-34bc494a241e",
  );
  static const object = ObjectId(
    Flags.isDebug
        ? "object [Value-Type] 92197e64-5df0-4223-87ce-f0506c63e643"
        : "92197e64-5df0-4223-87ce-f0506c63e643",
  );
  static const objectList = ObjectId(
    Flags.isDebug
        ? "objectList [Value-Type] 3a35324f-0b35-4e34-8982-6bf92a851986"
        : "3a35324f-0b35-4e34-8982-6bf92a851986",
  );
  static const reference = ObjectId(
    Flags.isDebug
        ? "reference [Value-Type] 95cbc6ad-c398-3467-9b9c-95c06f60ef28"
        : "95cbc6ad-c398-3467-9b9c-95c06f60ef28",
  );
  static const referenceList = ObjectId(
    Flags.isDebug
        ? "referenceList [Value-Type] be7cd9a0-406d-4202-8647-3b4bab3a7bff"
        : "be7cd9a0-406d-4202-8647-3b4bab3a7bff",
  );
}

abstract class ObjectTraitIds {
  static const discardedObject = ObjectId(
    Flags.isDebug
        ? "discardedObject [Phase] e5dd208c-2e11-4a72-8245-c23a271634eb"
        : "e5dd208c-2e11-4a72-8245-c23a271634eb",
  );

  static const creatingObject = ObjectId(
    Flags.isDebug
        ? "creatingObject [Phase] a1dffa1a-0deb-406a-8501-8fa0e17d58df"
        : "a1dffa1a-0deb-406a-8501-8fa0e17d58df",
  );

  static const updatingObject = ObjectId(
    Flags.isDebug
        ? "updatingObject [Phase] 03927c39-91ba-4954-a24d-1a99364a758d"
        : "03927c39-91ba-4954-a24d-1a99364a758d",
  );

  static const deletingObject = ObjectId(
    Flags.isDebug
        ? "deletingObject [Phase] 96799c8f-9e82-4971-87f5-00e75f06bce9"
        : "96799c8f-9e82-4971-87f5-00e75f06bce9",
  );

  static const deletedObject = ObjectId(
    Flags.isDebug
        ? "deletedObject [Phase] 0c2ccb75-d62e-4c0a-b0e0-e305159884de"
        : "0c2ccb75-d62e-4c0a-b0e0-e305159884de",
  );

  static const displayedStringAttributeType = ObjectId(
    Flags.isDebug
        ? "displayedStringAttributeType [Category] 89fa836b-ec79-48a2-9da2-f5c3585b7800"
        : "89fa836b-ec79-48a2-9da2-f5c3585b7800",
  );

  static const requiredAttributeType = ObjectId(
    Flags.isDebug
        ? "requiredAttributeType [Category] 6f35ac0b-34c7-420f-a83c-9c636e8b5426"
        : "6f35ac0b-34c7-420f-a83c-9c636e8b5426",
  );

  static const nullableToOneRelationshipType = ObjectId(
    Flags.isDebug
        ? "nullableToOneRelationshipType [Category] d3928907-11f0-41ac-bcc7-15076a632edd"
        : "d3928907-11f0-41ac-bcc7-15076a632edd",
  );

  static const embeddedPage = ObjectId(
    Flags.isDebug
        ? "embeddedPage [Category] 3c286832-4322-4189-946e-cd13d912ac0a"
        : "3c286832-4322-4189-946e-cd13d912ac0a",
  );

  static const sharedEntity = ObjectId(
    Flags.isDebug
        ? "sharedEntity [Category] 01acbdd6-60a3-4f2e-a144-a81087a8a9b4"
        : "01acbdd6-60a3-4f2e-a144-a81087a8a9b4",
  );

  static const abstractClass = ObjectId(
    Flags.isDebug
        ? "abstractClass [Category] e0cc89fe-cc97-4c5a-9d8d-67485884df86"
        : "e0cc89fe-cc97-4c5a-9d8d-67485884df86",
  );

  static const standaloneType = ObjectId(
    Flags.isDebug
        ? "standaloneType [Category] 4d6625bd-091e-4a97-bfa7-5eb51739aae1"
        : "4d6625bd-091e-4a97-bfa7-5eb51739aae1",
  );

  static const singletonType = ObjectId(
    Flags.isDebug
        ? "singletonType [Category] b7a5262d-4b9b-4690-9171-f369496bde4f"
        : "b7a5262d-4b9b-4690-9171-f369496bde4f",
  );

  static const extensionType = ObjectId(
    Flags.isDebug
        ? "extensionType [Category] 3dce6bb6-7561-4435-86f2-61c9cbfd62f1"
        : "3dce6bb6-7561-4435-86f2-61c9cbfd62f1",
  );

  static const oneRelationshipType = ObjectId(
    Flags.isDebug
        ? "toOneRelationshipType [Category] 1fc1bebf-5b5a-4cf3-843c-72fd0447f3b9"
        : "1fc1bebf-5b5a-4cf3-843c-72fd0447f3b9",
  );

  static const manyRelationshipType = ObjectId(
    Flags.isDebug
        ? "toManyRelationshipType [Category] 568abb75-1578-4ce3-81de-6e9daaf681c3"
        : "568abb75-1578-4ce3-81de-6e9daaf681c3",
  );

  static const derivedPropertyType = ObjectId(
    Flags.isDebug
        ? "derivedPropertyType [Category] c892d0db-df19-483f-9536-72b7911eccfd"
        : "c892d0db-df19-483f-9536-72b7911eccfd",
  );

  static const virtualDerivedPropertyType = ObjectId(
    Flags.isDebug
        ? "virtualDerivedPropertyType [Category] c892d0db-df19-483f-9536-72b7911eccfd"
        : "c892d0db-df19-483f-9536-72b7911eccfd",
  );

  // static const hierarchicalEntity = Flags.isDebug
  //     ? "hierarchicalEntity [Kind] e0a669e7-c64f-426a-a57a-16123bfa3297"
  //     : "e0a669e7-c64f-426a-a57a-16123bfa3297";

  // static const hierarchicalToManyRelationshipType = Flags.isDebug
  //     ? "hierarchicalEntity [Kind] e9941859-fba5-458d-8f63-633bb1047a8d"
  //     : "e9941859-fba5-458d-8f63-633bb1047a8d";

  // static const localFolderEntityType = Flags.isDebug
  //     ? "localFolderEntity [Kind] 43855720-e605-488a-a307-f7da348bdd88"
  //     : "43855720-e605-488a-a307-f7da348bdd88";

  // static const orderedDivision = Flags.isDebug
  //     ? "orderedDivision [Kind] 09ae138b-c7ab-4b7c-a732-c1641a6b692e"
  //     : "09ae138b-c7ab-4b7c-a732-c1641a6b692e";

  // static const personalEditingNote = Flags.isDebug
  //     ? "personalEditingNote [Kind] c272059c-36a2-4d08-9999-be7eeeffd141"
  //     : "c272059c-36a2-4d08-9999-be7eeeffd141";

  // static const rigidClass = Flags.isDebug
  //     ? "rigidClass [Kind] 2a5a20a3-929d-4ed2-95a1-a4bb8c742d41"
  //     : "2a5a20a3-929d-4ed2-95a1-a4bb8c742d41";
}

abstract class ObjectRoleIds {
  static const namedObjectRole = ObjectId(
    Flags.isDebug
        ? "namedObjectRole [Role] 9f9dd0ba-10f8-41e1-8621-55e8c6cb682a"
        : "9f9dd0ba-10f8-41e1-8621-55e8c6cb682a",
  );

  static const workItemRole = ObjectId(
    Flags.isDebug
        ? "workItemRole [Role] 41576f5e-dcf3-482c-aa17-26dbf14c10bb"
        : "41576f5e-dcf3-482c-aa17-26dbf14c10bb",
  );

  static const modelContainerRole = ObjectId(
    Flags.isDebug
        ? "modelContainerRole [Role] c45ccf17-ab1e-4815-822d-f54b41ced48d"
        : "c45ccf17-ab1e-4815-822d-f54b41ced48d",
  );

  static const modelRole = ObjectId(
    Flags.isDebug
        ? "modelRole [Role] c4006c75-f5e4-4434-a09d-cec4e96896b4"
        : "c4006c75-f5e4-4434-a09d-cec4e96896b4",
  );

  static const userRole = ObjectId(
    Flags.isDebug
        ? "userRole [Role] 1ea22774-de68-4620-98e7-461f1f385d7d"
        : "1ea22774-de68-4620-98e7-461f1f385d7d",
  );

  static const actorRole = ObjectId(
    Flags.isDebug
        ? "actorRole [Role] fad1d68b-648f-4c0f-a435-1bd7d27c136b"
        : "fad1d68b-648f-4c0f-a435-1bd7d27c136b",
  );

  static const divisionRole = ObjectId(
    Flags.isDebug
        ? "divisionRole [Role] 52082d60-3ecd-40f3-bea7-b9ef4adf5048"
        : "52082d60-3ecd-40f3-bea7-b9ef4adf5048",
  );

  static const collectionRole = ObjectId(
    Flags.isDebug
        ? "collectionRole [Role] 8cdd7095-388d-45d0-9f8c-382dc262fbfe"
        : "8cdd7095-388d-45d0-9f8c-382dc262fbfe",
  );

  static const referenceCollectionRole = ObjectId(
    Flags.isDebug
        ? "referenceCollectionRole [Role] f86f1d06-2052-48ae-bcba-2546bf3bb7a8"
        : "f86f1d06-2052-48ae-bcba-2546bf3bb7a8",
  );
}

abstract class ObjectTypeIds {
  static const object = ObjectId(
    Flags.isDebug
        ? "object [Type] 83326c26-b5ae-499a-9935-44171dce0a1d"
        : "83326c26-b5ae-499a-9935-44171dce0a1d",
  );

  static const externalObject = ObjectId(
    Flags.isDebug
        ? "externalObject [Type] cd45e75d-5c51-4cfe-9c42-1d4df5a65b21"
        : "cd45e75d-5c51-4cfe-9c42-1d4df5a65b21",
  );

  static const systemActor = ObjectId(
    Flags.isDebug
        ? "systemActor [Type] fde32dca-3084-4339-ae27-c9d91a6e942a"
        : "fde32dca-3084-4339-ae27-c9d91a6e942a",
  );

  static const serviceActor = ObjectId(
    Flags.isDebug
        ? "serviceActor [Type] 213a01c1-7950-42f4-b6ef-06cc662e8fe3"
        : "213a01c1-7950-42f4-b6ef-06cc662e8fe3",
  );

  static const externalActor = ObjectId(
    Flags.isDebug
        ? "externalActor [Type] 05dba6b0-7118-41ac-bb72-9f91b74c749a"
        : "05dba6b0-7118-41ac-bb72-9f91b74c749a",
  );

  static const tool = ObjectId(
    Flags.isDebug
        ? "tool [Type] 16a915d0-d78d-4438-bbcc-1793cc47224e"
        : "16a915d0-d78d-4438-bbcc-1793cc47224e",
  );

  static const group = ObjectId(
    Flags.isDebug
        ? "group [Type] a2840e00-c48e-4341-9e49-67a4cd5248cb"
        : "a2840e00-c48e-4341-9e49-67a4cd5248cb",
  );

  static const complexRelationship = ObjectId(
    Flags.isDebug
        ? "complexRelationship [Type] 4130c7a5-8eae-4229-99e3-68f2abb38881"
        : "4130c7a5-8eae-4229-99e3-68f2abb38881",
  );

  static const $class = ObjectId(
    Flags.isDebug
        ? "class [Type] cf22f332-aa17-488f-aa01-b807b8b7e8bd"
        : "cf22f332-aa17-488f-aa01-b807b8b7e8bd",
  );

  static const objectType = ObjectId(
    Flags.isDebug
        ? "objectType [Type] 104d9ee4-ede2-4bcb-9e0c-f57f28006f0e"
        : "104d9ee4-ede2-4bcb-9e0c-f57f28006f0e",
  );

  static const objectRole = ObjectId(
    Flags.isDebug
        ? "objectRole [Type] 24cd7e69-de81-439e-8c57-7744ccaef5af"
        : "24cd7e69-de81-439e-8c57-7744ccaef5af",
  );

  static const objectCategory = ObjectId(
    Flags.isDebug
        ? "objectCategory [Type] 1d942ef5-f379-4668-8a32-38bb1730f3f5"
        : "1d942ef5-f379-4668-8a32-38bb1730f3f5",
  );

  static const objectPhase = ObjectId(
    Flags.isDebug
        ? "objectPhase [Type] 5732cfb8-a304-495f-bc41-a585da841525"
        : "5732cfb8-a304-495f-bc41-a585da841525",
  );

  static const complexRelationshipType = ObjectId(
    Flags.isDebug
        ? "complexRelationshipType [Type] 73dccc20-a10f-443e-9c8c-79626b168a41"
        : "73dccc20-a10f-443e-9c8c-79626b168a41",
  );

  static const propertyType = ObjectId(
    Flags.isDebug
        ? "propertyType [Type] 807c1cc2-6dc8-410c-ae17-d0914d919001"
        : "807c1cc2-6dc8-410c-ae17-d0914d919001",
  );

  static const relationshipType = ObjectId(
    Flags.isDebug
        ? "relationshipType [Type] fa13130a-2d79-4cbf-abd4-4caf9ab596f9"
        : "fa13130a-2d79-4cbf-abd4-4caf9ab596f9",
  );

  static const ownerRelationshipType = ObjectId(
    Flags.isDebug
        ? "ownerRelationshipType [Type] 2ae69477-5310-4e87-a7ca-a64e8871efe2"
        : "2ae69477-5310-4e87-a7ca-a64e8871efe2",
  );

  static const ownedRelationshipType = ObjectId(
    Flags.isDebug
        ? "ownedRelationshipType [Type] 2a963720-e43e-4d4e-bd26-3bdecd4efcec"
        : "2a963720-e43e-4d4e-bd26-3bdecd4efcec",
  );

  static const associationRelationshipType = ObjectId(
    Flags.isDebug
        ? "associationRelationshipType [Type] cd488cef-f25f-4894-be25-d46693bfd6c8"
        : "cd488cef-f25f-4894-be25-d46693bfd6c8",
  );

  static const attributeType = ObjectId(
    Flags.isDebug
        ? "attributeType [Type] ba97252a-2cb5-4477-b921-70cbeb751a24"
        : "ba97252a-2cb5-4477-b921-70cbeb751a24",
  );

  static const textAttributeType = ObjectId(
    Flags.isDebug
        ? "textAttributeType [Type] f3bdf30c-5472-4a15-9a1f-fe04e3bbaf0c"
        : "f3bdf30c-5472-4a15-9a1f-fe04e3bbaf0c",
  );

  static const referenceAttributeType = ObjectId(
    Flags.isDebug
        ? "referenceAttributeType [Type] e19ee666-3766-40ec-b925-43abb26ecc05"
        : "e19ee666-3766-40ec-b925-43abb26ecc05",
  );

  static const referenceListAttributeType = ObjectId(
    Flags.isDebug
        ? "referenceListAttributeType [Type] f05dcac4-c584-4feb-85ac-7d37ad46ed94"
        : "f05dcac4-c584-4feb-85ac-7d37ad46ed94",
  );

  static const contentAttributeType = ObjectId(
    Flags.isDebug
        ? "contentAttributeType [Type] 745d8604-abb3-4f3b-b2e3-d6a9ca0e3bf3"
        : "745d8604-abb3-4f3b-b2e3-d6a9ca0e3bf3",
  );

  static const phaseAttributeType = ObjectId(
    Flags.isDebug
        ? "phaseAttributeType [Type] d02eec60-dd82-45db-8cb9-e52dc20c6ebd"
        : "d02eec60-dd82-45db-8cb9-e52dc20c6ebd",
  );

  static const categoryAttributeType = ObjectId(
    Flags.isDebug
        ? "categoryAttributeType [Type] 83865eb8-5c53-45f4-9b63-64116fa55796"
        : "83865eb8-5c53-45f4-9b63-64116fa55796",
  );

  // static const boolAttributeType = Flags.isDebug
  //     ? "boolAttributeType [Type] 57019c78-c8b4-4242-b145-37728a912c54"
  //     : "57019c78-c8b4-4242-b145-37728a912c54";

  static const objectAttributeType = ObjectId(
    Flags.isDebug
        ? "objectAttributeType [Type] 92bd8e6b-f5e6-43c3-8220-9a25b723e037"
        : "92bd8e6b-f5e6-43c3-8220-9a25b723e037",
  );

  static const objectListAttributeType = ObjectId(
    Flags.isDebug
        ? "objectListAttributeType [Type] 0d5a624f-97b9-4303-867b-1131258aec14"
        : "0d5a624f-97b9-4303-867b-1131258aec14",
  );

  static const valueType = ObjectId(
    Flags.isDebug
        ? "valueType [Type] 0f5ce1bf-ddf9-4740-b800-dcfb377eeaaf"
        : "0f5ce1bf-ddf9-4740-b800-dcfb377eeaaf",
  );

  static const compositeValueType = ObjectId(
    Flags.isDebug
        ? "compositeValueType [Type] bbaacfd8-158a-4ea4-bd31-117eab5530b8"
        : "bbaacfd8-158a-4ea4-bd31-117eab5530b8",
  );

  static const page = ObjectId(
    Flags.isDebug
        ? "page [Type] 6a04b480-dd5b-41af-af88-9d11e44a2d10"
        : "6a04b480-dd5b-41af-af88-9d11e44a2d10",
  );

  static const module = ObjectId(
    Flags.isDebug
        ? "module [Type] 95687e97-3980-4b4d-9e3e-efdd15fc1509"
        : "95687e97-3980-4b4d-9e3e-efdd15fc1509",
  );

  // static const conceptualPage = Flags.isDebug
  //     ? "conceptualPage [Type] d7e8e838-6d3a-41a7-828f-d6b7f7baefc9"
  //     : "d7e8e838-6d3a-41a7-828f-d6b7f7baefc9";

  // static const specificProblemPage = Flags.isDebug
  //     ? "specificProblemPage [Type] f352034a-d626-405c-a269-adbef013b337"
  //     : "f352034a-d626-405c-a269-adbef013b337";

  // static const generalProblemPage = Flags.isDebug
  //     ? "generalProblemPage [Type] d5f7e232-36d4-44ea-8e91-6fedb22d3010"
  //     : "d5f7e232-36d4-44ea-8e91-6fedb22d3010";

  // static const referencePage = Flags.isDebug
  //     ? "referencePage [Type] 9871787f-5fd3-477b-9fc6-9e063f6fa72c"
  //     : "9871787f-5fd3-477b-9fc6-9e063f6fa72c";

  // static const interactivePage = Flags.isDebug
  //     ? "interactivePage [Type] 4440e2f2-7e5c-4c1c-8633-c4807d9bfd69"
  //     : "b3b822ad-f2aa-4ac1-9526-894e0145b306";

  // static const illustrativePage = Flags.isDebug
  //     ? "illustrativePage [Type] 0b2d3c0a-2514-41cd-81ed-02ad5b95a462"
  //     : "0b2d3c0a-2514-41cd-81ed-02ad5b95a462";

  // static const proceduralPage = Flags.isDebug
  //     ? "proceduralPage [Type] f3c84418-5c41-4af0-ae7e-d0acb9895c44"
  //     : "f3c84418-5c41-4af0-ae7e-d0acb9895c44";

  // static const troubleshootingPage = Flags.isDebug
  //     ? "troubleshooting [Type] 194f313c-8329-4c76-b9d9-c422bd856117"
  //     : "194f313c-8329-4c76-b9d9-c422bd856117";

  static const component = ObjectId(
    Flags.isDebug
        ? "component [Type] 0b2d2edb-485d-43d5-bc97-4d2200275a47"
        : "0b2d2edb-485d-43d5-bc97-4d2200275a47",
  );

  static const model = ObjectId(
    Flags.isDebug
        ? "model [Type] d681af7a-54b6-4d41-ad50-2760a22ea1c7"
        : "d681af7a-54b6-4d41-ad50-2760a22ea1c7",
  );

  static const modelExtension = ObjectId(
    Flags.isDebug
        ? "modelExtension [Type] c29d9dea-7ce6-48e5-aa9e-6ecb7b110cbe"
        : "c29d9dea-7ce6-48e5-aa9e-6ecb7b110cbe",
  );

  // static const interfaceModel = Flags.isDebug
  //     ? "interfaceModel [Type] 6cfc3307-898a-43c3-8a72-da0fd046880b"
  //     : "6cfc3307-898a-43c3-8a72-da0fd046880b";

  // static const implementationModel = Flags.isDebug
  //     ? "interfaceModel [Type] da22d71e-16d0-4527-8878-570338867d57"
  //     : "da22d71e-16d0-4527-8878-570338867d57";

  static const submodel = ObjectId(
    Flags.isDebug
        ? "submodel [Type] 9b535020-c267-4270-85ed-285597ca810d"
        : "9b535020-c267-4270-85ed-285597ca810d",
  );

  // static const interfaceSubmodel = Flags.isDebug
  //     ? "standaloneSubmodel [Type] 353099ab-7351-4f92-b733-2ca5851b39ef"
  //     : "353099ab-7351-4f92-b733-2ca5851b39ef";

  // static const implementationSubmodel = Flags.isDebug
  //     ? "implementationSubmodel [Type] 7dc14706-1b3e-41d0-8e34-a2d3798e9328"
  //     : "7dc14706-1b3e-41d0-8e34-a2d3798e9328";

  static const submodelExtension = ObjectId(
    Flags.isDebug
        ? "submodelExtension [Type] e3a838eb-1dee-41d5-9e7f-2699ea3286e0"
        : "e3a838eb-1dee-41d5-9e7f-2699ea3286e0",
  );

  static const collection = ObjectId(
    Flags.isDebug
        ? "collection [Type] bc8ae353-d08d-40d0-8f39-25d244a4ead2"
        : "bc8ae353-d08d-40d0-8f39-25d244a4ead2",
  );

  static const folder = ObjectId(
    Flags.isDebug
        ? "folder [Type] c8d24358-5f29-44d7-96a3-26f538d92969"
        : "c8d24358-5f29-44d7-96a3-26f538d92969",
  );

  // static const folder = Flags.isDebug
  //     ? "folder [Type] 93262e8e-7aec-464a-b434-108100d914bd"
  //     : "93262e8e-7aec-464a-b434-108100d914bd";

  static const command = ObjectId(
    Flags.isDebug
        ? "command [Type] 1f5cdd3a-97f6-47eb-bf20-abb5d8f29103"
        : "1f5cdd3a-97f6-47eb-bf20-abb5d8f29103",
  );

  static const note = ObjectId(
    Flags.isDebug
        ? "note [Type] e94bfe17-f74a-44dd-8db3-ae13b01191e8"
        : "e94bfe17-f74a-44dd-8db3-ae13b01191e8",
  );

  static const specificProblemNote = ObjectId(
    Flags.isDebug
        ? "specificProblemNote [Type] 7f92ea42-4ee2-4601-8645-d4f861246b83"
        : "7f92ea42-4ee2-4601-8645-d4f861246b83",
  );

  static const generalProblemNote = ObjectId(
    Flags.isDebug
        ? "generalProblemNote [Type] 007bb1fe-52bb-4180-89ff-79025a3e229b"
        : "007bb1fe-52bb-4180-89ff-79025a3e229b",
  );

  static const blockType = ObjectId(
    Flags.isDebug
        ? "blockType [Type] 1f30c992-d416-4581-bbc5-cb5787e9ed11"
        : "1f30c992-d416-4581-bbc5-cb5787e9ed11",
  );

  static const inlineType = ObjectId(
    Flags.isDebug
        ? "inlineType [Type] 74d5ac2c-89ba-4a7a-b2b7-661df03bb38e"
        : "74d5ac2c-89ba-4a7a-b2b7-661df03bb38e",
  );

  static const contentIdea = ObjectId(
    Flags.isDebug
        ? "contentIdea [Type] 308100db-aaac-4b98-b8f2-4c9b2d6204ca"
        : "308100db-aaac-4b98-b8f2-4c9b2d6204ca",
  );
}

// static const file = Flags.isDebug
//     ? "file [Type] 9011dbb0-73f1-4a48-9bc6-9fc230e714e1"
//     : "9011dbb0-73f1-4a48-9bc6-9fc230e714e1";

// static const link = Flags.isDebug
//     ? "link [Type] ff754d48-e3a5-4070-b544-1b69af690d8a"
//     : "ff754d48-e3a5-4070-b544-1b69af690d8a";

// static const lifeOsLink = Flags.isDebug
//     ? "lifeOsLink [Type] e4517b06-03df-4ff0-92d5-e4b06b8f27c2"
//     : "e4517b06-03df-4ff0-92d5-e4b06b8f27c2";

abstract class ResourcePropertyTypes {
  static const ownedByResources = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByResources [Property-Type] 4c79ffea-73b1-4825-8037-b342882c40dc"
          : "4c79ffea-73b1-4825-8037-b342882c40dc",
    ),
  );

  static const ownsResources = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsResources [Property-Type] 02bd8c66-d470-468e-98d6-820a663006cc"
          : "02bd8c66-d470-468e-98d6-820a663006cc",
    ),
  );
}

abstract class DivisionRolePropertyTypes {
  static const ownedByObjects = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByObjects [Property-Type] ed55afa9-4014-4599-b5ea-24c46bb6784a"
          : "ed55afa9-4014-4599-b5ea-24c46bb6784a",
    ),
  );
}

abstract class ModelRolePropertyTypes {
  static const ownsObjectTypes = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsObjectTypes [Property-Type] 2055f7ed-57a9-45b3-a391-b852501c517d"
          : "2055f7ed-57a9-45b3-a391-b852501c517d",
    ),
  );

  static const ownObjectRoles = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownObjectRoles [Property-Type] f57c4795-8144-4484-b36d-314c20a74184"
          : "f57c4795-8144-4484-b36d-314c20a74184",
    ),
  );

  static const ownsValueTypes = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsValueTypes [Property-Type] 93196c41-2f05-4fa7-a1ae-7c99b324f4bf"
          : "93196c41-2f05-4fa7-a1ae-7c99b324f4bf",
    ),
  );

  static const ownsSubmodels = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsSubmodels [Property-Type] bb9ce888-f891-4da4-bd3c-7eebf1d80fd1"
          : "bb9ce888-f891-4da4-bd3c-7eebf1d80fd1",
    ),
  );
}

abstract class ModelPropertyTypes {
  static const importedFrom = ReferenceAttributeType(
    ObjectId(
      Flags.isDebug
          ? "importedFrom [Property-Type] 7640442f-056f-4181-8748-100754303265"
          : "7640442f-056f-4181-8748-100754303265",
    ),
  );

  static const ownedByOwner = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByOwner [Property-Type] 8fd2da1d-730b-4134-8fa2-9c92a11ad8ca"
          : "8fd2da1d-730b-4134-8fa2-9c92a11ad8ca",
    ),
  );
}

// abstract class ModelPropertyTypes {
//
//     Flags.isDebug
//         ? "name [Property-Type] 5e5126ce-3619-4d95-ae30-d3178724c041"
//         : "5e5126ce-3619-4d95-ae30-d3178724c041",
//   );

//   static const importedFrom = TextAttributeType(
//     Flags.isDebug
//         ? "importedFrom [Property-Type] 0e8153b2-9998-4933-ba52-dbd51da7772a"
//         : "0e8153b2-9998-4933-ba52-dbd51da7772a",
//   );
// }

abstract class SubmodelPropertyTypes {
  static const ownedByModel = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByModel [Property-Type] 435c249f-6c1a-4964-9edd-f708c6e93268"
          : "435c249f-6c1a-4964-9edd-f708c6e93268",
    ),
  );
}

// abstract class DataModelPropertyTypes {

//   static const ownsBlockTypes = ToManyRelationshipType(
//     Flags.isDebug
//         ? ">BlockTypes [Property-Type] 79a5fc87-cc00-43f3-84bb-cfbc9a6783c9"
//         : "79a5fc87-cc00-43f3-84bb-cfbc9a6783c9",
//   );

//   static const ownsInlineTypes = ToManyRelationshipType(
//     Flags.isDebug
//         ? ">InlineTypes [Property-Type] ea32542c-fbc7-42c6-8fac-ed1073d4114e"
//         : "ea32542c-fbc7-42c6-8fac-ed1073d4114e",
//   );
// }

abstract class ToolPropertyTypes {
  static const importedFrom = ReferenceAttributeType(
    ObjectId(
      Flags.isDebug
          ? "importedFrom [Property-Type] e1f4671c-92a1-4f10-b043-59ea2abe651f"
          : "e1f4671c-92a1-4f10-b043-59ea2abe651f",
    ),
  );

  static const ownsUsers = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsUsers [Property-Type] 08aaa856-90ed-4f3d-bc29-a5cdcb6855bf"
          : "08aaa856-90ed-4f3d-bc29-a5cdcb6855bf",
    ),
  );
}

abstract class NamedObjectRolePropertyTypes {
  static const name = TextAttributeType(
    ObjectId(
      Flags.isDebug
          ? "name [Property-Type] 0379a03c-0692-4cdf-9c88-b4319779e32d"
          : "0379a03c-0692-4cdf-9c88-b4319779e32d",
    ),
  );
}

abstract class ModelContainerRolePropertyTypes {
  static const ownsModels = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsModels [Property-Type] 1ba0c016-85fa-49d3-98d3-f47a02a00e5c"
          : "1ba0c016-85fa-49d3-98d3-f47a02a00e5c",
    ),
  );
}

abstract class ExternalObjectPropertyTypes {
  static const instanceName = TextAttributeType(
    ObjectId(
      Flags.isDebug
          ? "instanceName [Property-Type] d9cb831a-a269-4e9c-a26f-c79d44188f25"
          : "d9cb831a-a269-4e9c-a26f-c79d44188f25",
    ),
  );

  static const typeName = TextAttributeType(
    ObjectId(
      Flags.isDebug
          ? "typeName [Property-Type] f2ff65e0-a24b-44c6-b2a3-507e79e05681"
          : "f2ff65e0-a24b-44c6-b2a3-507e79e05681",
    ),
  );

  static const link = TextAttributeType(
    ObjectId(
      Flags.isDebug
          ? "link [Property-Type] 6a6673bb-a7fb-4bfc-b16a-7c28af8c9a3d"
          : "6a6673bb-a7fb-4bfc-b16a-7c28af8c9a3d",
    ),
  );
}

abstract class ObjectPropertyTypes {
  static const type = ObjectAttributeType(
    ObjectId(
      Flags.isDebug
          ? "type [Property-Type] 5cae4ef3-7cad-49df-87ab-790f26692886"
          : "5cae4ef3-7cad-49df-87ab-790f26692886",
    ),
  );

  // static const createdBy = ObjectAttributeType(
  //   ObjectId(
  //     Flags.isDebug
  //         ? "createdBy [Property-Type] 763dd12d-be20-4ec9-9b78-114680252c04"
  //         : "763dd12d-be20-4ec9-9b78-114680252c04",
  //   ),
  // );

  static const includedIn = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "includedIn [Property-Type] 256697d8-97cb-4679-845c-9527d2abb9ca"
          : "256697d8-97cb-4679-845c-9527d2abb9ca",
    ),
  );

  static const ownsDivisions = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsDivisions [Property-Type] b687d29c-dac0-44cf-b555-7d720976de8a"
          : "b687d29c-dac0-44cf-b555-7d720976de8a",
    ),
  );

  static const syncStatus = CategoryAttributeType(
    ObjectId(
      Flags.isDebug
          ? "syncStatus [Property-Type] 2a7dd724-7469-4fe6-a36e-32bb5686dd1a"
          : "2a7dd724-7469-4fe6-a36e-32bb5686dd1a",
    ),
  );

  static const content = TextAttributeType(
    ObjectId(
      Flags.isDebug
          ? "content [Property-Type] 76fed57a-1298-49d6-b065-b5062c911b11"
          : "76fed57a-1298-49d6-b065-b5062c911b11",
    ),
  );

  static const ownsContentIdeas = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsContentIdeas [Property-Type] 03436eb2-b73b-41b0-b30f-4b2e6130c4a6"
          : "03436eb2-b73b-41b0-b30f-4b2e6130c4a6",
    ),
  );

  static const references = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "references [Property-Type] 6f11c1c5-ecb0-4025-aa5d-55ab7521e4a7"
          : "6f11c1c5-ecb0-4025-aa5d-55ab7521e4a7",
    ),
  );

  static const referencedBy = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "referencedBy [Property-Type] 680a7107-57e9-496f-8de6-1792e147294a"
          : "680a7107-57e9-496f-8de6-1792e147294a",
    ),
  );
}

abstract class EntityPropertyTypes {}

abstract class ClassPropertyTypes {
  static const isAbstract = CategoryAttributeType(
    ObjectId(
      Flags.isDebug
          ? "isAbstract [Property-Type] 2cd6f0d8-69d4-4832-9a92-0245cc3a3f28"
          : "2cd6f0d8-69d4-4832-9a92-0245cc3a3f28",
    ),
  );

  static const ownsPropertyTypes = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsPropertyTypes [Property-Type] efb15422-3a5a-4f23-bdd3-42946a6d8724"
          : "efb15422-3a5a-4f23-bdd3-42946a6d87249",
    ),
  );
}

abstract class RolePropertyTypes {
  static const extendedByObjectTypes = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "extendedByObjectTypes [Property-Type] 1a6cea2f-36b4-4f22-bef2-052823cef6e4"
          : "1a6cea2f-36b4-4f22-bef2-052823cef6e4",
    ),
  );

  static const ownedByModel = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByModel [Property-Type] b2c7f60a-d96b-44f3-af78-932ab56c6dde"
          : "b2c7f60a-d96b-44f3-af78-932ab56c6dde",
    ),
  );

  static const extendedByObjectRoles = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "extendedByObjectRoles [Property-Type] 7228188f-3f81-4274-b50a-26eaa66b8ea9"
          : "7228188f-3f81-4274-b50a-26eaa66b8ea9",
    ),
  );

  static const extendsObjectRoles = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "extendsObjectRoles [Property-Type] 451c41c8-ec25-4b2e-8e4a-bd7d2702fc5f"
          : "451c41c8-ec25-4b2e-8e4a-bd7d2702fc5f",
    ),
  );
}

abstract class TypePropertyTypes {
  static const isExtension = CategoryAttributeType(
    ObjectId(
      Flags.isDebug
          ? "isExtension [Property-Type] b4959dd4-7f91-491e-8ba2-ea3c5260c967"
          : "b4959dd4-7f91-491e-8ba2-ea3c5260c967",
    ),
  );

  static const isSingleton = CategoryAttributeType(
    ObjectId(
      Flags.isDebug
          ? "isSingleton [Property-Type] c39959bd-6392-44cf-8b18-fe15a5a41e34"
          : "c39959bd-6392-44cf-8b18-fe15a5a41e34",
    ),
  );

  static const isStandalone = CategoryAttributeType(
    ObjectId(
      Flags.isDebug
          ? "isStandalone [Property-Type] b61c08bf-c545-4157-8b52-b3c02ef88923"
          : "b61c08bf-c545-4157-8b52-b3c02ef88923",
    ),
  );

  static const extendsObjectType = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "extendsObjectType [Property-Type] bb4470b0-f67f-42e2-a7ca-9d5a165376cc"
          : "bb4470b0-f67f-42e2-a7ca-9d5a165376cc",
    ),
  );

  static const extendsObjectRoles = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "extendsObjectRoles [Property-Type] 316ace84-c5d4-4c61-9b42-0f4a52d8217d"
          : "316ace84-c5d4-4c61-9b42-0f4a52d8217d",
    ),
  );

  static const extendedByObjectTypes = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "extendedByObjectTypes [Property-Type] a0637f9c-cc0d-4577-82b6-1f5e0f4105e3"
          : "a0637f9c-cc0d-4577-82b6-1f5e0f4105e3",
    ),
  );

  static const ownedByModel = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByModel [Property-Type] 2363d49a-97bb-4ba7-90b6-04f9511a4704"
          : "2363d49a-97bb-4ba7-90b6-04f9511a4704",
    ),
  );
}

abstract class PagePropertyTypes {}

abstract class ConceptPropertyTypes {}

abstract class ComplexRelationshipTypePropertyTypes {}

abstract class ValueTypePropertyTypes {
  static const ownedByModel = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByModel [Property-Type] ef667d27-a57c-484a-8d63-839403ecc2f5"
          : "ef667d27-a57c-484a-8d63-839403ecc2f5",
    ),
  );

  static const attributeTypes = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "attributeTypes [Property-Type] 9a5b87cf-4a11-4f72-a820-6d8bd2878c6b"
          : "9a5b87cf-4a11-4f72-a820-6d8bd2878c6b",
    ),
  );
}

abstract class PropertyTypePropertyTypes {
  // static const isSummary = CategoryAttributeType(
  //   ObjectId(
  //     Flags.isDebug
  //         ? "isSummary [Property-Type] 0a851836-32c6-4dd3-ac0d-5dd0093030ec"
  //         : "0a851836-32c6-4dd3-ac0d-5dd0093030ec",
  //   ),
  // );

  static const ownedByClass = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByClass [Property-Type] ed74fe6f-dd9c-475e-8fd9-5d2dfce4d61f"
          : "ed74fe6f-dd9c-475e-8fd9-5d2dfce4d61f",
    ),
  );

  static const isDerived = CategoryAttributeType(
    ObjectId(
      Flags.isDebug
          ? "isDerived [Property-Type] 07ef09c6-210b-4fba-8bd0-f43680eb823e"
          : "07ef09c6-210b-4fba-8bd0-f43680eb823e",
    ),
  );
}

abstract class RelationshipTypePropertyTypes {
  static const toClass = ObjectAttributeType(
    ObjectId(
      Flags.isDebug
          ? "toClass [Property-Type] 94164b86-10e3-40ff-8855-08aa43f7e7a5"
          : "94164b86-10e3-40ff-8855-08aa43f7e7a5",
    ),
  );

  static const cardinality = CategoryAttributeType(
    ObjectId(
      Flags.isDebug
          ? "cardinality [Property-Type] 5d258689-3669-432c-a884-aac97a86cc1f"
          : "5d258689-3669-432c-a884-aac97a86cc1f",
    ),
  );

  static const inverseRelationshipType = ObjectAttributeType(
    ObjectId(
      Flags.isDebug
          ? "inverseRelationshipType [Property-Type] eb317e81-b155-4c38-a195-ba203a134973"
          : "eb317e81-b155-4c38-a195-ba203a134973",
    ),
  );
}

abstract class OwnerRelationshipTypePropertyTypes {
  static const defaultChildType = ObjectAttributeType(
    ObjectId(
      Flags.isDebug
          ? "defaultChildType [Property-Type] 890a5e17-bb8d-4a78-a78a-d55f49330acd"
          : "890a5e17-bb8d-4a78-a78a-d55f49330acd",
    ),
  );
}

abstract class OwnedRelationshipTypePropertyTypes {}

abstract class AssociateRelationshipTypePropertyTypes {}

abstract class AttributeTypePropertyTypes {
  static const isRequired = CategoryAttributeType(
    ObjectId(
      Flags.isDebug
          ? "isRequired [Property-Type] 67464c23-e4e8-4004-b471-37c2f1682f85"
          : "67464c23-e4e8-4004-b471-37c2f1682f85",
    ),
  );
  static const valueType = ObjectAttributeType(
    ObjectId(
      Flags.isDebug
          ? "valueType [Property-Type] b2975bc9-4406-4c34-b345-d0b8e3b26158"
          : "b2975bc9-4406-4c34-b345-d0b8e3b26158",
    ),
  );
  //static const isHeader = BoolAttributeType("59d019e5-6099-45ef-b6ba-e9edf53f1a31");
}

abstract class ObjectPhasePropertyTypes {
  static const ownedByObjectPhaseAttributeType = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByPhaseAttributeType [Property-Type] 2b25e223-b515-4fd7-946a-432e0431b3b6"
          : "2b25e223-b515-4fd7-946a-432e0431b3b6",
    ),
  );

  static const extendsObjectPhase = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "extendsPhase [Property-Type] 320cb2ba-70da-4e48-a927-8eae9bd93b77"
          : "320cb2ba-70da-4e48-a927-8eae9bd93b77",
    ),
  );

  static const extendedByObjectPhases = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "extendedByPhases [Property-Type] 9b20b094-1d18-40af-b285-f2b1920192b9"
          : "9b20b094-1d18-40af-b285-f2b1920192b9",
    ),
  );
}

abstract class ObjectCategoryPropertyTypes {
  static const ownedByObjectCategoryAttributeType = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByObjectCategoryAttributeType [Property-Type] 1a3b7e2f-a79e-4036-bf5e-6a18e686f915"
          : "1a3b7e2f-a79e-4036-bf5e-6a18e686f915",
    ),
  );

  static const extendsObjectCategory = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "extendsObjectCategory [Property-Type] 2d43010c-449f-444b-9bd6-ab946c06b434"
          : "2d43010c-449f-444b-9bd6-ab946c06b434",
    ),
  );

  static const extendedByObjectCategories = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "extendedByCategories [Property-Type] 188d4dc7-63d3-48c2-b869-281cbe7d6ab8"
          : "188d4dc7-63d3-48c2-b869-281cbe7d6ab8",
    ),
  );
}

abstract class ObjectPhaseAttributeTypePropertyTypes {
  static const ownsObjectPhases = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsObjectPhases [Property-Type] a192133b-aa26-4c1e-b4e0-ed96edd93f20"
          : "a192133b-aa26-4c1e-b4e0-ed96edd93f20",
    ),
  );
}

abstract class ObjectCategoryAttributeTypePropertyTypes {
  static const ownsObjectCategories = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsObjectCategories [Property-Type] 063d1451-9050-42a9-a503-03757a065d25"
          : "063d1451-9050-42a9-a503-03757a065d25",
    ),
  );
}

abstract class TextAttributeTypePropertyTypes {
  static const isDisplayed = CategoryAttributeType(
    ObjectId(
      Flags.isDebug
          ? "isDisplayed [Property-Type] 7d3a9d74-6314-48aa-be6f-b78aa0aa1bdf"
          : "7d3a9d74-6314-48aa-be6f-b78aa0aa1bdf",
    ),
  );
}

abstract class GroupPropertyTypes {
  static const parentObject = ObjectAttributeType(
    ObjectId(
      Flags.isDebug
          ? "parentObject [Property-Type] 4a6e5594-5e5e-44dc-ad10-69a3fe500b94"
          : "4a6e5594-5e5e-44dc-ad10-69a3fe500b94",
    ),
  );

  static const parentRelationshipType = ObjectAttributeType(
    ObjectId(
      Flags.isDebug
          ? "parentRelationshipType [Property-Type] c7fd2453-f5d1-4312-9030-884b50a43734"
          : "c7fd2453-f5d1-4312-9030-884b50a43734",
    ),
  );

  static const targetsClass = ObjectAttributeType(
    ObjectId(
      Flags.isDebug
          ? "targetsClass [Property-Type] 2382d1ad-579c-4606-8135-fe162e5c369f"
          : "2382d1ad-579c-4606-8135-fe162e5c369f",
    ),
  );

  static const ownedByGroup = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByGroup [Property-Type] 1b26afb0-faa9-45c3-9bfd-77f378a43ca4"
          : "1b26afb0-faa9-45c3-9bfd-77f378a43ca4",
    ),
  );

  static const ownsGroups = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? ">Spaces [Property-Type] 8fc5129c-62fe-48de-a473-eecfa904dac6"
          : "5f6ff0fe-d3bc-4db6-9741-9d57b16316a6",
    ),
  );

  static const childObjects = ObjectListAttributeType(
    ObjectId(
      Flags.isDebug
          ? "childObjects [Property-Type] 64ab1bb6-358e-4397-9330-3bcb27914ebc"
          : "64ab1bb6-358e-4397-9330-3bcb27914ebc",
    ),
  );
}

abstract class BlockTypePropertyTypes {
  static const ownedByDataModel = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByDataModel [Property-Type] 73782481-343c-4cb9-bc2f-d4d631e8dbae"
          : "73782481-343c-4cb9-bc2f-d4d631e8dbae",
    ),
  );
}

abstract class InlineTypePropertyTypes {
  static const ownedByDataModel = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByDataModel [Property-Type] 0cf9d236-6e63-4e14-845c-e2e6e701a2b1"
          : "0cf9d236-6e63-4e14-845c-e2e6e701a2b1",
    ),
  );
}

abstract class ActorRolePropertyTypes {}

abstract class UserRolePropertyTypes {
  static const email = TextAttributeType(
    ObjectId(
      Flags.isDebug
          ? "email [Property-Type] 3e9b5850-fab2-4f7b-8500-174ec2ab8100"
          : "3e9b5850-fab2-4f7b-8500-174ec2ab8100",
    ),
  );

  static const link = TextAttributeType(
    ObjectId(
      Flags.isDebug
          ? "link [Property-Type] 28396143-f32b-4186-9528-9951ab8b3d93"
          : "28396143-f32b-4186-9528-9951ab8b3d93",
    ),
  );

  static const responsibleForContentIdes = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "responsibleForContentIdes [Property-Type] 513cf6c7-1122-4d73-a498-84be8125436b"
          : "513cf6c7-1122-4d73-a498-84be8125436b",
    ),
  );

  static const ownedByTool = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByTool [Property-Type] 355b1f96-ed6f-4bc6-9958-4c8d54460972"
          : "355b1f96-ed6f-4bc6-9958-4c8d54460972",
    ),
  );
}

abstract class SystemActorPropertyTypes {}

abstract class CollectionPropertyTypes {}

abstract class CollectionRolePropertyTypes {
  static const contains = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "contains [Property-Type] 40522293-0af6-4fa3-97bf-4fd8c1daae4d"
          : "40522293-0af6-4fa3-97bf-4fd8c1daae4d",
    ),
  );
}

abstract class ReferenceCollectionRolePropertyTypes {
  static const contains = ObjectListAttributeType(
    ObjectId(
      Flags.isDebug
          ? "contains [Property-Type] 7959ab22-4c6a-42a2-a49e-7a7543d62de2"
          : "7959ab22-4c6a-42a2-a49e-7a7543d62de2",
    ),
  );
}

abstract class ContentIdeaPropertyTypes {
  static const ownedByObjects = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByObjects [Property-Type] 8c82c5d7-35c0-49f6-ba2e-3a4446445dda"
          : "8c82c5d7-35c0-49f6-ba2e-3a4446445dda",
    ),
  );

  static const assignedTo = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "assignedTo [Property-Type] b5f1620d-86a8-411b-9722-0c5003fd46ee"
          : "b5f1620d-86a8-411b-9722-0c5003fd46ee",
    ),
  );
}
