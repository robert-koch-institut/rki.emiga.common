# {{page-title}}

Dieser Abschnitt beschreibt die Anwendungsfälle zur Abbildung **Zusätzlicher Eigenschaften** in EMIGA. 
**Zusätzliche Eigenschaften** ermöglichen darüber hinaus die strukturierte Abbildung fachlicher Zusatzinformationen, die nicht unmittelbar durch die übrigen Profile des Moduls abgedeckt werden, zu erfassen und verwalten.
Zusätzliche Eigenschaften ist einer eigenständigen Entitätstyp und dienen der strukturierten Erfassung fachlicher Zusatzinformationen. Sie ermöglichen es, ergänzende Attribute bzw. Metadaten und deren Inhalte abzubilden, die nicht über die regulär vorgesehenen Elemente der jeweiligen FHIR-Ressourcen definiert sind. Aufgrund der vielfältige Verwendungsmöglichkeiten in unterschiedlichen fachlichen Kontexten werden zusätzliche Eigenschaften im Folgenden gesondert betrachtet.

{{render:guides/implementationguides.common/PlantUML/PNGs/AdditionalPropertiesClasses.png}}

Die Definition einer `Zusätzlicher Eigenschaften` erfolgt über eine Questionnaire-Ressourceninstanz gemäß dem Profil `AdditionalPropertiesQuestionnaire`. Die einzelnen Eigenschaften (Attribute) werden dabei über Questionnaire.item strukturiert festgelegt.
Die erfassten Werte werden in einer `QuestionnaireResponse`-Ressourceninstanz abgebildet.  Diese referenziert über `QuestionnaireResponse.questionnaire` verpflichtend das zugehörige Questionnaire.

Die folgende Abbildung zeigt den Zusammenhang zwischen der Definition einer zusätzlichen Eigenschaft und dem zugehörigen Wert auf Item-Ebene.

{{render:guides/implementationguides.common/PlantUML/PNGs/AdditionalPropertiesOverview.png}}

Ein `AdditionalPropertiesQuestionnaire` kann über EMIGA-spezifische Identifier identifiziert werden. Das Profil unterstützt insbesondere `EmigaID`, `EmigaFileNumber` und `SurvNetFileNumber`.