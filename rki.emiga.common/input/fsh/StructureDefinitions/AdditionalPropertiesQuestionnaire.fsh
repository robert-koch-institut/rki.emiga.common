Profile:        AdditionalPropertiesQuestionnaire
Parent:         Questionnaire
Id:             AdditionalPropertiesQuestionnaire
Title:          "Zusätzliche Eigenschaften"
Description:    "Dieses Profil bietet die Möglichkeit, zusätzliche Eigenschaften (Metadaten und fachliche Zusatzinformationen) für Fragebögen strukturiert abzubilden. Es dient dazu, erweiterte Konfigurations- und Steuerungsinformationen zu einem Fragebogen zu modellieren, die über den Standardumfang der Ressource hinausgehen."

* ^version = "0.3.0"
* ^date = "2025-12-17"
* ^url = "https://emiga.rki.de/fhir/common/StructureDefinition/AdditionalPropertiesQuestionnaire"

* insert MetadataProfile
* insert ProfileSecurityTagsAnnotation
* insert ProfileResourceCommon
* insert ProfileDomainResourceCommon
* insert ProfileMetaProfileTags
* insert IdentifierCommon

* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AdditionalPropertiesQuestionnaire"

* item 0..* MS


