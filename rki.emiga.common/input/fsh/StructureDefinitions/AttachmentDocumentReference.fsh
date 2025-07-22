Profile: AttachmentDocumentReference
Parent: DocumentReference
Id: AttachmentDocumentReference
Title: "Anhang"
Description: "Mit den Anhang hat man die Möglichkeit, Dokumente, auch aus Anschreiben-Vorlagen, an Annotationen anzuhängen, um verschiedene Dateien strukturiert und nachvollziehbar an Entitäten oder für die Organisation zu hinterlegen."
* ^url = "https://emiga.rki.de/fhir/common/StructureDefinition/AttachmentDocumentReference"
* insert MetadataProfile
* insert ProfileSecurityTags
* insert ProfileResourceCommon
* insert ProfileDomainResourceCommon
* insert ProfileMetaProfileTags

* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AttachmentDocumentReference|1.2.0-alpha.2"

* status MS
* status = #current (exactly)

* identifier MS
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


* custodian 0..0
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
* content[reference].attachment.url ^definition = "URI des Eintrags."
* content[reference].attachment.size ..0
* content[reference].attachment.hash ..0
* content[reference].attachment.title 1.. MS
* content[reference].attachment.title ^definition = "Name des referenzierten Dokumentes."
* content[reference].attachment.creation MS
* content[reference].attachment.creation ^definition = "Hier wird der Zeitpunkt der Erstellung des referenzierten Dokumentes angegeben."
//* content[reference].format 
* content[attachment].attachment MS
* content[attachment].attachment.contentType 1.. MS
* content[attachment].attachment.contentType ^definition = "Hier wird das Dateiformat ausgewählt.\\nEs ist ein Code aus dem System urn:ietf:bcp:13 zu wählen"
* content[attachment].attachment.language ..0
* content[attachment].attachment.data 1.. MS
* content[attachment].attachment.data ^definition = "Hier wird das Dokument als Datei angehängt."
* content[attachment].attachment.url ..0
* content[attachment].attachment.size ..0
* content[attachment].attachment.hash ..0
* content[attachment].attachment.title 1.. MS
* content[attachment].attachment.title ^definition = "Hier wird ein Titel bzw. eine Bezeichnung für die angehängte Datei angegeben."
* content[attachment].attachment.creation MS
* content[attachment].attachment.creation ^definition = "Hier wird der Zeitpunkt der Erstellung des Anhangs angegeben."
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