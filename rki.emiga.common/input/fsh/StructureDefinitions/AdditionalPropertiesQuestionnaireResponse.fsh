Profile: OutbreakQuestionnaireResponseCommon
Parent: QuestionnaireResponse
Id: AdditionalPropertiesQuestionnaireResponse
Title: "Zusätzliche Eigenschaften Fragebogen-Antworten"
Description: "TODO"

* ^version = "0.1.0"
* ^date = "2025-07-21"
* ^url = "https://emiga.rki.de/fhir/common/StructureDefinition/AdditionalPropertiesQuestionnaireResponse"

* insert MetadataProfile
* insert ProfileResourceCommon
//* insert ProfileDomainResourceCommon
* insert ProfileSecurityTags
* insert ProfileMetaProfileTags
//* insert ProfileMetaTags
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AdditionalPropertiesQuestionnaireResponse|1.2.0-alpha.7"

* questionnaire 1..1 MS
//* questionnaire = "https://emiga.rki.de/fhir/common/StructureDefinition/AdditionalPropertiesQuestionnaire"
//* questionnaire ^short = "Reference to the related Questionnaire"


// Ein Ausbruch kann mehrere Personen betreffen, daher wird die Referenz auf den Personen von Verlinkten Fall abgeleitet.
* subject 
//* subject ^comment = "Ein Ausbruch kann mehrere Personen betreffen, daher wird die Referenz auf den Personen von Verlinkten Fall abgeleitet."

//Wird derzeit nicht benötigt
* encounter 0..0
// Brauchen wir das? Oder von Composition ableiten?
* authored
//* authored ^comment = "Brauchen wir das? Oder von Composition ableiten?"

// Allow author (who provided the answers) but make it optional
* author 
//* author only Reference(Patient or Practitioner or RelatedPerson)
//* author ^short = "Who provided the answers (can be patient, practitioner, or related person)"
* author ^comment = "Wird von author in Composition abgeleitet"

// Wird derzeit nicht benötigt
* source 0..0


* item 1..* MS
* item ^short = "The questions and their answers"

