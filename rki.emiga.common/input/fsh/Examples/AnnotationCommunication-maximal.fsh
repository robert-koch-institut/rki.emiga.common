Instance: AnnotationCommunication-maximal
InstanceOf: AnnotationCommunication
Title: "Beispiel AnnotationCommunication - Maximal"
Description: "Ein maximales Beispiel für eine AnnotationCommunication-Ressource basierend auf dem Profil AnnotationCommunication."
Usage: #example

// Resource ID
* id = "AnnotationCommunication-maximal"

// Meta
* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/AnnotationCommunication|1.2.0-alpha.10"
* meta.tag[personalInformation].system = "https://emiga.rki.de/fhir/common/CodeSystem/PersonalInformation"
* meta.tag[personalInformation].code = #ContainsPersonalInformation
* meta.tag[personalInformation].display = "Beinhaltet personenbezogene Daten"

// Required identifiers (1..1)
* identifier[EmigaID].system = "https://emiga.rki.de/fhir/sid/EmigaID"
* identifier[EmigaID].value = "Annotation-002"
* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
* identifier[EmigaFileNumber].value = "File-002"

// Required status
* status = #completed

// Extensions
* extension[processingStatus].url = "https://emiga.rki.de/fhir/common/Extension/ProcessingStatus"
* extension[processingStatus].valueCoding.system = "https://emiga.rki.de/fhir/common/CodeSystem/ProcessingStatus"
* extension[processingStatus].valueCoding.code = #closed
* extension[processingStatus].valueCoding.display = "abgeschlossen"

* extension[dateCreated].url = "https://emiga.rki.de/fhir/common/Extension/DateCreated"
* extension[dateCreated].valueInstant = "2025-11-10T10:00:00Z"

// Topic (mandatory)
* topic.text = "Betreff: Datenüberprüfung abgeschlossen"

// About (multiple references allowed)
* about[+] = Reference(DocumentReference/DocumentReference-maximal)
* about[+] = Reference(Observation/Observation-Result-003)

// Sent (custom date)
* sent = "2025-11-10T10:00:00Z"

// Sender (mandatory)
* sender = Reference(EmigaUserPractitioner/Practitioner-Schmidt)

// Payloads
* payload[+].contentString = "Die Meldung wurde geprüft. Alle Angaben sind konsistent."
* payload[+].contentReference = Reference(AttachmentDocumentReference/Attachment-Laborbericht-123)

// Optional note for legacy annotation
* note.text = "Diese Annotation wurde automatisch aus dem Validierungsmodul erzeugt."
