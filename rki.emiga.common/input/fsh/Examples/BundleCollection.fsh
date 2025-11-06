/*
Alias: $ResourceResponsibility = https://emiga.rki.de/fhir/common/CodeSystem/ResourceResponsibility
Alias: $ResourceVisibilityType = https://emiga.rki.de/fhir/common/CodeSystem/ResourceVisibilityType
Alias: $PersonalInformation = https://emiga.rki.de/fhir/common/CodeSystem/PersonalInformation
Alias: $ProcessingStatus = https://emiga.rki.de/fhir/common/CodeSystem/ProcessingStatus
Alias: $KeywordsLocal = https://emiga.rki.de/fhir/common/CodeSystem/KeywordsLocal
Alias: $KeywordsGlobal = https://emiga.rki.de/fhir/common/CodeSystem/KeywordsGlobal
*/

Instance: CollectionBundle2
InstanceOf: Bundle
Usage: #example
* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/AnnotationBundle"
* identifier.system = "https://emiga.rki.de/fhir/common/sid/AnnotationBundleId"
* identifier.value = "d317ce08-1da0-48d4-8dd7-8edbe88d51f3"
* type = #collection
* timestamp = "2025-07-03T09:28:36.132+01:00"
* entry[0].fullUrl = "https://emiga.rki.de/fhir/common/Communication/3"
* entry[=].resource = Annotation-3
* entry[+].fullUrl = "https://emiga.rki.de/fhir/common/StructureDefinition/EmigaUserPractitioner/5d4b8483-0a7d-471e-b1df-26addf06ff1d"
* entry[=].resource = 5d4b8483-0a7d-471e-b1df-26addf06ff1d

Instance: Annotation-3
InstanceOf: AnnotationCommunication
Usage: #inline
* id = "3"
* meta.versionId = "4"
* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/AnnotationCommunication|1.2.0-alpha.10"
* meta.security[0] = $ResourceResponsibility#1.
* meta.security[+] = $ResourceVisibilityType#inAgency "Eigene ÖGD-Stelle"

* meta.tag[personalInformation].system = "https://emiga.rki.de/fhir/common/CodeSystem/PersonalInformation"
* meta.tag[personalInformation].code = #ContainsPersonalInformation
* meta.tag[personalInformation].display = "Enthält Personenbezogene Daten"


* extension[processingStatus].url = "https://emiga.rki.de/fhir/common/Extension/ProcessingStatus"
* extension[processingStatus].valueCoding.system = "https://emiga.rki.de/fhir/common/CodeSystem/ProcessingStatus"
* extension[processingStatus].valueCoding.code = #forinformation 
* extension[processingStatus].valueCoding.display = "zur Kenntnis"

* extension[dateCreated].url = "https://emiga.rki.de/fhir/common/Extension/DateCreated"
* extension[dateCreated].valueInstant = "2024-10-01T12:00:00Z"

* identifier[EmigaID].system = "https://emiga.rki.de/fhir/sid/EmigaID"
* identifier[EmigaID].value = "DEFG-123456789"
* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
* identifier[EmigaFileNumber].value = "ABCD-987654321"
* identifier[SurvNetFileNumber].system = "https://emiga.rki.de/fhir/sid/SurvNetFileNumber"
* identifier[SurvNetFileNumber].value = "SURVNET-123456789"



//* identifier[0].system = "https://emiga.rki.de/fhir/sid/EmigaAnnotationId"
//* identifier[=].value = "ANNO-1.-2025-00000002"
//* identifier[+].system = "https://emiga.rki.de/fhir/sid/SurvNetAnnotationId"
//* identifier[=].value = "SURVNET-TestID-441557618"
* status = #completed
* category[0] = $KeywordsLocal#comment "Kommentar"
* category[+] = $KeywordsGlobal#message "Nachricht"
* topic.text = "Test Betreff"
* about = Reference(Composition/d317ce08-1da0-48d4-8dd7-8edbe88d51f1)
* sent = "2025-07-03T09:28:36+01:00"
* sender = Reference(5d4b8483-0a7d-471e-b1df-26addf06ff1d)
* payload.contentString = "Das ist ein Test Beschreibung"

Instance: 5d4b8483-0a7d-471e-b1df-26addf06ff1d
InstanceOf: Practitioner
Usage: #inline
* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/EmigaUserPractitioner|1.2.0-alpha.10"
* meta.security[0] = $ResourceVisibilityType#internal
* meta.security[+] = $ResourceResponsibility#1.
* identifier.value = "testuser@emiga.rki.de"
* active = true
//* name.family = "Muster"
//* name.given = "Max"