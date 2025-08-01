Profile: EmigaUserPractitioner
Parent: Practitioner
Id: EmigaUserPractitioner
Title: "Emiga Nutzende Person"
Description: "TODO"
* ^url = "https://emiga.rki.de/fhir/common/StructureDefinition/EmigaUserPractitioner"
* ^version = "0.2.0"
* ^date = "2025-03-03"

* insert MetadataProfile
* insert ProfileResourceCommon
* insert ProfileDomainResourceCommon
* insert ProfileSecurityTags
//* insert ProfileMetaTags
* insert ProfileMetaProfileTags
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/EmigaUserPractitioner|1.2.0-alpha.8"

// 'Additional content defined by implementations' - 0..* - Extension
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* extension 0..0

// 'An identifier for the person as this agent' - 0..* - Identifier
// Logischer Identifier der Person

* identifier 1..1 MS
* identifier ^comment = "Emailaddresse der Nutzende Person - email Regex?"
* identifier.system MS
* identifier.value MS

// 'Whether this practitioner's record is in active use' - 0..1 - boolean
// Der entsprechende Eintrag muss gepflegt werden, um eindeutig feststellen zu können, ob ein Eintrag noch aktiv ist.
// Update 04.04.25: Optional weil im jetztigen Zeitpunkt nicht fachlich geklärt ist, ob das Feld immer gesetzt werden muss.
* active 0..1 MS
* active ^comment = "Update 04.04.25: Optional weil im jetztigen Zeitpunkt nicht fachlich geklärt ist, ob das Feld immer gesetzt werden muss.
Der entsprechende Eintrag muss gepflegt werden, um eindeutig feststellen zu können, ob ein Eintrag noch aktiv ist."

// 'The name(s) associated with the practitioner' - 0..* - HumanName

* name MS
* name only $humanname-de-basis
* name.family 1.. MS  
* name.family.extension[nachname] obeys validString
* name.given 1.. MS  
* name.given obeys validString
* name.prefix MS


// 'A contact detail for the practitioner (that apply to all roles)' - 0..* - ContactPoint
// We slice the telecom element to apply the regex rules

* telecom 0..0 
/*
* telecom ^slicing.discriminator.type = #value
* telecom ^slicing.discriminator.path = "system"
* telecom ^slicing.rules = #closed
* telecom ^definition = "Kontaktangaben der Organisation. Telefonnummern, E-Mailadressen, Urls und Faxnummern können angegeben werden."
* telecom contains
    Email 0..* and
    Phone 0..* and
    Fax 0..*
* telecom[Email].system 1.. MS
* telecom[Email].system = #email (exactly)
* telecom[Email].value 1.. MS
* telecom[Email].value obeys validEmailAddress
* telecom[Phone].system 1.. MS
* telecom[Phone].system = #phone (exactly)
* telecom[Phone].value 1.. MS
* telecom[Phone].value obeys validPhoneNumber
* telecom[Fax].system 1.. MS
* telecom[Fax].system = #fax (exactly)
* telecom[Fax].value 1.. MS
* telecom[Fax].value obeys validFaxNumber
*/
// 'Address(es) of the practitioner that are not role specific (typically home address)' - 0..* - Address
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* address 0..0

// 'male | female | other | unknown' - 0..1 - code
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* gender 0..0

// 'The date on which the practitioner was born' - 0..1 - date
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* birthDate 0..0

// 'Image of the person' - 0..* - Attachment
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
// Kann aber sicherlich interssant sein, um eine personalisierung von Kontaktdaten auf freiwilliger Basis zu ermöglichen
* photo 0..0

// 'Certification, licenses, or training pertaining to the provision of care' - 0..* - BackboneElement
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* qualification 0..0

// 'A language the practitioner is able to use in patient communication' - 0..* - CodeableConcept
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* communication 0..0



Invariant: validString
Description: "Zeichenlänge maximal 255 Zeichen"
* severity = #error
* expression = "$this.matches('^.{1,255}$')"