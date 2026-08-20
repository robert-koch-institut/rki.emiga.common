# {{page-title}}
Dieser Abschnitt beschreibt die Anwendungsfälle zur Abbildung **zusätzlicher Eigenschaften** in EMIGA. Zusätzliche Eigenschaften bilden einen eigenständigen Entitätstyp und dienen der strukturierten Erfassung fachlicher Zusatzinformationen. Sie ermöglichen es, ergänzende Attribute bzw. Metadaten und deren Inhalte abzubilden, die nicht über die regulär vorgesehenen Elemente der jeweiligen FHIR-Ressourcen erfasst werden. Aufgrund der möglichen Verwendung in unterschiedlichen fachlichen Kontexten werden zusätzliche Eigenschaften im Folgenden gesondert betrachtet.

Die folgende Abbildung zeigt die beteiligten Profile und ihre wesentliche Beziehung zueinander.
{{render:guides/implementationguides.common/PlantUML/PNGs/AdditionalPropertiesClasses.png}}

## Überblick
Die Definition `Zusätzlicher Eigenschaften` erfolgt über eine Questionnaire-Ressourceninstanz gemäß dem Profil `AdditionalPropertiesQuestionnaire`. Die einzelnen Eigenschaften werden dabei über Questionnaire.item strukturiert beschrieben.

Die erfassten Werte werden in einer `QuestionnaireResponse`-Ressourceninstanz gemäß dem Profil `AdditionalPropertiesQuestionnaireResponse` abgebildet. Über `QuestionnaireResponse.questionnaire` wird das zugrunde liegende `AdditionalPropertiesQuestionnaire` referenziert.
Die einzelnen Eigenschaften werden über `Questionnaire.item` abgebildet.
>Bemerkung: Ein Item kann seinerseits wiederum eine eigenständige `Zusätzliche Eigenschaft` repräsentieren.

Die folgende Abbildung zeigt den Zusammenhang zwischen der Definition einer zusätzlichen Eigenschaft und dem zugehörigen Wert auf Item-Ebene.

{{render:guides/implementationguides.common/PlantUML/PNGs/AdditionalPropertiesOverview.png}}

### Identifikation

Ein `AdditionalPropertiesQuestionnaire` kann über EMIGA-spezifische Identifier identifiziert werden. Das Profil unterstützt insbesondere:

- `EmigaID`
- `EmigaFileNumber`
- `SurvNetFileNumber`

Für `EmigaID` und `EmigaFileNumber` ist `Identifier.use = official` festgelegt. Für die `SurvNetFileNumber` wird `Identifier.use = temp` verwendet.

### Sichtbarkeit und Verantwortlichkeit

Über `Questionnaire.meta.security` werden die Sichtbarkeit und Verantwortlichkeit der Ressource gestreurt.

Das Profil sieht hierfür mindestens zwei Security Labels vor:

- `visibility` für die Sichtbarkeit der Ressource
- `responsibility` für die verantwortliche ÖGD-Stelle

Die Sichtbarkeit wird über das CodeSystem `ResourceVisibilityType` kodiert und ist an das ValueSet `AnnotationResourceVisibilityType` gebunden. Die Verantwortlichkeit wird über das CodeSystem `ResourceResponsibility` angegeben.

## Werte zusätzlicher Eigenschaften erfassen

Das Profil `AdditionalPropertiesQuestionnaireResponse` basiert auf der FHIR-Ressource `QuestionnaireResponse` und dient der strukturierten Abbildung der zu einem `AdditionalPropertiesQuestionnaire` erfassten Werte.

Jede `AdditionalPropertiesQuestionnaireResponse` referenziert über `QuestionnaireResponse.questionnaire` den zugrunde liegenden Fragebogen. Die Referenz ist obligatorisch.

Die konkreten Werte werden über `QuestionnaireResponse.item` und die darin enthaltenen Antworten abgebildet. Mindestens ein `QuestionnaireResponse.item` ist erforderlich.

Auf Item-Ebene ergibt sich damit folgende Zuordnung:

- `Questionnaire.item` definiert die zusätzliche Eigenschaft.
- `QuestionnaireResponse.item` ordnet den erfassten Wert der entsprechenden Eigenschaft zu.
- `QuestionnaireResponse.item.answer` enthält den konkreten Wert.

Die Zuordnung der korrespondierenden Items erfolgt gemäß dem FHIR-Modell über `linkId`.
Die detaillierten Festlegungen zu Kardinalitäten, Must-Support-Elementen, Security Labels und Terminologie-Bindings sind auf den jeweiligen Profilseiten beschrieben.

### Sichtbarkeit und Verantwortlichkeit
Auch die `AdditionalPropertiesQuestionnaireResponse` enthält über `meta.security` Angaben zu Sichtbarkeit und Verantwortlichkeit.

Wie beim zugehörigen `AdditionalPropertiesQuestionnaire` werden mindestens die Security Labels `visibility` und `responsibility` geführt.

Fragebogendefinition und Antwort können damit jeweils hinsichtlich ihrer Sichtbarkeit und organisatorischen Verantwortlichkeit eingeordnet werden.

### Autor
Über `QuestionnaireResponse.author` kann die für die Antwort verantwortliche Person angegeben werden. Gemäß Profil wird diese Information aus `Composition.author` abgeleitet.