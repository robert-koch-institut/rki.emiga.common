Instance: AttachmentDocumentReference-maximal
InstanceOf: AttachmentDocumentReference
Title: "Attachment Example (Maximal)"
Description: "A maximal example of an AttachmentDocumentReference according to the EMIGA profile."
Usage: #example

// META
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AttachmentDocumentReference|1.2.0-alpha.12"

* meta.tag[personalInformation].system = "https://emiga.rki.de/fhir/common/CodeSystem/PersonalInformation"
* meta.tag[personalInformation].code = #containsPersonalData
* meta.tag[personalInformation].display = "Contains personal data"
* meta.tag[personalInformation].version = "1.0.0"

// ------------------------
// REQUIRED + MS FIELDS
// ------------------------
* status = #current
* date = "2025-11-19T10:00:00+01:00"

// Required author
* author[0].reference = "Practitioner/example"

// Required identifier: EmigaID
* identifier[EmigaID].use = #official
* identifier[EmigaID].system = "https://emiga.rki.de/fhir/sid/EmigaID"
* identifier[EmigaID].value = "Anhang-DEFG-123456788"

// Required identifier: EmigaFileNumber
* identifier[EmigaFileNumber].use = #official
* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
* identifier[EmigaFileNumber].value = "Anhang-ABCD-887654321"

// Optional but allowed identifier: SurvNetFileNumber
* identifier[SurvNetFileNumber].use = #temp
* identifier[SurvNetFileNumber].system = "https://emiga.rki.de/fhir/sid/SurvNetFileNumber"
* identifier[SurvNetFileNumber].value = "Anhang-SURVNET-887654321"

// CONTENT — ATTACHMENT SLICE
* content[attachment].attachment.contentType = #application/pdf
* content[attachment].attachment.data = "JVBERi0xLjMKJcTl8uXrp/Og0MTGCjEgMCBvYmoKPDwvVHlwZS9DYXRhbG9nPj4KZW5kb2JqCg==" 
* content[attachment].attachment.size = 24576
* content[attachment].attachment.hash = "0tLS88Swpcnoud+I84rLjydf4prTiwfCpuNxubl9KOyw"
* content[attachment].attachment.title = "Attached Document — PDF"
* content[attachment].attachment.creation = "2025-11-12T14:00:00+01:00"

// CONTENT — REFERENCE SLICE
* content[reference].attachment.url = "https://emiga.rki.de/documents/attached-file-2025-11-12"
* content[reference].attachment.contentType = #application/pdf
* content[reference].attachment.size = 24576
* content[reference].attachment.hash = "T408Kxqef2xdSzopeBcm9eTTypGg+ejXxrWkk4JxYPA="
* content[reference].attachment.title = "Referenced Document — PDF"
* content[reference].attachment.creation = "2025-11-12T14:00:00+01:00"
