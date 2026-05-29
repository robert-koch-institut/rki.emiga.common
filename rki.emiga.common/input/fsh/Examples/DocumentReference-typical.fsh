Instance: AttachmentDocumentReference-typical
InstanceOf: AttachmentDocumentReference
Title: "Attachment Example (Typical)"
Description: "A typical example of an AttachmentDocumentReference."
Usage: #example
// Meta
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AttachmentDocumentReference"
* meta.security[responsibility].system = "https://emiga.rki.de/fhir/common/CodeSystem/ResourceResponsibility"
* meta.security[responsibility].code = #1.01.0.01.
* meta.security[visibility].system = "https://emiga.rki.de/fhir/common/CodeSystem/ResourceVisibilityType"
* meta.security[visibility].code = #inAgency
// Required status
* status = #current
// Date (MS, 0..1)
* date = "2025-11-13T10:00:00+01:00"
// Author (MS, 0..1)
* author[0].reference = "Practitioner/EmigaUser-001"
// Required identifiers
* identifier[EmigaID].system = "https://emiga.rki.de/fhir/sid/EmigaID"
* identifier[EmigaID].value = "Anhang-DEFG-123456788"
* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
* identifier[EmigaFileNumber].value = "Anhang-ABCD-887654321"
// Content
* content[0].attachment.contentType = #application/pdf
* content[0].attachment.url = "https://emiga.rki.de/documents/typical-doc-2025"
* content[0].attachment.size = 24576
* content[0].attachment.hash = "T408Kxqef2xdSzopeBcm9eTTypGg+ejXxrWkk4JxYPA="
* content[0].attachment.title = "Typical Document — PDF"
* content[0].attachment.creation = "2025-11-13T10:00:00+01:00"