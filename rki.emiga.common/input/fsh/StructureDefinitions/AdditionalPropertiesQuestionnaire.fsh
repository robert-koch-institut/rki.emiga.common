Profile:        AdditionalPropertiesQuestionnaire
Parent:         Questionnaire
Id:             AdditionalPropertiesQuestionnaire
Title:          "Zusätzliche Eigenschaften"
Description:    "Dieses Profil ermöglicht die strukturierte Abbildung zusätzlicher fachlicher Informationen über Fragebögen, die über den Standardumfang der jeweiligen FHIR-Ressource hinausgehen."

* ^version = "0.4.0"
* ^date = "2026-04-24"
* ^url = "https://emiga.rki.de/fhir/common/StructureDefinition/AdditionalPropertiesQuestionnaire"

* insert MetadataProfile
* insert ProfileSecurityTagsAnnotation
* insert ProfileResourceCommon
* insert ProfileDomainResourceCommon
* insert ProfileMetaProfileTags
* insert IdentifierCommon

* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AdditionalPropertiesQuestionnaire"

* item 0..* MS


