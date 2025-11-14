Instance: AnnotationCommunication-minimal
InstanceOf: AnnotationCommunication
Title: "Beispiel AnnotationCommunication - Minimal"
Description: "Ein minimales Beispiel für eine AnnotationCommunication-Ressource basierend auf dem Profil AnnotationCommunication."

* id = "AnnotationCommunication-minimal"

// Meta
* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/AnnotationCommunication"

// MustSupport meta.tag slice 
* meta.tag[personalInformation].system = "https://emiga.rki.de/fhir/common/CodeSystem/PersonalInformation"
* meta.tag[personalInformation].code = #ContainsPersonalInformation

// Required identifiers (1..1 or MS)
* status = #completed

// Regarding the Communication 
* topic.text = "Meldung zur Datenkorrektur"

// Referenz auf die Person, die die Annotation erstellt hat.
* sender = Reference(EmigaUserPractitioner/Practitioner-Mueller) 

// Datum der Erstellung oder des Versands der Annotation
* sent = "2025-11-10T10:00:00Z"       

// Die Annotation bezieht sich auf das im Beispiel 'DocumentReference-minimal' definierte Dokument.
* about = Reference(DocumentReference/DocumentReference-minimal) 

// Der Inhalt der Annotation als Text
* payload.contentString = "Die Zahlungsdaten wurden überprüft und bestätigt." 

// Required identifiers (1..1)
* identifier[EmigaID].system = "https://emiga.rki.de/fhir/sid/EmigaID"
* identifier[EmigaID].value = "Annotation-001"
* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
* identifier[EmigaFileNumber].value = "File-001"

// Required ProcessingStatus extension
* extension[processingStatus].url = "https://emiga.rki.de/fhir/common/Extension/ProcessingStatus"
* extension[processingStatus].valueCoding.system = "https://emiga.rki.de/fhir/common/CodeSystem/ProcessingStatus"
* extension[processingStatus].valueCoding.code = #closed
* extension[processingStatus].valueCoding.display = "abgeschlossen"

// Required DateCreated extension
* extension[dateCreated].url = "https://emiga.rki.de/fhir/common/Extension/DateCreated"
* extension[dateCreated].valueInstant = "2025-11-10T10:00:00Z"




