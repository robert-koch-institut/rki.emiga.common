//BasePatient emiga Profile harmonisiert mit Demis Betr. Person
Profile: AffectedPerson
Parent: Patient
Id: AffectedPerson
Title: "Betroffene Person"
Description: "Die betroffene Person enthält relevante Angaben zum Patienten"


* insert ProfileMetaProfileTags
* insert MetadataProfile
* ^url = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson"
* ^version = "0.2.0"
* ^date = "2025-09-26"

* insert ProfileResourceCommon
//* insert ProfileDomainResourceCommon
* insert ProfileSecurityTagsPerson

* meta MS
* meta.profile 1.. MS
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson|1.2.0-alpha.12" 

* meta.extension contains $LastModifiedBy named lastModifiedBy 0..1 MS
* meta.extension[lastModifiedBy].value[x] only Reference(EmigaUserPractitioner)

* extension MS
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    //$PatCitizenship named citizenship 0..* MS and
    $HL7PatCitizenship named citizenship 0..* MS and
    $PatBirthPlace named landOfBirth 0..1 MS and
    $ProcessingStatusAffectedPersonExt named processingStatus 0..1 MS 

* extension[citizenship].url = "http://hl7.org/fhir/StructureDefinition/patient-citizenship" (exactly)
* extension[citizenship].extension[code].value[x] only CodeableConcept
* extension[citizenship].extension[code].valueCodeableConcept from CountryCodes (extensible)
//* extension[citizenship].valueCodeableConcept 1.. MS
* extension[citizenship].extension[code].valueCodeableConcept ^short = "Staatsangehörigkeit"
* extension[citizenship].extension[code].valueCodeableConcept ^definition = "Staatsangehörigkeit der betroffenen Person"
* extension[citizenship].extension[code].valueCodeableConcept.coding 1.. MS
* extension[citizenship].extension[code].valueCodeableConcept.coding.system 1..1 MS
* extension[citizenship].extension[code].valueCodeableConcept.coding.system = "http://fhir.de/CodeSystem/deuev/anlage-8-laenderkennzeichen"
* extension[citizenship].extension[code].valueCodeableConcept.coding.code 1..1 MS
* extension[citizenship].extension[code].valueCodeableConcept.coding.display ^mustSupport = true
* extension[citizenship].extension[code].valueCodeableConcept.coding.version MS


//* extension[citizenship].valueCoding ^mustSupport = true


* extension[landOfBirth].valueCoding ^mustSupport = true

* insert IdentifierCommon
/*
* extension[nationality].extension contains
    code 0..1 and
    period 0..1
* extension[nationality].extension[code].value[x] only CodeableConcept
* extension[nationality].extension[period].value[x] only Period
*/
//* extension[birthPlace] from http://hl7.org/fhir/StructureDefinition/patient-birthPlace
//* extension[birthPlace] ^definition = "Geburtsland"
//* extension[birthPlace].value[x] only Address

// 'Identifies this Patient across multiple systems' - 0..* - Identifier
// Logischer Identifier des Patientes
// Wir gestalten das Slicing bewusst offen, um später weitere Identifier-Typen abbilden zu können (z.B. DEMIS-ID, gematik-ID, usw.)
// Cardinalities will be set in slicing
//* identifier.system 0..1
//* identifier.value 0..1
// Must have at least two identifiers
/*
* identifier MS 
* identifier
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.description = "slicing patient identifier by system"
  * ^slicing.ordered = false
* identifier contains EmigaID 1..1 MS and EmigaFileNumber 1..1 MS

* identifier[EmigaID] only IdentifierEmigaID
* identifier[EmigaID].use 0..1 MS
* identifier[EmigaID].use = #official (exactly)
* identifier[EmigaID].system 1..1 MS
* identifier[EmigaID].system = "https://emiga.rki.de/fhir/sid/EmigaID"

* identifier[EmigaFileNumber] only IdentifierEmigaFileNumber
* identifier[EmigaFileNumber].use 0..1 MS
* identifier[EmigaFileNumber].use = #official (exactly)
* identifier[EmigaFileNumber].system 1..1 MS
* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
*/
//Reserved for later use
//* identifier[referencenumberpatientid].assigner


// Indicating if the patient is active will not be needed at this point
//active 0..1 

// Name of the Patient
* name MS
* name only $humanname-de-basis
* name obeys maidenNameOnlyFamily
* name ^short = "Name"
* name ^definition = "Name der betroffenen Person."
// Name Extension for Salutation
* name.extension contains $SalutationExt named salutation 0..1 MS
* name.use 0..1 MS
* name.use ^comment = "Die Geburtsname wird über den use 'maiden' abgebildet. Der offizielle Name wird über den use 'official' abgebildet. Der Kurzname wird über den use 'nickname' abgebildet. Wenn kein Wert angegeben wird, ist der offizielle Name gemeint."
* name.family MS
* name.family ^short = "Nachname"
* name.family ^definition = "Nachname der betroffenen Person."
* name.given MS
* name.given ^short = "Vorname"
* name.given ^definition = "Vorname der betroffenen Person."
// Kontaktangaben des Patientes
* telecom 0.. MS
* telecom ^slicing.discriminator.type = #value
* telecom ^slicing.discriminator.path = "system"
* telecom ^slicing.rules = #closed
* telecom ^definition = "Kontaktangaben der betroffenen Person. Telefonnummern, E-Mailadressen, Urls und Faxnummern können angegeben werden."
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
* telecom[Fax].system = #fax (exactly)
* telecom[Fax].value 1.. MS
* telecom[Fax].value obeys validFaxNumber
// Must have a gender taken from Deutsch Basisprofile added extension for data absent
* gender 0..1 MS 
* gender.extension ^slicing.discriminator.type = #value
* gender.extension ^slicing.discriminator.path = "url"
* gender.extension ^slicing.rules = #open
* gender.extension contains $gender-amtlich-de named other-amtlich 0..1 MS and $ExtensionNullFlavor named null-flavor 0..1 MS

* address MS
* address only $address-de-basis
* address.extension contains $AddressUse named addressUse 0..* MS and
    $Facility named facilityAssociation 0..* MS and
    $Geolocation named geolocation 0..* MS and
    $RegionalKey named regionalKey 0..1 MS

* address.extension[addressUse].value[x] ^mustSupport = true
* address.extension[facilityAssociation].extension[facility].value[x] ^mustSupport = true
* address.extension[geolocation].extension ^mustSupport = true
* address.extension[geolocation].extension[latitude] ^mustSupport = true
* address.extension[geolocation].extension[longitude] ^mustSupport = true

* address.extension[regionalKey].extension[regionKey] ^mustSupport = true
* address.extension[regionalKey].extension[regionReferenceSystem] ^mustSupport = true
* address.extension[regionalKey].extension[regionKey].valueString ^mustSupport = true
* address.extension[regionalKey].extension[regionReferenceSystem].valueString ^mustSupport = true

* address.extension[Stadtteil] ^mustSupport = true
* address.extension[Stadtteil].valueString MS
* address.extension[Stadtteil].valueString obeys validString

* address.use 0..0
* address.use ^comment = "Die Nutzung der Adresse wird über die Extension AddressUse abgebildet."

* address.line.extension[Strasse] ^mustSupport = true
* address.line.extension[Strasse].valueString MS
* address.line.extension[Strasse].valueString obeys validString
* address.line.extension[Hausnummer] ^mustSupport = true
* address.line.extension[Hausnummer].valueString MS
* address.line.extension[Hausnummer].valueString obeys validHouseNumber
* address.line.extension[Adresszusatz] ^mustSupport = true
* address.line.extension[Adresszusatz].valueString MS
* address.line.extension[Adresszusatz].valueString obeys validString
* address.line.extension[Postfach] ^mustSupport = true
* address.line.extension[Postfach].valueString MS
* address.line.extension[Postfach].valueString obeys validString
* address.city MS
* address.city ^short = "Stadt"
* address.city ^definition = "Stadt"
// Reserved for later use if needed
//* address.postalCode from $postalCode (preferred)
* address.postalCode ^definition = "Postleitzahl" //. Der Wert muss entsprechend des vom RKI definierten ValueSets (https://demis.rki.de/fhir/ValueSet/postalCode) im coding Element dargestellt werden."
* address.postalCode MS 
* address.postalCode obeys validPLZ
* address.state MS
* address.country from $iso3166-1-2 (extensible)
* address.country ^short = "Land"
* address.country ^definition = "Land"
* address.city obeys validString


// Geburtsdatum mit regex addiert
* birthDate 0..1 MS 
* birthDate obeys validBirthDate
* birthDate ^short = "Geburtsdatum"
* birthDate ^definition = "Geburtsdatum der betroffenen Person"

// A Related Person Resource wird dafür warscheinlich benuzt, 
/*
* contact MS

* contact.relationship 0..* MS
* contact.relationship.coding MS
* contact.relationship.coding.system 0..1 MS
* contact.relationship.coding.code 0..1 MS
* contact.name 0..1 MS
* contact.name only $humanname-de-basis
* contact.name ^short = "Name"
* contact.name ^definition = "Name der Kontakt Person."
// Name Extension for Salutation
//* name.extension contains https://emiga.rki.de/fhir/case/StructureDefinition/Salutation named salutation 1..1 MS
* contact.name.family 0..1 MS
* contact.name.family ^short = "Nachname"
* contact.name.family ^definition = "Nachname der betroffenen Person."
* contact.name.given ..1 MS
* contact.name.given ^short = "Vorname"
* contact.name.given ^definition = "Vorname der betroffenen Person."

//* contact.telecom 0..* 
//* contact.telecom.system 0..1
//* contact.telecom.value 0..1
* contact.telecom 0.. MS
* contact.telecom ^slicing.discriminator.type = #value
* contact.telecom ^slicing.discriminator.path = "system"
* contact.telecom ^slicing.rules = #closed
* contact.telecom ^definition = "Kontaktangaben der Organisation. Telefonnummern, E-Mailadressen, Urls und Faxnummern können angegeben werden."
* contact.telecom contains
    Email 0..* and
    Phone 0..* and
    Fax 0..*
* contact.telecom[Email].system 1.. MS
* contact.telecom[Email].system = #email (exactly)
* contact.telecom[Email].value 1.. MS
* contact.telecom[Email].value obeys validEmailAddress
* contact.telecom[Phone].system 1.. MS
* contact.telecom[Phone].system = #phone (exactly)
* contact.telecom[Phone].value 1.. MS
* contact.telecom[Phone].value obeys validPhoneNumber
* contact.telecom[Fax].system = #fax (exactly)
* contact.telecom[Fax].value 1.. MS
* contact.telecom[Fax].value obeys validFaxNumber

* contact.gender 0..1 MS
* contact.gender.extension ^slicing.discriminator.type = #value
* contact.gender.extension ^slicing.discriminator.path = "url"
* contact.gender.extension ^slicing.rules = #open
* contact.gender.extension contains $gender-amtlich-de named other-amtlich 0..1 MS and $data-absent named data-absent-reason 0..1 MS

* contact.address 0..1 MS
* contact.address only $address-de-basis
* contact.address.extension[Stadtteil] ^mustSupport = true
* contact.address.extension[Stadtteil].valueString MS
* contact.address.extension[Stadtteil].valueString obeys validString
* contact.address.line.extension[Strasse] ^mustSupport = true
* contact.address.line.extension[Strasse].valueString MS
* contact.address.line.extension[Strasse].valueString obeys validString
* contact.address.line.extension[Hausnummer] ^mustSupport = true
* contact.address.line.extension[Hausnummer].valueString MS
* contact.address.line.extension[Hausnummer].valueString obeys validHouseNumber
* contact.address.line.extension[Adresszusatz] ^mustSupport = true
* contact.address.line.extension[Adresszusatz].valueString MS
* contact.address.line.extension[Adresszusatz].valueString obeys validString
* contact.address.line.extension[Postfach] ^mustSupport = true
* contact.address.line.extension[Postfach].valueString MS
* contact.address.line.extension[Postfach].valueString obeys validString
* contact.address.city MS
* contact.address.city ^short = "Stadt"
* contact.address.city ^definition = "Stadt"
// Reserved for later use if needed
//* address.postalCode from $postalCode (preferred)
* contact.address.postalCode ^definition = "Postleitzahl" //. Der Wert muss entsprechend des vom RKI definierten ValueSets (https://demis.rki.de/fhir/ValueSet/postalCode) im coding Element dargestellt werden."
* contact.address.postalCode MS 
* contact.address.postalCode obeys validPLZ
* contact.address.country from $iso3166-1-2 (extensible)
* contact.address.country ^short = "Land"
* contact.address.country ^definition = "Land"
* contact.address.city obeys validString
*/
* deceased[x] MS
//* deceased[x] MS
* deceased[x] ^short = "Verstorben"
* deceased[x] ^definition = "Angabe ob die betroffene Person verstorben ist"

// Noch nicht benötigt
* maritalStatus ..0
* multipleBirth[x] ..0 // May indicate multiple birth (boolean or integer)
* photo ..0 
* communication MS
* communication.language MS
* communication.language from CommonLanguages (extensible)
* communication.language ^short = "Sprachkentnisse"
* communication.language ^definition = "Sprachkentnisse der betroffenen Person."
* generalPractitioner MS
* generalPractitioner ^short = "Behandelnde Person (Arzt/Ärztin)"
* generalPractitioner ^definition = "Behandelnde Person der betroffenen Person."
* managingOrganization ..0

/*
* link ^slicing.discriminator[0].type = #type
* link ^slicing.discriminator[0].path = "other"
* link ^slicing.discriminator[1].type = #value
* link ^slicing.discriminator[1].path = "type"
* link ^slicing.rules = #open

* link contains relatedPersonLink 0..* MS and patientLink 0..* MS
* link[relatedPersonLink] ^short = "Link zu einer Bezugsperson (RelatedPerson) Resource die den selben Person darstellt"
* link[relatedPersonLink] ^definition = "Link zu einer Bezugsperson (RelatedPerson) Resource die den selben Person darstellt"
* link[relatedPersonLink].type 1..1 MS
* link[relatedPersonLink].type = #seealso (exactly)
* link[relatedPersonLink].other 1..1 MS
* link[relatedPersonLink].other only Reference(RelatedPerson)
* link[relatedPersonLink].other.reference MS

* link[patientLink] ^short = "Link zu einer betroffenen Person (Patient) Resource die den selben Person darstellt"
* link[patientLink] ^definition = "Link zu einer betroffenen Person (Patient) Resource die den selben Person darstellt"
* link[patientLink].type 1..1 MS
* link[patientLink].other 1..1 MS
* link[patientLink].other only Reference(Patient)
* link[patientLink].other.reference MS
*/

* link MS
* link ^slicing.discriminator.type = #type
* link ^slicing.discriminator.path = "other"
* link ^slicing.rules = #open
* link contains  relatedPersonLink 0..* MS and 
                patientLink 0..* MS
* link[relatedPersonLink] ^short = "Link zu einer Bezugsperson (RelatedPerson) Resource die den selben Person darstellt"                
* link[relatedPersonLink].type 1..1 MS
* link[relatedPersonLink].type = #seealso (exactly)
* link[relatedPersonLink].other 1..1 MS
* link[relatedPersonLink].other only Reference(RelatedPerson)
* link[relatedPersonLink].other.reference MS

* link[patientLink].type 1..1 MS
* link[patientLink] ^short = "Link zu einer betroffenen Person (Patient) Resource die den selben Person darstellt"
* link[patientLink].other 1..1 MS
* link[patientLink].other only Reference(Patient)
* link[patientLink].other.reference MS



// Diskussion ob ein managingOrganization benötigt wird
//* managingOrganization 0..1 MS // Must have a managing organization
//* managingOrganization.reference 0..1
//* link 0..* 

// Invariants to validate the address and telecom values

//    Max. Zeichenlänge = 255 / Alle Zeichen erlaubt / Formatvalidierung E-Mail 
Invariant: validEmailAddress
Description: "Die E-Mail-Adresse muss valide sein."
* severity = #error
* expression = "$this.matches('^[a-zA-Z0-9._%+-]+@(?:[a-zA-Z0-9-]+[.])+[a-zA-Z0-9]{2,63}$')"

//    Max. Zeichenlänge = 50 / Nur Zahlen erlaubt / Länderpräfix mit Deutschland als Default 
Invariant: validPhoneNumber
Description: "Die Telefonnummer muss valide sein."
* severity = #error
* expression = "$this.matches('^(( ?\\\\+[0-9]{2,4}( ?[0-9]+? ?| ? \\\\([0-9]+?\\\\) ?))|(\\\\(0[0-9 ]+?\\\\) ?)|( 0[0-9]+? ?( |-|\\/) ?))? ?[0-9]+?[0-9 \\/-]*[0-9]$')"

//     Max. Zeichenlänge = 1000 / Alle Zeichen erlaubt / Formatvalidierung Website

Invariant: validUrl
Description: "Die Url muss valide sein."
* severity = #error
* expression = "$this.matches('^(https?:\\/\\/)?([\\da-z.-]{1,1000})\\.([a-z.]{2,6})([/\\w.-]{0,999})\\/?$')"

// TODO: Verify need of regex
Invariant: validFaxNumber
Description: "Die Faxnummer muss valide sein."
* severity = #error
* expression = "$this.matches('^(( ?\\\\+[0-9]{2,4}( ?[0-9]+? ?| ? \\\\([0-9]+?\\\\) ?))|(\\\\(0[0-9 ]+?\\\\) ?)|( 0[0-9]+? ?( |-|\\/) ?))? ?[0-9]+?[0-9 \\/-]*[0-9]$')"

// valid String

Invariant: validString
Description: "Zeichenlänge maximal 255 Zeichen"
* severity = #error
* expression = "$this.matches('^.{1,255}$')"

// valid Hausnummer

Invariant: validHouseNumber
Description: "Die Hausnummer muss valide sein. Zeichenlänge maximal 50 Zeichen"
* severity = #error
* expression = "$this.matches('^.{1,50}$')"


//valid PLZ

Invariant: validPLZ
Description: "Die PLZ muss valide sein. Zeichenlänge maximal 10 Zeichen"
* severity = #error
* expression = "$this.matches('^.{1,10}$')"

Invariant: validBirthDate
Description: "Das Geburtsjahr muss mit 19 oder 20 beginnen."
* severity = #warning
* expression = "$this.toString().matches('^19[0-9]{2}-[0-9]{2}-[0-9]{2}|20[0-9]{2}-[0-9]{2}-[0-9]{2}|19[0-9]{2}-[0-9]{2}|20[0-9]{2}-[0-9]{2}|19[0-9]{2}|20[0-9]{2}$')"


// Invariant to ensure that only family name is present when name.use is maiden
Invariant: maidenNameOnlyFamily
Description: "Wenn name.use = 'maiden', darf nur name.family ausgefüllt werden. Die anderen Namensbestandteile müssen leer sein."
* severity = #error
* expression = "name.where(use = 'maiden').all(given.empty() and prefix.empty() and suffix.empty() and text.empty() and family.exists())"
