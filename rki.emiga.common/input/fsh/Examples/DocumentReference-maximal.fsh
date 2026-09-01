Instance: AttachmentDocumentReference-maximal
InstanceOf: AttachmentDocumentReference
Title: "Attachment Example (Maximal)"
Description: "A maximal example of an AttachmentDocumentReference according to the EMIGA profile."
Usage: #example
// META
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AttachmentDocumentReference"
* meta.security[responsibility].system = "https://emiga.rki.de/fhir/common/CodeSystem/ResourceResponsibility"
* meta.security[responsibility].code = #1.01.0.01.
* meta.security[visibility].system = "https://emiga.rki.de/fhir/common/CodeSystem/ResourceVisibilityType"
* meta.security[visibility].code = #inAgency
// REQUIRED + MS FIELDS
* status = #current
* date = "2025-11-19T10:00:00+01:00"
// Required author
* author[0].reference = "Practitioner/EmigaUser-001"
// Identifiers
* identifier[EmigaID].use = #official
* identifier[EmigaID].system = "https://emiga.rki.de/fhir/sid/EmigaID"
* identifier[EmigaID].value = "Anhang-DEFG-123456788"
* identifier[EmigaFileNumber].use = #official
* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
* identifier[EmigaFileNumber].value = "Anhang-ABCD-887654321"
* identifier[SurvNetFileNumber].use = #temp
* identifier[SurvNetFileNumber].system = "https://emiga.rki.de/fhir/sid/SurvNetFileNumber"
* identifier[SurvNetFileNumber].value = "Anhang-SURVNET-887654321"
// CONTENT — new flat structure (no slicing)
* content[0].attachment.contentType = #application/pdf
* content[0].attachment.url = "https://emiga.rki.de/documents/attached-file-2025-11-12"
* content[0].attachment.size = 24576
* content[0].attachment.hash = "T408Kxqef2xdSzopeBcm9eTTypGg+ejXxrWkk4JxYPA="
* content[0].attachment.title = "Attached Document — PDF"
* content[0].attachment.creation = "2025-11-12T14:00:00+01:00"