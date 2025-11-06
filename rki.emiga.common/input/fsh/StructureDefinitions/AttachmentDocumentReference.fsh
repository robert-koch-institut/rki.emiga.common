Profile: AttachmentDocumentReference
Parent: DocumentReference
Id: AttachmentDocumentReference
Title: "Anhang-Entität"
Description: "Mit den Anhang hat man die Möglichkeit, Dokumente, auch aus Anschreiben-Vorlagen, an Annotationen anzuhängen, um verschiedene Dateien strukturiert und nachvollziehbar an Entitäten oder für die Organisation zu hinterlegen."
* ^version = "0.2.0"
* ^date = "2025-09-05"

* ^url = "https://emiga.rki.de/fhir/common/StructureDefinition/AttachmentDocumentReference"
* insert MetadataProfile
* insert ProfileSecurityTagsAnnotation
* insert ProfileResourceCommon
* insert ProfileDomainResourceCommon
* insert ProfileMetaProfileTags


* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AttachmentDocumentReference|1.2.0-alpha.10"
* meta.tag MS
* meta.tag ^slicing.discriminator.type = #pattern
* meta.tag ^slicing.discriminator.path = "system"
* meta.tag ^slicing.rules = #open
* meta.tag contains 
    personalInformation 1.. MS
//* meta.tag[personalInformation] ^mustSupport = true
* meta.tag[personalInformation] from https://emiga.rki.de/fhir/common/ValueSet/PersonalInformation (required)
* meta.tag[personalInformation].system 1.. MS
* meta.tag[personalInformation].system = "https://emiga.rki.de/fhir/common/CodeSystem/PersonalInformation"
* meta.tag[personalInformation].version 
* meta.tag[personalInformation].code 1.. MS
* meta.tag[personalInformation].display 
* meta.tag[personalInformation] ^definition = "Kennzeichnung von personenbezogenen Daten"
* meta.tag[personalInformation] ^short = "Kennzeichnung von personenbezogenen Daten"

* status MS
* status = #current (exactly)
* status ^comment = "Derzeit für Emiga Anwendungsfälle nur 'current' relevant."
/*
* identifier MS
* identifier ^short = "TODO"
* identifier ^definition = "TODO"
* identifier 1.. MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.description = "slicing organization identifier by system"
  * ^slicing.ordered = false
* identifier contains emigaAttachmentId 0..1 MS and
          emigaAttachmentFileNumber 0..1 MS 
* identifier[emigaAttachmentId] only IdentifierEmigaAttachmentId
* identifier[emigaAttachmentFileNumber] only IdentifierEmigaAttachmentFileNumber
* identifier[emigaAttachmentFileNumber] ^short = "EMIGA Anhang-Aktenzeichen"
* identifier[emigaAttachmentFileNumber] ^definition = "EMIGA Anhang-Aktenzeichen ist ein eindeutiger fachlicher Identifier für EMIGA Anhänge."
* identifier[emigaAttachmentId] ^short = "EMIGA Anhang-ID"
* identifier[emigaAttachmentId] ^definition = "EMIGA Anhang-ID ist ein eindeutiger technische Identifier für EMIGA Anhänge."
*/
* insert IdentifierCommon
// Derzeit für Emiga Anwendungsfälle nicht relevant
* docStatus 0..0
* docStatus ^comment = "Derzeit für Emiga Anwendungsfälle nicht relevant."

// Derzeit für Emiga Anwendungsfälle nicht relevant
* type 0..0
* type ^comment = "Derzeit für Emiga Anwendungsfälle nicht relevant."

// Derzeit für Emiga Anwendungsfälle nicht relevant
* category 0..0 
* category ^comment = "Derzeit für Emiga Anwendungsfälle nicht relevant."

// Derzeit für Emiga Anwendungsfälle nicht relevant
* subject 0..0
* subject ^comment = "Derzeit für Emiga Anwendungsfälle nicht relevant."


* date 0..1 MS
* date ^definition = "Hier wird der Zeitpunkt der Erstellung des Anhangs angegeben.\\nDies ist nicht der Zeitpunkt der Erstellung des Dokuments, sondern der Zeitpunkt, zu dem der Anhang erstellt wurde."
* date ^short = "Zeitpunkt der Erstellung des Anhangs"

* author ..1 MS
* author only Reference(EmigaUserPractitioner)
* author ^short = "Erstellende Person der Anhang, nicht der Erstellende des Dokuments"
* author ^definition = "Hier wird die Person angegeben, die den Anhang erstellt hat.\\nDies ist nicht die Person, die das Dokument erstellt hat, sondern die Person, die den Anhang erstellt hat."
// Derzeit für Emiga Anwendungsfälle nicht relevant
* authenticator 0..0
* authenticator ^comment = "Derzeit für Emiga Anwendungsfälle nicht relevant"


* custodian 0..0
* custodian ^comment = "Derzeit für Emiga Anwendungsfälle nicht relevant"
//* custodian only Reference(EmigaUserOrganization)

* content MS
* content ^slicing.discriminator.type = #exists
* content ^slicing.discriminator.path = "attachment.url"
* content ^slicing.rules = #open
* content ^definition = "Hier kann die Angabe einer strukturierten Referenz auf einen anderen Inhalt, bspw. ein anderes Dokument oder ein Dokument in der Form eines formatierten Anhangs abgebildet werden"
* content contains
    reference 0..* MS and
    attachment 0..* MS
* content[reference].attachment MS
* content[reference].attachment.contentType MS
* content[reference].attachment.contentType ^definition = "Hier wird das Dateiformat ausgewählt.\\nEs ist ein Code aus dem System urn:ietf:bcp:13 zu wählen"
* content[reference].attachment.language ..0
* content[reference].attachment.data ..0
* content[reference].attachment.url 1.. MS
* content[reference].attachment.url ^short = "URI"
* content[reference].attachment.url ^definition = "URI des Eintrags."
* content[reference].attachment.size MS
* content[reference].attachment.size ^definition = "Hier wird die Größe der Datei in Byte angegeben."
* content[reference].attachment.size ^short = "Dateigröße"
* content[reference].attachment.hash MS
* content[reference].attachment.hash ^definition = "Hier wird der Hashwert der Datei angegeben."
* content[reference].attachment.hash ^short = "Hashwert"
* content[reference].attachment.title 1.. MS
* content[reference].attachment.title ^short = "Titel"
* content[reference].attachment.title ^definition = "Title des referenzierten Dokumentes."
* content[reference].attachment.creation MS
* content[reference].attachment.creation ^short = "Zeitpunkt der Erstellung des Dokumentes"
* content[reference].attachment.creation ^definition = "Hier wird der Zeitpunkt der Erstellung des referenzierten Dokumentes angegeben."
//* content[reference].format 
* content[attachment].attachment MS
* content[attachment].attachment.contentType 1.. MS
* content[attachment].attachment.contentType ^definition = "Hier wird das Dateiformat ausgewählt.\\nEs ist ein Code aus dem System urn:ietf:bcp:13 zu wählen"
* content[attachment].attachment.contentType ^short = "Dateiformat"
* content[attachment].attachment.language ..0
* content[attachment].attachment.data 1.. MS
* content[attachment].attachment.data ^short = "Datei"
* content[attachment].attachment.data ^definition = "Hier wird das Dokument als Datei angehängt."
* content[attachment].attachment.url ..0
* content[attachment].attachment.size MS
* content[attachment].attachment.size ^definition = "Hier wird die Größe der Datei in Byte angegeben."
* content[attachment].attachment.size ^short = "Dateigröße"
* content[attachment].attachment.hash MS
* content[attachment].attachment.hash ^definition = "Hier wird der Hashwert der Datei angegeben."
* content[attachment].attachment.hash ^short = "Hashwert"
* content[attachment].attachment.title 1.. MS
* content[attachment].attachment.title ^definition = "Hier wird ein Titel bzw. eine Bezeichnung für die angehängte Datei angegeben."
* content[attachment].attachment.title ^short = "Titel der Datei"
* content[attachment].attachment.creation MS
* content[attachment].attachment.creation ^definition = "Hier wird der Zeitpunkt der Erstellung des Anhangs angegeben."
* content[attachment].attachment.creation ^short = "Zeitpunkt der Erstellung des Anhangs"
//* content[attachment].format 

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