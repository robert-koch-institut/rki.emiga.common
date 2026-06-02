Profile:        AdditionalPropertiesQuestionnaireR6
Parent:         Questionnaire
Id:             AdditionalPropertiesQuestionnaireR6
Title:          "Zusätzliche Eigenschaften"
Description:    "Dieses Profil bietet die Möglichkeit, zusätzliche Eigenschaften (Metadaten und fachliche Zusatzinformationen) für Fragebögen strukturiert abzubilden. Es dient dazu, erweiterte Konfigurations- und Steuerungsinformationen zu einem Fragebogen zu modellieren, die über den Standardumfang der Ressource hinausgehen."

* ^version = "0.4.0"
* ^date = "2026-04-24"
* ^url = "https://emiga.rki.de/fhir/common/StructureDefinition/AdditionalPropertiesQuestionnaireR6"

* insert MetadataProfile
* insert ProfileSecurityTagsAnnotation
* insert ProfileResourceCommon
* insert ProfileDomainResourceCommon
* insert ProfileMetaProfileTags
* insert IdentifierCommon

* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AdditionalPropertiesQuestionnaireR6"

* item 0..* MS


