Profile: AttachmentDocumentReference
Parent: DocumentReference
Id: AttachmentDocumentReference
Title: "Anhang"
Description: "Mit den Anhang hat man die Möglichkeit, Dokumente, auch aus Anschreiben-Vorlagen, an Annotationen anzuhängen, um verschiedene Dateien strukturiert und nachvollziehbar an Entitäten oder für die Organisation zu hinterlegen."

* insert MetadataProfile
* insert ProfileSecurityTags
* insert ProfileResourceCommon
* insert ProfileDomainResourceCommon
* insert ProfileMetaProfileTags

* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AttachmentDocumentReference"

* status MS
* status = #current (exactly)
// Derzeit für Emiga Anwendungsfälle nicht relevant
* identifier 0..0
// Derzeit für Emiga Anwendungsfälle nicht relevant
* docStatus 0..0

// Derzeit für Emiga Anwendungsfälle nicht relevant
* type 0..0

// Derzeit für Emiga Anwendungsfälle nicht relevant
* category 0..0 

// Derzeit für Emiga Anwendungsfälle nicht relevant
* subject 0..0


* date 0..1 

* author 0..* MS
* author only Reference(EmigaUserPractitioner)
// Derzeit für Emiga Anwendungsfälle nicht relevant
* authenticator 0..0


* custodian 0..1 MS
* custodian only Reference(EmigaUserOrganization)


* content 1..* MS
* content.attachment 1..1 MS
* content.attachment.contentType 1..1 MS
//* content.attachment.language 0..1
* content.attachment.data MS
* content.attachment.url MS
//* content.attachment.size 0..1
//* content.attachment.hash 0..1
//* content.attachment.title 0..1
* content.attachment.creation 0..1 MS
//* content.format 0..1 MS
/*
* context 0..1
* context.encounter 0..*
* context.event 0..*
* context.period 0..1
* context.facilityType 0..1
* context.practiceSetting 0..1
* context.sourcePatientInfo 0..1
* context.related 0..*
* context.related.identifier 0..1
* context.related.reference 0..1
*/