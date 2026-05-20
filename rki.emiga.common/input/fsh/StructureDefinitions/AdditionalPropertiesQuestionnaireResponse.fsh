Profile: OutbreakQuestionnaireResponseCommon
Parent: QuestionnaireResponse
Id: AdditionalPropertiesQuestionnaireResponse
Title: "Zusätzliche Eigenschaften Fragebogen-Antworten"
Description: "Dieses Profil bietet die Möglichkeit, zusätzliche Eigenschaften (Metadaten und fachliche Zusatzinformationen) zu Antworten auf den AdditionalPropertiesQuestionnaire Fragebogen strukturiert abzubilden. Es dient dazu, erweiterte Auswertungs-, Steuerungs- und Dokumentationsinformationen zu einer Fragebogen-Antwort zu modellieren, die über den Standardumfang der Ressource hinausgehen."

* ^version = "0.3.0"
* ^date = "2026-04-24"
* ^url = "https://emiga.rki.de/fhir/common/StructureDefinition/AdditionalPropertiesQuestionnaireResponse"

* insert MetadataProfile
* insert ProfileResourceCommon
//* insert ProfileDomainResourceCommon
* insert ProfileSecurityTagsAnnotation
* insert ProfileMetaProfileTags
//* insert IdentifierCommon
//* insert ProfileMetaTags
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AdditionalPropertiesQuestionnaireResponse"

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

