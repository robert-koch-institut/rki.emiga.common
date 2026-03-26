Instance: AttachmentDocumentReference-minimal
InstanceOf: AttachmentDocumentReference
Title: "Attachment Example (Minimal)"
Description: "A minimal example of an AttachmentDocumentReference."
Usage: #example
// Meta
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AttachmentDocumentReference"
* meta.security[responsibility].system = "https://emiga.rki.de/fhir/common/CodeSystem/ResourceResponsibility"
* meta.security[responsibility].code = #1.01.0.01.
* meta.security[visibility].system = "https://emiga.rki.de/fhir/common/CodeSystem/ResourceVisibilityType"
* meta.security[visibility].code = #inPublicHealthService
// Required status
* status = #current
// Required identifiers
* identifier[EmigaID].system = "https://emiga.rki.de/fhir/sid/EmigaID"
* identifier[EmigaID].value = "Anhang-DEFG-123456789"
* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
* identifier[EmigaFileNumber].value = "Anhang-ABCD-987654321"
// Required content
* content[0].attachment.contentType = #application/pdf
* content[0].attachment.size = 1024
* content[0].attachment.hash = "T408Kxqef2xdSzopeBcm9eTTypGg+ejXxrWkk4JxYPA="
* content[0].attachment.title = "Minimal Document"
* content[0].attachment.creation = "2025-11-12T14:00:00+01:00"