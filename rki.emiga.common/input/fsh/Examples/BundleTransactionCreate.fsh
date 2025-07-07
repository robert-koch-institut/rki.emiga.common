/*
Alias: $ResourceResponsibility = https://emiga.rki.de/fhir/common/CodeSystem/ResourceResponsibility
Alias: $ResourceVisibilityType = https://emiga.rki.de/fhir/common/CodeSystem/ResourceVisibilityType
Alias: $PersonalInformation = https://emiga.rki.de/fhir/common/CodeSystem/PersonalInformation
Alias: $ProcessingStatus = https://emiga.rki.de/fhir/common/CodeSystem/ProcessingStatus
Alias: $KeywordsLocal = https://emiga.rki.de/fhir/common/CodeSystem/KeywordsLocal
Alias: $KeywordsGlobal = https://emiga.rki.de/fhir/common/CodeSystem/KeywordsGlobal
*/

Instance: TransactionBundle
InstanceOf: Bundle
Usage: #example
* meta.profile = "https://emiga.rki.de/fhir/annotation/StructureDefinition/AnnotationBundle"
* identifier.system = "https://emiga.rki.de/fhir/common/sid/AnnotationBundleId"
* identifier.value = "d317ce08-1da0-48d4-8dd7-8edbe88d51f4"
* type = #transaction
* timestamp = "2025-07-03T09:28:36.132+01:00"

* entry[0].fullUrl = "https://emiga.rki.de/fhir/common/Communication/2"
* entry[0].resource = Annotation-2
* entry[0].request.method = #POST
* entry[0].request.url = "Communication"

* entry[1].fullUrl = "https://emiga.rki.de/fhir/common/StructureDefinition/EmigaUserPractitioner/5d4b8483-0a7d-471e-b1df-26addf06ff1c"
* entry[1].resource = 5d4b8483-0a7d-471e-b1df-26addf06ff1c
* entry[1].request.method = #POST
* entry[1].request.url = "Practitioner"

Instance: Annotation-2
InstanceOf: Communication
Usage: #example
* id = "2"
* meta.versionId = "5"
* meta.profile = "https://emiga.rki.de/fhir/outbreak/StructureDefinition/AnnotationCommunication|1.2.0-alpha.4"
* meta.security[0] = $ResourceResponsibility#1.
* meta.security[+] = $ResourceVisibilityType#public
* meta.tag = $PersonalInformationCS#ContainsPersonalInformation "Enthält Personenbezogene Daten"
* extension[0].url = "https://emiga.rki.de/fhir/common/Extension/ProcessingStatus"
* extension[=].valueCodeableConcept = $ProcessingStatusCS#inprogress "in Bearbeitung"
* extension[+].url = "https://emiga.rki.de/fhir/common/Extension/DateCreated"
* extension[=].valueInstant = "2023-10-01T13:00:00.000+01:00"
* identifier[0].system = "https://emiga.rki.de/fhir/sid/EmigaAnnotationId"
* identifier[=].value = "ANNO-1.-2025-00000002"
* identifier[+].system = "https://emiga.rki.de/fhir/sid/SurvNetAnnotationId"
* identifier[=].value = "SURVNET-TestID-441557618"
* status = #completed
* category[0] = $KeywordsLocal#comment "Kommentar"
* category[+] = $KeywordsGlobal#message "Nachricht"
* topic.text = "Test Betreff"
* about = Reference(Composition/d317ce08-1da0-48d4-8dd7-8edbe88d51f1)
* sent = "2025-07-03T09:28:36+01:00"
* sender = Reference(5d4b8483-0a7d-471e-b1df-26addf06ff1c)
* payload.contentString = "Das ist ein Test Beschreibung"

Instance: 5d4b8483-0a7d-471e-b1df-26addf06ff1c
InstanceOf: Practitioner
Usage: #example
* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/EmigaUserPractitioner|1.2.0-alpha.4"
* meta.security[0] = $ResourceVisibilityType#internal
* meta.security[+] = $ResourceResponsibility#1.
* identifier.value = "testuser@emiga.rki.de"
* active = true
//* name.family = "Muster"
//* name.given = "Max"