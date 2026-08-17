# {{page-title}}

Dieser Abschnitt beschreibt die Anwendungsfälle zur Abbildung **zusätzlicher Eigenschaften** in EMIGA.

Zusätzliche Eigenschaften umfassen Metadaten und fachliche Zusatzinformationen, die ergänzend zu den regulären FHIR-Ressourcen strukturiert abgebildet werden können.

Die Definition der zusätzlichen Eigenschaften erfolgt als `Questionnaire`-Ressourceninstanz gemäß dem Profil `AdditionalPropertiesQuestionnaire`. Die zugehörigen Werte werden als `QuestionnaireResponse`-Ressourceninstanz gemäß dem Profil `AdditionalPropertiesQuestionnaireResponse` erfasst.

Durch die Trennung von Definition und Antwort kann die Struktur zusätzlicher Eigenschaften unabhängig von den konkret erfassten Werten verwaltet werden.

Die folgende Abbildung zeigt die beteiligten Profile und ihre wesentliche Beziehung zueinander.

{{render:guides/implementationguides.common/PlantUML/PNGs/AdditionalPropertiesClasses.png}}

## Überblick

Ein `AdditionalPropertiesQuestionnaire` definiert, welche zusätzlichen Eigenschaften erfasst werden können. Die einzelnen Eigenschaften werden über `Questionnaire.item` strukturiert beschrieben.

Eine `AdditionalPropertiesQuestionnaireResponse` enthält die zu diesem Fragebogen erfassten Werte. Über `QuestionnaireResponse.questionnaire` wird der zugrunde liegende Fragebogen referenziert.

Damit ergibt sich folgende grundlegende Zuordnung:

| Ressource | Bedeutung |
|---|---|
| `AdditionalPropertiesQuestionnaire` | Definition und Struktur zusätzlicher Eigenschaften |
| `AdditionalPropertiesQuestionnaireResponse` | Konkrete Werte zu den definierten zusätzlichen Eigenschaften |

Die folgende Abbildung zeigt den Zusammenhang zwischen der Definition einer zusätzlichen Eigenschaft und dem zugehörigen Wert auf Item-Ebene.

{{render:guides/implementationguides.common/PlantUML/PNGs/AdditionalPropertiesOverview.png}}

## Zusätzliche Eigenschaften definieren

Das Profil `AdditionalPropertiesQuestionnaire` basiert auf der FHIR-Ressource `Questionnaire` und dient der strukturierten Definition zusätzlicher Eigenschaften.

Die einzelnen Eigenschaften werden über `Questionnaire.item` abgebildet. Ein Item kann dabei eine einzelne zusätzliche Eigenschaft oder einen strukturellen Bestandteil des Fragebogens repräsentieren.

Das `Questionnaire` enthält damit die **Definition und Struktur der zusätzlichen Eigenschaften**, jedoch noch keine konkret erfassten Werte.

### Identifikation

Ein `AdditionalPropertiesQuestionnaire` kann über EMIGA-spezifische Identifier identifiziert werden. Das Profil unterstützt insbesondere:

- `EmigaID`
- `EmigaFileNumber`
- `SurvNetFileNumber`

Für `EmigaID` und `EmigaFileNumber` ist `Identifier.use = official` festgelegt. Für die `SurvNetFileNumber` wird `Identifier.use = temp` verwendet.

### Sichtbarkeit und Verantwortlichkeit

Über `Questionnaire.meta.security` werden die Sichtbarkeit und Verantwortlichkeit der Ressource beschrieben.

Das Profil sieht hierfür mindestens zwei Security Labels vor:

- `visibility` für die Sichtbarkeit der Ressource
- `responsibility` für die verantwortliche Stelle

Die Sichtbarkeit wird über das CodeSystem `ResourceVisibilityType` kodiert und ist an das ValueSet `AnnotationResourceVisibilityType` gebunden. Die Verantwortlichkeit wird über das CodeSystem `ResourceResponsibility` angegeben.

## Werte zusätzlicher Eigenschaften erfassen

Das Profil `AdditionalPropertiesQuestionnaireResponse` basiert auf der FHIR-Ressource `QuestionnaireResponse` und dient der strukturierten Abbildung der zu einem `AdditionalPropertiesQuestionnaire` erfassten Werte.

Jede `AdditionalPropertiesQuestionnaireResponse` referenziert über `QuestionnaireResponse.questionnaire` den zugrunde liegenden Fragebogen. Die Referenz ist verpflichtend.

Die konkreten Werte werden über `QuestionnaireResponse.item` und die darin enthaltenen Antworten abgebildet. Mindestens ein `QuestionnaireResponse.item` ist erforderlich.

Auf Item-Ebene ergibt sich damit folgende Zuordnung:

- `Questionnaire.item` definiert die zusätzliche Eigenschaft.
- `QuestionnaireResponse.item` ordnet den erfassten Wert der entsprechenden Eigenschaft zu.
- `QuestionnaireResponse.item.answer` enthält den konkreten Wert.

Die Zuordnung der korrespondierenden Items erfolgt gemäß dem FHIR-Modell über `linkId`.

### Sichtbarkeit und Verantwortlichkeit

Auch die `AdditionalPropertiesQuestionnaireResponse` enthält über `meta.security` Angaben zu Sichtbarkeit und Verantwortlichkeit.

Wie beim zugehörigen `AdditionalPropertiesQuestionnaire` werden mindestens die Security Labels `visibility` und `responsibility` geführt.

Fragebogendefinition und Antwort können damit jeweils hinsichtlich ihrer Sichtbarkeit und organisatorischen Verantwortlichkeit eingeordnet werden.

### Autor

Über `QuestionnaireResponse.author` kann die für die Antwort verantwortliche Person angegeben werden. Gemäß Profil wird diese Information aus `Composition.author` abgeleitet.

## Zusammenspiel von Definition und Antwort

`AdditionalPropertiesQuestionnaire` und `AdditionalPropertiesQuestionnaireResponse` bilden gemeinsam das Modell zur Abbildung zusätzlicher Eigenschaften.

Das `Questionnaire` definiert die Struktur der Eigenschaften. Die `QuestionnaireResponse` referenziert diese Definition und enthält die konkret erfassten Werte.

Die Trennung ermöglicht es, eine Fragebogendefinition unabhängig von den darauf basierenden Antworten zu verwalten und für unterschiedliche fachliche Instanzen wiederzuverwenden.

Die detaillierten Festlegungen zu Kardinalitäten, Must-Support-Elementen, Security Labels und Terminologie-Bindings sind auf den jeweiligen Profilseiten beschrieben.