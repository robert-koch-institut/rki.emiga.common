# {{page-title}}
Dieser Abschnitt beschreibt die Anwendungsfälle zur Abbildung **Zusätzlicher Eigenschaften** in EMIGA. Zusätzliche Eigenschaften ist einer eigenständigen Entitätstyp und dienen der strukturierten Erfassung fachlicher Zusatzinformationen. Sie ermöglichen es, ergänzende Attribute bzw. Metadaten und deren Inhalte abzubilden, die nicht über die regulär vorgesehenen Elemente der jeweiligen FHIR-Ressourcen definiert sind. Aufgrund der vielfältige Verwendungsmöglichkeiten in unterschiedlichen fachlichen Kontexten werden zusätzliche Eigenschaften im Folgenden gesondert betrachtet.

Die folgende Abbildung zeigt die beteiligten Profile und ihre wesentliche Beziehung zueinander.
{{render:guides/implementationguides.tests/PlantUML/PNGs/AdditionalPropertiesClasses.png}}

## Überblick
Die Definition `Zusätzlicher Eigenschaften` erfolgt über eine Questionnaire-Ressourceninstanz gemäß dem Profil `AdditionalPropertiesQuestionnaire`. Die einzelnen Eigenschaften werden dabei über Questionnaire.item strukturiert beschrieben.

Die erfassten Werte werden in einer `QuestionnaireResponse`-Ressourceninstanz gemäß dem Profil `AdditionalPropertiesQuestionnaireResponse` abgebildet.  Diese referenziert über `QuestionnaireResponse.questionnaire` verpflichtend das zugehörige Questionnaire.

Die folgende Abbildung zeigt den Zusammenhang zwischen der Definition einer zusätzlichen Eigenschaft und dem zugehörigen Wert auf Item-Ebene.

{{render:guides/implementationguides.tests/PlantUML/PNGs/AdditionalPropertiesOverview.png}}

### Identifikation der Zusätzliche Eigenschaft

Ein `AdditionalPropertiesQuestionnaire` kann über EMIGA-spezifische Identifier identifiziert werden. Das Profil unterstützt insbesondere:

- `EmigaID`
- `EmigaFileNumber`
- `SurvNetFileNumber`

Für `EmigaID` und `EmigaFileNumber` ist `Identifier.use = official` festgelegt. Für die `SurvNetFileNumber` wird `Identifier.use = temp` verwendet.

### Autor
Über `QuestionnaireResponse.author` kann die für die Antwort verantwortliche Person angegeben werden. Gemäß Profil wird diese Information aus `Composition.author` abgeleitet.