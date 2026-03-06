import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
import 'package:relathy_shared/domain_layer/core_module/data/system_property_types.dart';
import 'package:relathy_shared/generic_layer/flags/flags.dart';

abstract class ProgressModelIds {
  static const progress = ObjectId(
    Flags.isDebug
        ? "progress [Model] c86266d3-c2bd-42f0-b67e-9b1a485f47a3"
        : "c86266d3-c2bd-42f0-b67e-9b1a485f47a3",
  );
}

abstract class ProgressCategoryIds {
  static const achivedGoal = ObjectId(
    Flags.isDebug
        ? "achivedAchievableGoal [Type] d1e00f39-c6f6-4451-b1d1-ea632f0870bc"
        : "d1e00f39-c6f6-4451-b1d1-ea632f0870bc",
  );

  static const committedObjective = ObjectId(
    Flags.isDebug
        ? "committedObjective [Type] 05bcab4c-3a84-4993-861e-abe31291846e"
        : "05bcab4c-3a84-4993-861e-abe31291846e",
  );

  static const endedObjective = ObjectId(
    Flags.isDebug
        ? "endedObjective [Type] 837f9ff4-8f19-460a-80bb-92c35779c06f"
        : "837f9ff4-8f19-460a-80bb-92c35779c06f",
  );

  static const committedAction = ObjectId(
    Flags.isDebug
        ? "committedAction [Type] 040eb060-c78d-43cb-8b4e-7a2416204b13"
        : "040eb060-c78d-43cb-8b4e-7a2416204b13",
  );

  static const endedAction = ObjectId(
    Flags.isDebug
        ? "endedAction [Type] 7c01730b-1e19-49db-8855-78271af9ba86"
        : "7c01730b-1e19-49db-8855-78271af9ba86",
  );

  static const completedAction = ObjectId(
    Flags.isDebug
        ? "completedAction [Type] a9411b14-22a2-431b-867b-82423e4b721b"
        : "a9411b14-22a2-431b-867b-82423e4b721b",
  );

  static const painCausingGoal = ObjectId(
    Flags.isDebug
        ? "painCausingGoal [Type] 21a6e486-6f1a-4b16-9e47-8ef0ab58551b"
        : "21a6e486-6f1a-4b16-9e47-8ef0ab58551b",
  );

  static const workPackageAction = ObjectId(
    Flags.isDebug
        ? "workPackageAction [Type] 27c3d2f4-132a-4352-84ea-0fefb16383fa"
        : "27c3d2f4-132a-4352-84ea-0fefb16383fa",
  );
}

abstract class ProgressKindIds {
  static const processActivity = ObjectId(
    Flags.isDebug
        ? "processActivity [Type] 2135006f-ad42-4117-842e-93692aaf1b39"
        : "2135006f-ad42-4117-842e-93692aaf1b39",
  );
}

abstract class ProgressTypeIds {
  static const space = ObjectId(
    Flags.isDebug
        ? "space [Type] aab79fc8-b9fe-4048-a63e-905a994a8953"
        : "aab79fc8-b9fe-4048-a63e-905a994a8953",
  );

  static const area = ObjectId(
    Flags.isDebug
        ? "area [Type] 982077ca-2745-414e-865f-75cbc87a4df3"
        : "982077ca-2745-414e-865f-75cbc87a4df3",
  );

  static const mainArea = ObjectId(
    Flags.isDebug
        ? "mainArea [Type] 6a718899-647b-47e9-8b5d-89e107121798"
        : "6a718899-647b-47e9-8b5d-89e107121798",
  );

  static const workspaceArea = ObjectId(
    Flags.isDebug
        ? "spaceArea [Type] 6c17386a-91dd-4e83-93f3-c6167b4f4a19"
        : "6c17386a-91dd-4e83-93f3-c6167b4f4a19",
  );

  static const workbaseArea = ObjectId(
    Flags.isDebug
        ? "workbaseArea [Type] 5063ec07-e637-48af-8841-c6c88f4a3069"
        : "5063ec07-e637-48af-8841-c6c88f4a3069",
  );

  static const generalArea = ObjectId(
    Flags.isDebug
        ? "generalArea [Type] 6e36b7da-dbbc-437f-adf4-d5c34ba5f24d"
        : "6e36b7da-dbbc-437f-adf4-d5c34ba5f24d",
  );

  static const goal = ObjectId(
    Flags.isDebug
        ? "goal [Type] 06bfd3ed-6e8e-4485-8a03-11374ec0f707"
        : "06bfd3ed-6e8e-4485-8a03-11374ec0f707",
  );

  static const metricGoal = ObjectId(
    Flags.isDebug
        ? "metricGoal [Type] 86bb1add-9b92-4181-9625-6e760b762785"
        : "86bb1add-9b92-4181-9625-6e760b762785",
  );

  static const milestoneGoal = ObjectId(
    Flags.isDebug
        ? "milestoneGoal [Type] acf52628-207f-4095-b4b1-14c43c61d15d"
        : "acf52628-207f-4095-b4b1-14c43c61d15d",
  );

  static const objective = ObjectId(
    Flags.isDebug
        ? "objective [Type] 6400c065-3a24-4847-8705-1412f8f4e6fc"
        : "6400c065-3a24-4847-8705-1412f8f4e6fc",
  );

  static const metricObjective = ObjectId(
    Flags.isDebug
        ? "metricObjective [Type] 0782871e-b45e-4bdd-be02-3eb2aa3a819c"
        : "0782871e-b45e-4bdd-be02-3eb2aa3a819c",
  );

  static const milestoneObjective = ObjectId(
    Flags.isDebug
        ? "milestoneObjective [Type] e964b152-ee35-4ef8-b43f-e9da75bc5743"
        : "e964b152-ee35-4ef8-b43f-e9da75bc5743",
  );

  static const workIdea = ObjectId(
    Flags.isDebug
        ? "workIdea [Type] c7a5c087-1eb5-4f2e-a365-a67ba622142d"
        : "c7a5c087-1eb5-4f2e-a365-a67ba622142d",
  );

  static const subtask = ObjectId(
    Flags.isDebug
        ? "subtask [Type] b1bab897-7129-4a9a-837b-c54e8b111df2"
        : "b1bab897-7129-4a9a-837b-c54e8b111df2",
  );

  static const task = ObjectId(
    Flags.isDebug
        ? "task [Type] 6eedd7e9-5eda-4cf1-9427-49027ac8ce90"
        : "6eedd7e9-5eda-4cf1-9427-49027ac8ce90",
  );

  static const microtask = ObjectId(
    Flags.isDebug
        ? "microtask [Type] a72c153a-aa43-45d7-b212-5370b884ed9c"
        : "a72c153a-aa43-45d7-b212-5370b884ed9c",
  );

  static const project = ObjectId(
    Flags.isDebug
        ? "project [Type] 89b93674-efaa-4816-b6cf-351cc7ba3f74"
        : "89b93674-efaa-4816-b6cf-351cc7ba3f74",
  );

  static const subproject = ObjectId(
    Flags.isDebug
        ? "subproject [Type] 94e0b400-b0a1-4126-ab9e-f5ed87346115"
        : "94e0b400-b0a1-4126-ab9e-f5ed87346115",
  );

  static const program = ObjectId(
    Flags.isDebug
        ? "program [Type] 2ddefa22-5c93-4f3b-811e-c3392039da3f"
        : "2ddefa22-5c93-4f3b-811e-c3392039da3f",
  );

  static const microtaskBatcher = ObjectId(
    Flags.isDebug
        ? "microtaskBatcher [Type] ab06bbaf-0411-405d-96d6-3ec6f987b667"
        : "ab06bbaf-0411-405d-96d6-3ec6f987b667",
  );

  static const activity = ObjectId(
    Flags.isDebug
        ? "activity [Type] 289aee23-b222-4141-850f-0bf2ed7847d8"
        : "289aee23-b222-4141-850f-0bf2ed7847d8",
  );

  static const subactivity = ObjectId(
    Flags.isDebug
        ? "subActivity [Type] ff92e53c-673b-49b6-aa47-900bb5623aea"
        : "ff92e53c-673b-49b6-aa47-900bb5623aea",
  );

  static const operatingPrinciple = ObjectId(
    Flags.isDebug
        ? "operatingPrinciple [Type] ee936172-12f8-47c9-b3c2-b9a2c2efc112"
        : "ee936172-12f8-47c9-b3c2-b9a2c2efc112",
  );

  static const activityOperatingPrinciple = ObjectId(
    Flags.isDebug
        ? "activityOperatingPrinciple [Type] f6f1a54c-d0e7-4a66-b6f6-44bed8851587"
        : "f6f1a54c-d0e7-4a66-b6f6-44bed8851587",
  );

  static const workIdeaOperatingPrinciple = ObjectId(
    Flags.isDebug
        ? "workIdeaOperatingPrinciple [Type] 9d08d4b8-52f9-4384-a0b6-9a90780269a2"
        : "9d08d4b8-52f9-4384-a0b6-9a90780269a2",
  );

  static const spaceOperatingPrinciple = ObjectId(
    Flags.isDebug
        ? "spaceOperatingPrinciple [Type] 214204cc-23e0-4628-8cf9-4992dfb50aa6"
        : "214204cc-23e0-4628-8cf9-4992dfb50aa6",
  );

  static const trackingRoutine = ObjectId(
    Flags.isDebug
        ? "trackingRoutine [Type] 35ca4c2a-16c6-40c3-a6a7-b278c6ddbc58"
        : "35ca4c2a-16c6-40c3-a6a7-b278c6ddbc58",
  );
}

abstract class AreaPropertyTypes {
  static const ownsGoals = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? ">Goals [Property-Type] f2318d65-2f37-45a6-b77a-e2e3d4e92c71"
          : "f2318d65-2f37-45a6-b77a-e2e3d4e92c71",
    ),
  );

  static const ownsSpaces = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? ">Spaces [Property-Type] e5c54fc5-0a1d-4df8-b0d1-bfdc887d6f03"
          : "e5c54fc5-0a1d-4df8-b0d1-bfdc887d6f03",
    ),
  );

  static const ownsWorkIdeas = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsWorkIdeas [Property-Type] 28c3295c-ac0c-42a7-b541-dd0f7b7b8fba"
          : "28c3295c-ac0c-42a7-b541-dd0f7b7b8fba",
    ),
  );

  static const ownsActivities = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? ">Activities [Property-Type] a76c63d7-2e23-46ff-82fd-1ce0bc517748"
          : "a76c63d7-2e23-46ff-82fd-1ce0bc517748",
    ),
  );

  static const ownsOperatingPrinciples = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsOperatingPrinciples [Property-Type] 97657c188-9680-41f1-954f-3043db0c7210"
          : "97657c188-9680-41f1-954f-3043db0c7210",
    ),
  );
}

abstract class SpacePropertyTypes {
  static const ownedByArea = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByAreas [Property-Type] 0d701f52-4378-4d7a-ae53-d95a6e022b9d"
          : "0d701f52-4378-4d7a-ae53-d95a6e022b9d",
    ),
  );

  static const ownedBySpaces = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedBySpaces [Property-Type] e900e4ad-ea66-4f81-b2f3-d676f793952b"
          : "e900e4ad-ea66-4f81-b2f3-d676f793952b",
    ),
  );

  static const ownsSpaces = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsSpaces [Property-Type] 39c83fdf-8235-487e-9c48-1c0f00b21a73"
          : "39c83fdf-8235-487e-9c48-1c0f00b21a73",
    ),
  );

  static const ownsWorkIdeas = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsWorkIdeas [Property-Type] d197e80d-5607-4fe2-8167-aa28e0f33d57"
          : "d197e80d-5607-4fe2-8167-aa28e0f33d57",
    ),
  );

  static const ownsActivities = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? ">Activities [Property-Type] b003d218-362c-4880-9d60-ed4d6181152d"
          : "b003d218-362c-4880-9d60-ed4d6181152d",
    ),
  );

  static const ownsSpaceOperatingPrinciples = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsSpaceOperatingPrinciples [Property-Type] 927ca8fd-6c11-4bb3-a0ef-9ecb88e0330b"
          : "927ca8fd-6c11-4bb3-a0ef-9ecb88e0330b",
    ),
  );
}

abstract class MainAreaPropertyTypes {
  static const assignedToTeamWorkspace = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "assignedToTeamWorkspace [Property-Type] 316756bf-31b0-4cc5-8fa7-510ca4c6d19d"
          : "316756bf-31b0-4cc5-8fa7-510ca4c6d19d",
    ),
  );

  static const ownedByOS = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByOS [Property-Type] 4cd69fee-59c2-448a-8858-96e99493bef5"
          : "4cd69fee-59c2-448a-8858-96e99493bef5",
    ),
  );

  static const ownedByMainAreas = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByMainAreas [Property-Type] c03c020c-81f5-4805-ae38-5292678cd2cf"
          : "c03c020c-81f5-4805-ae38-5292678cd2cf",
    ),
  );

  static const ownsMainAreas = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsMainAreas [Property-Type] ab6c1fc2-a578-43cd-a1a2-53cf27fb72b3"
          : "ab6c1fc2-a578-43cd-a1a2-53cf27fb72b3",
    ),
  );
}

abstract class GeneralAreaPropertyTypes {
  static const ownedByWorkspace = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByWorkspace [Property-Type] b8932cf1-dc3b-4fe2-a479-5335d6ad2c50"
          : "b8932cf1-dc3b-4fe2-a479-5335d6ad2c50",
    ),
  );

  static const ownedByWorkbase = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByWorkbase [Property-Type] a67a528b-5529-4cc7-8bd2-00cb5ef34cac"
          : "a67a528b-5529-4cc7-8bd2-00cb5ef34cac",
    ),
  );
}

abstract class WorkbaseAreaPropertyTypes {
  static const assignedToTeamWorkspace = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "assignedToTeamWorkspace [Property-Type] 0b67b721-26b4-43ba-bed3-59d57d96bc61"
          : "0b67b721-26b4-43ba-bed3-59d57d96bc61",
    ),
  );

  static const ownedByWorkbase = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByWorkbase [Property-Type] 52db78ec-412a-41f8-9c0b-75422eb09558"
          : "52db78ec-412a-41f8-9c0b-75422eb09558",
    ),
  );

  static const ownedByWorkbaseAreas = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByWorkbaseAreas [Property-Type] db7a037c-8c2d-4270-97c7-4f4530aa7825"
          : "db7a037c-8c2d-4270-97c7-4f4530aa7825",
    ),
  );

  static const ownsWorkbaseAreas = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? ">WorkbaseAreas [Property-Type] 9cc9b86f-5273-4b4c-914b-19976c91b910"
          : "9cc9b86f-5273-4b4c-914b-19976c91b910",
    ),
  );
}

abstract class WorkspaceAreaPropertyTypes {
  static const ownedByWorkspace = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByWorkspace [Property-Type] d4814867-0fd9-443b-8646-f2a70914d97e"
          : "d4814867-0fd9-443b-8646-f2a70914d97e",
    ),
  );

  static const ownedByWorkspaceAreas = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByWorkspaceAreas [Property-Type] 323be4b5-9202-4333-b52e-5f82d18a41e5"
          : "323be4b5-9202-4333-b52e-5f82d18a41e5",
    ),
  );

  static const ownsWorkspaceAreas = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? ">WorkspaceAreas [Property-Type] 28507713-2281-406c-a930-c95a555ad5ae"
          : "28507713-2281-406c-a930-c95a555ad5ae",
    ),
  );
}

abstract class GoalPropertyTypes {
  static const ownedByAreas = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByAreas [Property-Type] c185de39-55a7-4e35-a464-9f6c77f66fce"
          : "c185de39-55a7-4e35-a464-9f6c77f66fce",
    ),
  );

  static const partOfGoals = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "partOfGoals [Property-Type] 3c702e66-9f33-4b96-ba07-41dbb3ab05c8"
          : "3c702e66-9f33-4b96-ba07-41dbb3ab05c8",
    ),
  );

  static const hasGoals = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "madeOfGoals [Property-Type] 1a75a9c6-0139-416f-8767-f21d481f2459"
          : "1a75a9c6-0139-416f-8767-f21d481f2459",
    ),
  );

  static const supportsGoals = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "indirectSupportsGoals [Property-Type] 3183b0ab-043c-49e3-8ed4-1647551d8740"
          : "3183b0ab-043c-49e3-8ed4-1647551d8740",
    ),
  );

  static const supportedByGoals = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "indirectSupportedByGoals [Property-Type] 5d390275-76e0-4a04-b7b0-8a856ef076a5"
          : "5d390275-76e0-4a04-b7b0-8a856ef076a5",
    ),
  );

  static const hasObjectives = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "hasObjectives [Property-Type] a45566f1-a955-426c-aa27-3292f9bfefb1"
          : "a45566f1-a955-426c-aa27-3292f9bfefb1",
    ),
  );

  static const supportedByWorkIdeas = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "supportedByWorkIdeas [Property-Type] fb92b27e-6a5d-478d-9fe6-356f5fef8c19"
          : "fb92b27e-6a5d-478d-9fe6-356f5fef8c19",
    ),
  );

  static const supportedByOperatingPrinciples = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "supportedByOperatingPrinciples [Property-Type] 90115dee-6a7f-4977-8f30-fbc736faf3d6"
          : "90115dee-6a7f-4977-8f30-fbc736faf3d6",
    ),
  );
}

abstract class ObjectivePropertyTypes {
  static const partOfGoal = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "partOfGoal [Property-Type] eecdb85a-ba73-4317-bace-716657d62124"
          : "eecdb85a-ba73-4317-bace-716657d62124",
    ),
  );

  static const ownedByWorkspace = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByWorkspace [Property-Type] 4c2d085b-28af-463f-b9ce-90450af09097"
          : "4c2d085b-28af-463f-b9ce-90450af09097",
    ),
  );

  static const ownedByWorkbase = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByWorkbase [Property-Type] eee521ae-62b4-467e-b6b8-9f9bbb07e5da"
          : "eee521ae-62b4-467e-b6b8-9f9bbb07e5da",
    ),
  );
}

abstract class MicroTaskPropertyTypes {
  static const ownedByMicrotaskBatcher = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByMicrotaskBatcher [Property-Type] 31eb9dc9-96b7-47b1-8866-3b717cddaf0b"
          : "31eb9dc9-96b7-47b1-8866-3b717cddaf0b",
    ),
  );
}

abstract class WorkIdeaPropertyTypes {
  static const supportsGoals = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "supportsGoals [Property-Type] d9b7aaed-395b-4446-9b19-10ef18df0b37"
          : "d9b7aaed-395b-4446-9b19-10ef18df0b37",
    ),
  );

  static const ownedByAreas = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByAreas [Property-Type] 013c1000-0ab4-4350-8f83-27efc2def111"
          : "013c1000-0ab4-4350-8f83-27efc2def111",
    ),
  );

  static const ownedBySpaces = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedBySpaces [Property-Type] 81221c33-4cb7-4943-bf72-94c4cff3e7e6"
          : "81221c33-4cb7-4943-bf72-94c4cff3e7e6",
    ),
  );

  static const ownedByWorkIdeas = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByWorkIdeas [Property-Type] 21f3adad-c918-4b5a-87eb-77a1abca80ca"
          : "21f3adad-c918-4b5a-87eb-77a1abca80ca",
    ),
  );

  static const ownsWorkIdeas = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsWorkIdeas [Property-Type] f92152e0-d114-435a-939b-ba7e9b4004cf"
          : "f92152e0-d114-435a-939b-ba7e9b4004cf",
    ),
  );

  static const ownsWorkIdeaOperatingPrinciples = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsWorkIdeaOperatingPrinciples [Property-Type] 78178c8c-c248-44fa-b5ad-87653ad6b909"
          : "78178c8c-c248-44fa-b5ad-87653ad6b909",
    ),
  );

  static const ownsActivities = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? ">Activities [Property-Type] 7cea933a-be85-4b08-b139-76eb2b71de14"
          : "7cea933a-be85-4b08-b139-76eb2b71de14",
    ),
  );
}

abstract class MicrotaskBatcherPropertyTypes {
  static const ownsMicrotasks = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsMicrotasks [Property-Type] 868ac6cf-de1a-442d-9790-e642c2353b44"
          : "868ac6cf-de1a-442d-9790-e642c2353b44",
    ),
  );

  static const ownedByWorkspace = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByWorkspace [Property-Type] 44d67007-3153-489d-b186-37446e3fb78c"
          : "44d67007-3153-489d-b186-37446e3fb78c",
    ),
  );
}

abstract class OperatingPrinciplePropertyTypes {
  static const supportsGoals = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "supportsGoals [Property-Type] 9770d35e-045e-4a52-85bd-bb6d63930dde"
          : "9770d35e-045e-4a52-85bd-bb6d63930dde",
    ),
  );

  static const ownedByAreas = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByAreas [Property-Type] edeb6ed2-95a0-474d-922b-d26aab70a9e9"
          : "edeb6ed2-95a0-474d-922b-d26aab70a9e9",
    ),
  );
}

abstract class SpaceOperatingPrinciplePropertyTypes {
  static const ownedBySpaces = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByAreas [Property-Type] 4f5b5972-9b0d-408d-ac78-b8218b35761e"
          : "4f5b5972-9b0d-408d-ac78-b8218b35761e",
    ),
  );
}

abstract class WorkIdeaOperatingPrinciplePropertyTypes {
  static const ownedByWorkIdea = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByWorkIdea [Property-Type] 9a947781-2ded-4e0c-b0e4-a3e24e42d278"
          : "9a947781-2ded-4e0c-b0e4-a3e24e42d278",
    ),
  );
}

abstract class ActivityOperatingPrinciplePropertyTypes {
  static const ownedByActivity = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByActivity [Property-Type] df4db0dc-5bcd-446b-a09a-83c95a7a0134"
          : "df4db0dc-5bcd-446b-a09a-83c95a7a0134",
    ),
  );
}

abstract class ActivityPropertyTypes {
  static const ownedByAreas = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByAreas [Property-Type] dd848918-5574-45f1-bef4-701b4cd230b2"
          : "dd848918-5574-45f1-bef4-701b4cd230b2",
    ),
  );

  static const ownedBySpaces = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedBySpaces [Property-Type] 1913b682-a9cb-44d7-ac80-996ea0fb90a9"
          : "1913b682-a9cb-44d7-ac80-996ea0fb90a9",
    ),
  );

  static const ownedByWorkIdea = ToOneRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByWorkIdea [Property-Type] aaf964cc-1a9e-4361-b06a-97a73553ab3c"
          : "aaf964cc-1a9e-4361-b06a-97a73553ab3c",
    ),
  );

  static const ownedByActivities = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownedByActivities [Property-Type] 18402c71-9ad6-4097-921f-bf21139e8604"
          : "18402c71-9ad6-4097-921f-bf21139e8604",
    ),
  );

  static const ownsActivities = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? ">Activities [Property-Type] 3b019dee-d85a-4650-9c95-d706f855633b"
          : "3b019dee-d85a-4650-9c95-d706f855633b",
    ),
  );

  static const ownsOperatingPrinciples = ToManyRelationshipType(
    ObjectId(
      Flags.isDebug
          ? "ownsActivityOperatingPrinciples [Property-Type] 2ff88823-961b-4533-b41f-e997c32cae92"
          : "2ff88823-961b-4533-b41f-e997c32cae92",
    ),
  );
}
