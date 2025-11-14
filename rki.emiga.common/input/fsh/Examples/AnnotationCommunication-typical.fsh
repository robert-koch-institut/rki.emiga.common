Instance: AnnotationCommunication-typical
InstanceOf: AnnotationCommunication
Title: "Beispiel AnnotationCommunication - typical"
Description: "Ein typisches Beispiel für eine AnnotationCommunication-Ressource basierend auf dem Profil AnnotationCommunication."
Usage: #example

* id = "AnnotationCommunication-typical"

// Meta
* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/AnnotationCommunication"
* meta.tag[personalInformation].system = "https://emiga.rki.de/fhir/common/CodeSystem/PersonalInformation"
* meta.tag[personalInformation].code = #ContainsPersonalInformation

// Required identifiers (1..1)
* identifier[EmigaID].system = "https://emiga.rki.de/fhir/sid/EmigaID"
* identifier[EmigaID].value = "Annotation-002"
* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
* identifier[EmigaFileNumber].value = "File-002"

// Status and topic
* status = #completed
* topic.text = "Meldung zur Datenkorrektur" 

// Extensions
* extension[processingStatus].url = "https://emiga.rki.de/fhir/common/Extension/ProcessingStatus"
* extension[processingStatus].valueCoding.system = "https://emiga.rki.de/fhir/common/CodeSystem/ProcessingStatus"
* extension[processingStatus].valueCoding.code = #closed
* extension[processingStatus].valueCoding.display = "abgeschlossen"

* extension[dateCreated].url = "https://emiga.rki.de/fhir/common/Extension/DateCreated"
* extension[dateCreated].valueInstant = "2025-11-10T10:00:00Z"

// About - referenced Document
* about = Reference(DocumentReference/DocumentReference-typical)

// Communication metadata
* sent = "2025-11-10T10:00:00Z"
* sender = Reference(EmigaUserPractitioner/Practitioner-Mueller)

// Payload
* payload.contentString = "Die Zahlungsdaten wurden überprüft und bestätigt."

// Note
* note.text = "Hinweis: Datenvalidierung erfolgreich durchgeführt."
