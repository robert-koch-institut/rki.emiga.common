//BasePatient emiga Profile harmonisiert mit Demis Betr. Person
Profile: AffectedPerson
Parent: Patient
Id: AffectedPerson
Title: "Betroffene Person"
Description: "Die betroffene Person enthält relevante Angaben zum Patienten"


* insert ProfileMetaProfileTags
* insert MetadataProfile
* ^url = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson"
* ^version = "0.1.0"
* ^date = "2025-04-09"

* insert ProfileResourceCommon
//* insert ProfileDomainResourceCommon
* insert ProfileSecurityTags

* meta MS
* meta.profile 1.. MS
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson|1.2.0-alpha.9" 
* extension MS
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    $PatCitizenship named citizenship 0..2 and
    $PatBirthPlace named landOfBirth 0..1
    

* extension[landOfBirth].valueAddress.use 0..0
* extension[landOfBirth].valueAddress.type 0..0
* extension[landOfBirth].valueAddress.line 0..0
* extension[landOfBirth].valueAddress.city 0..0 
* extension[landOfBirth].valueAddress.postalCode 0..0
* extension[landOfBirth].valueAddress.district 0..0
* extension[landOfBirth].valueAddress.state 0..0
* extension[landOfBirth].valueAddress.country 1..1 MS
* extension[landOfBirth].valueAddress.country ^short = "Geburtstaat"
* extension[landOfBirth].valueAddress.country ^definition = "Geburtsstaat der betroffenen Person."
* extension[landOfBirth].valueAddress.country from $iso3166-1-2 (extensible)
* extension[landOfBirth].valueAddress.period 0..0
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
* identifier MS 
* identifier
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.description = "slicing patient identifier by system"
  * ^slicing.ordered = false
* identifier contains referencenumberpatientid 1..1 MS and filenumberpatientid 1..1 MS
* identifier[referencenumberpatientid] only IdentifierReferenceNumberPatientId
* identifier[referencenumberpatientid].use 0..1 MS
* identifier[referencenumberpatientid].use = #official (exactly)
* identifier[referencenumberpatientid].system 1..1 MS
* identifier[referencenumberpatientid].system = "https://emiga.rki.de/fhir/common/sid/ReferenceNumberPatientId"
//Reserved for later use
//* identifier[referencenumberpatientid].assigner
* identifier[filenumberpatientid] only IdentifierFileNumberPatientId
* identifier[filenumberpatientid].use 0..1 MS
* identifier[filenumberpatientid].use = #secondary (exactly)
* identifier[filenumberpatientid].system 1..1 MS
* identifier[filenumberpatientid].system = "https://emiga.rki.de/fhir/common/sid/FileNumberPatientId"

// Indicating if the patient is active will not be needed at this point
//active 0..1 

// Name of the Patient
* name MS
* name only $humanname-de-basis
* name ^short = "Name"
* name ^definition = "Name der betroffenen Person."
// Name Extension for Salutation
* name.extension contains https://emiga.rki.de/fhir/common/StructureDefinition/Salutation named salutation 0..1 MS
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
* address.extension contains $AddressUse named addressUse 0..* and
    $Facility named facility 0..*
* address.extension[addressUse].value[x] ^mustSupport = true
* address.extension[facility].extension[facility].value[x] ^mustSupport = true

* address.extension[Stadtteil] ^mustSupport = true
* address.extension[Stadtteil].valueString MS
* address.extension[Stadtteil].valueString obeys validString
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
* communication.language ^short = "Sprachkentnisse"
* communication.language ^definition = "Sprachkentnisse der betroffenen Person."
* generalPractitioner MS
* generalPractitioner ^short = "Behandelnde Person (Arzt/Ärztin)"
* generalPractitioner ^definition = "Behandelnde Person der betroffenen Person."
* managingOrganization ..0

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


