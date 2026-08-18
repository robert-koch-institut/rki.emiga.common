Profile: AdditionalPropertiesQuestionnaire
Parent: Questionnaire
Id: AdditionalPropertiesQuestionnaire
Title: "Zusätzliche Eigenschaften"
Description: "Dieses Profil bietet die Möglichkeit, zusätzliche Eigenschaften (Metadaten und fachliche Zusatzinformationen) für Fragebögen strukturiert abzubilden. Es dient dazu, erweiterte Konfigurations- und Steuerungsinformationen zu einem Fragebogen zu modellieren, die über den Standardumfang der Ressource hinausgehen."

* ^url = "https://emiga.rki.de/fhir/common/StructureDefinition/AdditionalPropertiesQuestionnaire"
* ^version = "0.4.0"
* ^date = "2026-08-18"

* insert MetadataProfile
* insert ProfileSecurityTagsAnnotation
* insert ProfileResourceCommon
* insert ProfileDomainResourceCommon
* insert ProfileMetaProfileTags
* insert IdentifierCommon

* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AdditionalPropertiesQuestionnaire"

* item 0..* MS