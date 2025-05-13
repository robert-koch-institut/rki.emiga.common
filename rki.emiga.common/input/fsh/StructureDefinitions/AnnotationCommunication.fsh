Profile: AnnotationCommunication
Parent: Communication
Id: AnnotationCommunication
Title: "Annotation"
Description: "ToDo"
* ^version = "0.1.0"
* ^date = "2025-04-29"
* ^url = "https://emiga.rki.de/fhir/common/StructureDefinition/AnnotationCommunication"

* insert MetadataProfile
* insert ProfileSecurityTags
* insert ProfileResourceCommon
* insert ProfileDomainResourceCommon
* insert ProfileMetaProfileTags

* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AnnotationCommunication"

//* meta.tag ^mustSupport = true
* meta.tag MS
* meta.tag ^slicing.discriminator.type = #pattern
* meta.tag ^slicing.discriminator.path = "system"
* meta.tag ^slicing.rules = #open
* meta.tag contains 
    personalInformation 1.. MS
//* meta.tag[personalInformation] ^mustSupport = true
* meta.tag[personalInformation] from https://emiga.rki.de/fhir/common/ValueSet/PersonalInformationVS (required)
* meta.tag[personalInformation].system 1.. MS
* meta.tag[personalInformation].system = "https://emiga.rki.de/fhir/common/CodeSystem/PersonalInformation"
* meta.tag[personalInformation].version MS
* meta.tag[personalInformation].code 1.. MS
* meta.tag[personalInformation].display MS
* meta.tag[personalInformation] ^definition = "Kennzeichnung von personenbezogenen Daten"
* meta.tag[personalInformation] ^short = "Kennzeichnung von personenbezogenen Daten"

// Derzeit für Emiga Anwendungsfälle nicht relevant
* language 0..0
* identifier ^short = "TODO"
* identifier ^definition = "TODO"
* identifier 0.. MS
//Derzeit für Emiga Anwendungsfälle nicht relevant
* instantiatesCanonical 0..0
//Derzeit für Emiga Anwendungsfälle nicht relevant
* instantiatesUri 0..0
//Derzeit für Emiga Anwendungsfälle nicht relevant
* basedOn 0..0
//Derzeit für Emiga Anwendungsfälle nicht relevant
* partOf 0..0
//Derzeit für Emiga Anwendungsfälle nicht relevant
* inResponseTo 0..0
//Derzeit für Emiga Anwendungsfälle nicht relevant
* status 1..1 MS
* status = #completed (exactly)
// Derzeit für Emiga Anwendungsfälle nicht relevant
* statusReason 0..0
* extension 1.. MS
* extension contains $ProcessingStatus named processingStatus 1..1 MS and $DateCreated named dateCreated 1..1 MS

//Es wird für "Schlagwort" überlegt
* category 0..1 MS
* category ^short = "Schlagwort"
* category ^definition = "Schlagwort der Annotation"
* category.coding 0..0
* category.coding ^comment = "Der Schlagwort wird im Text Feld dokumentiert"
* category.text 1..1 MS
* category.text ^short = "Schlagwort-Inhalt"
//Derzeit für Emiga Anwendungsfälle nicht relevant
* priority 0..0
//Derzeit für Emiga Anwendungsfälle nicht relevant
* medium 0..0
//Derzeit für Emiga Anwendungsfälle nicht relevant
* subject 0..0
* subject ^comment = "Subject der Annotation ist ein andere Entität, es wird über about referenziert"
//Betreff
* topic MS
* topic ^short = "Betreff"
* topic.coding 0..0
* topic.coding ^comment = "Der Betreff wird im Text Feld dokumentiert"
* topic.text 1..1 MS
* topic.text ^short = "Betreff-Inhalt"

//Über welche Entität wird die Annotation benötigt
* about 0..* MS
* about ^short = "Bezugsentität"
* about ^definition = "Referenz zur Bezugsentität"
//Derzeit für Emiga Anwendungsfälle nicht relevant
* encounter 0..0
//Erstellungsdatum
* sent 0..1 MS

* received 0..0

* recipient 0..0

* sender 1..1 MS
* sender only Reference(EmigaUserPractitioner)
* sender ^definition = "Erstellende Person der Annotation"
* sender ^short = "Erstellende Person"
//Derzeit für Emiga Anwendungsfälle nicht relevant
* reasonCode 0..0
* reasonCode ^comment = "Derzeit für Emiga Anwendungsfälle nicht relevant"

//Derzeit für Emiga Anwendungsfälle nicht relevant
* reasonReference 0..0 
* payload 1..* MS
* payload ^short = "Inhalt"
* payload ^definition = "Inhalt der Annotation"
* payload.content[x] MS
* payload.content[x] ^comment = "Der Inhalt der Annotation wird im contentString Feld gespeichert oder im Fall eines Anhangs im contentAttachment Referenziert"
* payload.content[x] only string or Reference(AttachmentDocumentReference)

/*
* note 0..* MS
* note ^short = "Beschreibung"
* note ^definition = "Beschreibung der Annotation"
* note.author[x] 0..0
* note.author[x] ^comment = "Der Autor der Annotation wird über den Sender abgebildet"
* note.text MS
*/