Instance: 441557618
InstanceOf: AnnotationCommunication
Description: "Test Annotation Example including attachment"
Usage: #example

* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AnnotationCommunication|1.2.0-alpha.2"
* meta.security[responsibility].system = "https://emiga.rki.de/fhir/common/CodeSystem/ResourceResponsibility"
* meta.security[responsibility].code = #1.01.0.01.	
* meta.security[visibility].system = "https://emiga.rki.de/fhir/common/CodeSystem/ResourceVisibilityType"
* meta.security[visibility].code = #public

* meta.tag[personalInformation].system = "https://emiga.rki.de/fhir/common/CodeSystem/PersonalInformation"
* meta.tag[personalInformation].code = #HasPersonalInformation
* meta.tag[personalInformation].display = "Hat Personenbezug"

* extension[processingStatus].url = "https://emiga.rki.de/fhir/common/Extension/ProcessingStatus"
* extension[processingStatus].valueCoding.system = "https://emiga.rki.de/fhir/common/CodeSystem/ProcessingStatus"
* extension[processingStatus].valueCoding.code = #forinformation 
* extension[processingStatus].valueCoding.display = "zur Kenntnis"

* extension[dateCreated].url = "https://emiga.rki.de/fhir/common/Extension/DateCreated"
* extension[dateCreated].valueInstant = "2024-10-01T12:00:00Z"

* identifier[emigaAnnotationId].value = "ANNO-TestID-441557618"
* identifier[emigaAnnotationId].system = "https://emiga.rki.de/fhir/sid/EmigaAnnotationId"
* identifier[survnetAnnotationId].value = "SURVNET-TestID-441557618"
* identifier[survnetAnnotationId].system = "https://emiga.rki.de/fhir/sid/SurvNetAnnotationId"

* status = #completed
* category.coding[0].system = "https://emiga.rki.de/fhir/common/CodeSystem/Keywords"
* category.coding[0].code = #comment
* category.coding[0].display = "Kommentar"
* category.text = "Kommentar"
//* subject = Reference(Patient/example)
* topic.text = "Test Betreff"

* about[0].reference = "Composition/example"

* sent = "2024-10-01T12:00:00Z"

* sender = Reference(Practitioner/example)

* payload[0].contentString = "Das ist ein Test Beschreibung"

//* payload[0].contentReference.reference = "DocumentReference/441557619"

//* payload[1].contentAttachment.contentType = #img/png
//* payload[1].contentAttachment.url = "https://example.com/image.png"
//* payload[1].contentAttachment.title = "Test Bild"

* payload[1].contentReference = Reference(DocumentReference/441557619)