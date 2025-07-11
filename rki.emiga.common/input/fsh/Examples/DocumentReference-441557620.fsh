Instance: 441557620
InstanceOf: AttachmentDocumentReference
Usage: #example
Description: "Test Attachment DocumentReference Example with image reference"
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AttachmentDocumentReference|1.2.0-alpha.7"
* meta.security[responsibility].system = "https://emiga.rki.de/fhir/common/CodeSystem/ResourceResponsibility"
* meta.security[responsibility].code = #1.01.0.01.	
* meta.security[visibility].system = "https://emiga.rki.de/fhir/common/CodeSystem/ResourceVisibilityType"
* meta.security[visibility].code = #public

//* meta.security[responsibility].system = "https://emiga.rki.de/fhir/common/CodeSystem/ResourceResponsibility"
//* meta.security[responsibility].code = #
* status = #current
* identifier[emigaAttachmentId].system = "https://emiga.rki.de/fhir/sid/EmigaAttachmentId"
* identifier[emigaAttachmentId].value = "ATTACH-TestID-441557620"
* author[0].reference = "Practitioner/example"
* date = "2023-10-01T12:00:00Z"
* content[reference].attachment.contentType = #image/png
* content[reference].attachment.url = "http://example.org/images/sample-image.png"
* content[reference].attachment.title = "Sample Image"
