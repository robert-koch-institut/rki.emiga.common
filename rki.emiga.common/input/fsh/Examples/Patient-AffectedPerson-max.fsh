Instance: AffectedPerson-maximal // Maximal Example of a Affected Person 
InstanceOf: AffectedPerson
Title: "Beispiel Betroffene Person"
Description: "Ein maximales Beispiel für eine Patientenressource basierend auf dem AffectedPerson-Profil."


* id = "AffectedPerson-maximal" 

// Meta Profile
* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson|1.2.0-alpha.9"

* meta.security[visibility] = $ResourceVisibilityType#internal
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
* name[1].given[0] = "Anna"

//  telecom (multiple)
* telecom[Phone].system = #phone
* telecom[Phone].value = "+49-89-1234567"
* telecom[Phone].use = #mobile

* telecom[Email].system = #email
* telecom[Email].value = "anna.mueller@example.de"
* telecom[Email].use = #home

* telecom[Fax].system = #fax
* telecom[Fax].value = "+49-89-1112223"

// Gender with amtlich extension
* gender = #female
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

* address[0].line[0].extension[Postfach].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-postBox"
* address[0].line[0].extension[Postfach].valueString = "Postfach 123"

// City and postal code
* address[0].city = "München"
* address[0].postalCode = "80331"

// Address use (RKI extension)
* address[0].extension[addressUse].url = "https://demis.rki.de/fhir/StructureDefinition/AddressUse"
* address[0].extension[addressUse].valueCoding.system = "https://demis.rki.de/fhir/CodeSystem/addressUse"
* address[0].extension[addressUse].valueCoding.code = #primary
* address[0].extension[addressUse].valueCoding.display = "Hauptwohnsitz"


// Deceased Boolean 
* deceasedBoolean = false

//  link (multiple)
// Required slices (use named paths)
* link[patientLink].other.reference = "Patient/AffectedPerson-maximal"
* link[patientLink].type = #seealso

* link[relatedPersonLink].other.reference = "RelatedPerson/AffectedPersonRelatedPerson-maximal"
* link[relatedPersonLink].type = #seealso

// Additional link entries (unsliced)
* link[0].other.reference = "Patient/AP-002"
* link[0].type = #seealso

* link[1].other.reference = "Patient/AP-003"
* link[1].type = #replaces


* link[relatedPersonLink].type = #seealso
* link[relatedPersonLink].other.reference = "RelatedPerson/AffectedPersonRelatedPerson-maximal"

* link[patientLink].type = #seealso
* link[patientLink].other.reference = "Patient/AffectedPerson-maximal"

// Communication (Sprachkenntnisse)
* communication[+].language.coding.system = "urn:ietf:bcp:47"
* communication[=].language.coding.code = #de
* communication[=].language.coding.display = "Deutsch"

// General Practitioner (Behandelnde Person)
* generalPractitioner[+].reference = "Practitioner/Dr-Schmidt"
