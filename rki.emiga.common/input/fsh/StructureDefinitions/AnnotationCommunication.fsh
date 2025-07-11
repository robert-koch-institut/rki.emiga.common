Profile: AnnotationCommunication
Parent: Communication
Id: AnnotationCommunication
Title: "Annotation"
Description: "Annotationen dienen dazu, Entitäten wie z.B. Fälle, Ausbrüche oder Personen mit Notizen, Kommentaren und Anhängen zu versehen sowie allgemeine Notizen, Kommentare und Dokumente ohne Entitätsbezug zu hinterlegen."
* ^version = "0.2.0"
* ^date = "2025-04-29"
* ^url = "https://emiga.rki.de/fhir/common/StructureDefinition/AnnotationCommunication"

* insert MetadataProfile
* insert ProfileSecurityTags
* insert ProfileResourceCommon
* insert ProfileDomainResourceCommon
* insert ProfileMetaProfileTags

* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AnnotationCommunication|1.2.0-alpha.7"

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
* meta.tag[personalInformation].version 
* meta.tag[personalInformation].code 1.. MS
* meta.tag[personalInformation].display 
* meta.tag[personalInformation] ^definition = "Kennzeichnung von personenbezogenen Daten"
* meta.tag[personalInformation] ^short = "Kennzeichnung von personenbezogenen Daten"

// Derzeit für Emiga Anwendungsfälle nicht relevant
* language 0..0
* identifier ^short = "TODO"
* identifier ^definition = "TODO"
* identifier 1.. MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.description = "slicing organization identifier by system"
  * ^slicing.ordered = false
* identifier contains emigaAnnotationId 1..1 MS and
          survnetAnnotationId 0..1 MS
* identifier[emigaAnnotationId] only IdentifierEmigaAnnotationId
* identifier[survnetAnnotationId] only IdentifierSurvNetAnnotationId
//* identifier only IdentifierAnn
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
* category MS
* category ^short = "Schlagwort"
* category ^definition = "Schlagwort der Annotation"

* category.coding MS
* category.coding ^slicing.discriminator.type = #pattern
* category.coding ^slicing.discriminator.path = "$this"
* category.coding ^slicing.rules = #open
* category.coding ^definition = "TODO"
* category.coding contains keywordsLocal 0..1 MS and
          keywordsGlobal 0..1 MS
* category.coding[keywordsLocal] from https://emiga.rki.de/fhir/common/ValueSet/KeywordsLocal (example)
* category.coding[keywordsLocal].system 1..1 MS
* category.coding[keywordsLocal].system = $KeywordsLocal
* category.coding[keywordsLocal].version 0..1 MS
* category.coding[keywordsLocal].code MS
* category.coding[keywordsLocal].code ^short = "Schlagwort-Code Lokal"
* category.coding[keywordsLocal].code ^definition = "Lokale Schlagwort-Code der Annotation"
* category.coding[keywordsLocal].display 0..1 MS

* category.coding[keywordsGlobal] from https://emiga.rki.de/fhir/common/ValueSet/KeywordsGlobal (example)
* category.coding[keywordsGlobal].system 1..1 MS
* category.coding[keywordsGlobal].system = $KeywordsGlobal
* category.coding[keywordsGlobal].version 0..1 MS
* category.coding[keywordsGlobal].code MS
* category.coding[keywordsGlobal].code ^short = "Global Schlagwort-Code"
* category.coding[keywordsGlobal].code ^definition = "Global Schlagwort-Code der Annotation"
* category.coding[keywordsGlobal].display 0..1 MS


/*
* category.coding ^slicing.discriminator.type = #value
* category.coding ^slicing.discriminator.path = "$this"
* category.coding ^slicing.rules = #open
* category.coding ^definition = "TODO"
* category.coding contains
    ausbruchscategorieSurvNet 0..1 MS and
    ausbruchscategorieSnomed 0..1 MS
* category.coding[ausbruchscategorieSurvNet] from $OutbreakCategoryVS (required)
* category.coding[ausbruchscategorieSurvNet] ^short = "Ausbruchskategorie"
* category.coding[ausbruchscategorieSurvNet] ^patternCoding.system = "https://emiga.rki.de/fhir/outbreak/CodeSystem/OutbreakCategory"
* category.coding[ausbruchscategorieSurvNet].system 1.. MS
* category.coding[ausbruchscategorieSurvNet].version MS
* category.coding[ausbruchscategorieSurvNet].code 1.. MS
* category.coding[ausbruchscategorieSurvNet].display MS
* category.coding[ausbruchscategorieSurvNet].userSelected ..0
* category.coding[ausbruchscategorieSnomed] from $sct (required)
* category.coding[ausbruchscategorieSnomed] ^short = "Ausbruchskategorie mit Snomed kodiert"
* category.coding[ausbruchscategorieSnomed] ^patternCoding.system = "http://snomed.info/sct"
* category.coding[ausbruchscategorieSnomed].system 1.. MS
* category.coding[ausbruchscategorieSnomed].version MS
* category.coding[ausbruchscategorieSnomed].code 1.. MS
* category.coding[ausbruchscategorieSnomed].display MS
* category.coding[ausbruchscategorieSnomed].userSelected ..0
*/
//* category.coding ^comment = "Der Schlagwort wird im Text Feld dokumentiert"
//* category.text
//* category.text ^short = "Schlagwort-Inhalt"
//Derzeit für Emiga Anwendungsfälle nicht relevant
* priority 0..0
//Derzeit für Emiga Anwendungsfälle nicht relevant
* medium 0..0
//Derzeit für Emiga Anwendungsfälle nicht relevant
* subject 0..0
* subject ^comment = "Subject der Annotation ist ein andere Entität, es wird über about referenziert"
//Betreff
* topic 1..1 MS
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
* payload.content[x] only string or Reference(AttachmentDocumentReference) 
* payload.content[x] ^comment = "Der Inhalt der Annotation wird im contentString Feld gespeichert oder im Fall eines Anhangs im contentAttachment Feld"
//* payload.contentString 0..1 MS
* payload.contentString ^short = "Beschreibung - Inhalt der Annotation"
* payload.contentReference ^short = "Anhang - Hier wird der Anhang der Annotation referenziert"


/*
* note 0..* MS
* note ^short = "Beschreibung"
* note ^definition = "Beschreibung der Annotation"
* note.author[x] 0..0
* note.author[x] ^comment = "Der Autor der Annotation wird über den Sender abgebildet"
* note.text MS
*/