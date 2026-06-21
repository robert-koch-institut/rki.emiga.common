Instance: AffectedPerson-maximal // Maximal Example of a Affected Person 
InstanceOf: AffectedPerson
Title: "Beispiel Betroffene Person"
Description: "Ein maximales Beispiel für eine Patientenressource basierend auf dem AffectedPerson-Profil."


* id = "AffectedPerson-maximal" 

// Meta Profile
* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson|1.2.0-alpha.9"

* meta.security[visibility] = $ResourceVisibilityType#inAgency
* meta.security[responsibility] = $ResourceResponsibility#1. "Robert Koch-Institut"


// Identifier 
* identifier[EmigaID].system = "https://emiga.rki.de/fhir/sid/EmigaID"
* identifier[EmigaID].value = "Person-PQRST-123456789"
* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
* identifier[EmigaFileNumber].value = "Person-XYZ-987654321"
* identifier[SurvNetFileNumber].system = "https://emiga.rki.de/fhir/sid/SurvNetFileNumber"
* identifier[SurvNetFileNumber].value = "SURVNET-Person-567890"
* identifier[EmigaID].use = #official
* identifier[EmigaFileNumber].use = #official
* identifier[SurvNetFileNumber].use = #temp

//  name (multiple, with salutation and maiden name)
* name[0].use = #official
* name[0].family = "Müller"
* name[0].given[0] = "Anna"
* name[0].extension[salutation].url = "https://emiga.rki.de/fhir/common/Extension/Salutation"
* name[0].extension[salutation].valueCoding.system = "https://emiga.rki.de/fhir/common/CodeSystem/Salutation"
* name[0].extension[salutation].valueCoding.code = #SehrGeehrteFrau
* name[0].extension[salutation].valueCoding.display = "Sehr geehrte Frau"

* name[1].use = #maiden
* name[1].family = "Schneider"

//  telecom (multiple)
* telecom[Phone].system = #phone
* telecom[Phone].value = "+49891234567"
* telecom[Phone].use = #mobile

* telecom[Email].system = #email
* telecom[Email].value = "anna.mueller@example.de"
* telecom[Email].use = #home

* telecom[Fax].system = #fax
* telecom[Fax].value = "+49891112223"

// Gender with amtlich extension
* gender = #other
* gender.extension[other-amtlich].url = "http://fhir.de/StructureDefinition/gender-amtlich-de"
* gender.extension[other-amtlich].valueCoding.system = "http://fhir.de/CodeSystem/gender-amtlich-de"
* gender.extension[other-amtlich].valueCoding.code = #D
* gender.extension[other-amtlich].valueCoding.display = "divers"

// BirthDate     
* birthDate = "1985-04-12"

// Address with all Must Support extensions
* address[0].line[0].value = "Cherry Tree Lane 1"
// Street and house number
* address[0].line[0].extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[0].line[0].extension[Strasse].valueString = "Cherry Tree Lane"
* address[0].line[0].extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[0].line[0].extension[Hausnummer].valueString = "1"
// Additional address details
* address[0].line[0].extension[Adresszusatz].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator"
* address[0].line[0].extension[Adresszusatz].valueString = "3rd Floor"
// City and postal code
* address[0].city = "München"
* address[0].postalCode = "80331"
// Address use (RKI extension)
* address[0].extension[addressUse].url = "https://demis.rki.de/fhir/StructureDefinition/AddressUse"
* address[0].extension[addressUse].valueCoding.system = "https://demis.rki.de/fhir/CodeSystem/addressUse"
* address[0].extension[addressUse].valueCoding.code = #primary
* address[0].extension[addressUse].valueCoding.display = "Hauptwohnsitz"
// PO Box address (separate from street address per add-6 constraint)
* address[1].line[0].value = "Postfach 123"
* address[1].line[0].extension[Postfach].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-postBox"
* address[1].line[0].extension[Postfach].valueString = "Postfach 123"
* address[1].city = "München"
* address[1].postalCode = "80331"
* address[1].extension[addressUse].url = "https://demis.rki.de/fhir/StructureDefinition/AddressUse"
* address[1].extension[addressUse].valueCoding.system = "https://demis.rki.de/fhir/CodeSystem/addressUse"
* address[1].extension[addressUse].valueCoding.code = #primary
* address[1].extension[addressUse].valueCoding.display = "Hauptwohnsitz"


// Deceased Boolean 
* deceasedBoolean = false

//  link (multiple)

// Link to RelatedPerson
* link[relatedPersonLink].type = #seealso
* link[relatedPersonLink].other.reference = "RelatedPerson/AffectedPersonRelatedPerson-minimal"

// Link to Patient
* link[patientLink].type = #seealso
* link[patientLink].other.reference = "Patient/AffectedPerson-minimal"
* link[1].type = #seealso

// Communication (Sprachkenntnisse)
* communication[+].language.coding.system = "urn:ietf:bcp:47"
* communication[=].language.coding.code = #de
* communication[=].language.coding.display = "Deutsch"

// General Practitioner (Behandelnde Person)
* generalPractitioner[+].reference = "Practitioner/EmigaUser-001"
