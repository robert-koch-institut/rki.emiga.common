# {{page-title}}

Die folgende Abbildung zeigt die beteiligten Profile und ihre wesentliche Beziehung zueinander.

{{render:guides/implementationguides.common/PlantUML/PNGs/AdditionalPropertiesClasses.png}}

Die Definition **Zusätzlicher Eigenschaften** erfolgt über eine `Questionnaire`-Ressourceninstanz gemäß dem Profil `AdditionalPropertiesQuestionnaire`. Die einzelnen Eigenschaften (Attribute) werden dabei über `Questionnaire.item` strukturiert festgelegt.
Die erfassten Werte werden in einer `QuestionnaireResponse`-Ressourceninstanz gemäß dem Profil `AdditionalPropertiesQuestionnaireResponse` abgebildet. Diese referenziert über `QuestionnaireResponse.questionnaire` verpflichtend das zugehörige `Questionnaire`.

Die folgende Abbildung zeigt den Zusammenhang zwischen der Definition einer zusätzlichen Eigenschaft und dem zugehörigen Wert auf Item-Ebene.

{{render:guides/implementationguides.common/PlantUML/PNGs/AdditionalPropertiesOverview.png}}

Die Definition einer Entität vom Typ **Zusätzliche Eigenschaft** wird in einem `Questionnaire.item` abgebildet. Der zugehörige Wert wird in einem `QuestionnaireResponse.item` erfasst. Die Zuordnung zwischen beiden erfolgt über die übereinstimmende `linkId`.

Ein `AdditionalPropertiesQuestionnaire` kann über EMIGA-spezifische Identifier identifiziert werden. Das Profil unterstützt insbesondere `EmigaID`, `EmigaFileNumber` und `SurvNetFileNumber`.