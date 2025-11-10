Instance: AffectedPerson-4550
InstanceOf: AffectedPerson
Title: "Beispiel Betroffene Person"
Description: "Ein Beispielinstanz einer Patient-Ressource basierend auf dem AffectedPerson-Profil."
Usage: #example
* id = "AffectedPerson-4550"


* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson|1.2.0-alpha.11"

* meta.security[visibility] = $ResourceVisibilityType#inAgency "Eigene ÖGD-Stelle"
* meta.security[responsibility] = $ResourceResponsibility#1. "Robert Koch-Institut"



//* extension[citizenship].url = "https://emiga.rki.de/fhir/common/Extension/Citizenship"

//* extension[citizenship].valueCoding.system = "http://fhir.de/CodeSystem/deuev/anlage-8-laenderkennzeichen"
//* extension[citizenship].valueCoding.code = #D
//* extension[citizenship].valueCoding.display = "Deutschland"
//* extension[citizenship].valueCoding.version = "8.00"

* extension[landOfBirth].url = "https://emiga.rki.de/fhir/common/Extension/LandOfBirth"

* extension[citizenship].url = "http://hl7.org/fhir/StructureDefinition/patient-citizenship"
* extension[citizenship].extension[code].valueCodeableConcept.coding.code = #D
* extension[citizenship].extension[code].valueCodeableConcept.coding.system = "http://fhir.de/CodeSystem/deuev/anlage-8-laenderkennzeichen"
* extension[citizenship].extension[code].valueCodeableConcept.coding.display = "Deutschland"
* extension[citizenship].extension[code].valueCodeableConcept.coding.version = "8.00"


* extension[landOfBirth].valueCoding.system = "http://fhir.de/CodeSystem/deuev/anlage-8-laenderkennzeichen"
* extension[landOfBirth].valueCoding.code = #YU
* extension[landOfBirth].valueCoding.display = "Jugoslawien"
* extension[landOfBirth].valueCoding.version = "8.00"
* extension[landOfBirth].url = "https://emiga.rki.de/fhir/common/Extension/LandOfBirth"

* extension[processingStatus].url = "https://emiga.rki.de/fhir/common/Extension/ProcessingStatusAffectedPerson"
* extension[processingStatus].valueCoding.system = "https://emiga.rki.de/fhir/common/CodeSystem/ProcessingStatus"
* extension[processingStatus].valueCoding.code = #inprogress
* extension[processingStatus].valueCoding.display = "in Bearbeitung"


* identifier[EmigaID].system = "https://emiga.rki.de/fhir/sid/EmigaID"
* identifier[EmigaID].value = "Person-DEFG-123456789"
* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
* identifier[EmigaFileNumber].value = "Person-ABCD-987654321"
* identifier[SurvNetFileNumber].system = "https://emiga.rki.de/fhir/sid/SurvNetFileNumber"
* identifier[SurvNetFileNumber].value = "SURVNET-Person-654321"


* name.extension[salutation].url = "https://emiga.rki.de/fhir/common/Extension/Salutation"
* name.extension[salutation].valueCoding.system = "https://emiga.rki.de/fhir/common/CodeSystem/Salutation"
* name.extension[salutation].valueCoding.code = #SehrGeehrteFrau
* name.extension[salutation].valueCoding.display = "Sehr geehrte Frau"

* name[0].use = #official
* name[0].family = "Poppins"
//* name[0].family.extension[nachname].valueString = "Poppins"
* name[0].given = "Mary"

* name[1].use = #maiden
* name[1].family = "Smith"
//* name[1].family.extension[nachname].valueString = "Smith"


* name[2].use = #nickname
* name[2].family = "Popp"
//* name[2].family.extension[nachname].valueString = "Popp"

* telecom[Email].system = #email
* telecom[Email].value = "mary.poppins@example.com"

* telecom[Phone].system = #phone
* telecom[Phone].value = "+49301234567"

* gender = #other
* gender.extension[other-amtlich].url = "http://fhir.de/StructureDefinition/gender-amtlich-de"
* gender.extension[other-amtlich].valueCoding.code = #D
* gender.extension[other-amtlich].valueCoding.system = "http://fhir.de/CodeSystem/gender-amtlich-de"
* gender.extension[other-amtlich].valueCoding.display = "divers"

* birthDate = "1980-01-01"

//* deceasedBoolean = true

* deceasedDateTime = "2025-04-11T10:00:00+01:00"

* address[0].extension[addressUse].url = "https://demis.rki.de/fhir/StructureDefinition/AddressUse"
* address[0].extension[addressUse].valueCoding.system = "https://demis.rki.de/fhir/CodeSystem/addressUse"
* address[0].extension[addressUse].valueCoding.code = #primary
* address[0].extension[addressUse].valueCoding.display = "Hauptwohnsitz"

/*
* address[0].extension[facilityAssociation].url = "https://emiga.rki.de/fhir/common/Extension/FacilityAddressAffectedPerson"
* address[0].extension[facilityAssociation].extension[facility].url = "facility"
* address[0].extension[facilityAssociation].extension[facility].valueReference.reference = "http://example.org/fhir/Organization/4550"

* address[0].extension[facilityAssociation].extension[associationType].url = "associationType"
* address[0].extension[facilityAssociation].extension[associationType].valueCodeableConcept.coding.system = "https://emiga.rki.de/fhir/common/CodeSystem/FacilityAssociationType"
* address[0].extension[facilityAssociation].extension[associationType].valueCodeableConcept.coding.code = #caredForIn
* address[0].extension[facilityAssociation].extension[associationType].valueCodeableConcept.coding.display = "Betreut in"
*/
* address[0].extension[geolocation].extension[latitude].valueDecimal = 52.82096
* address[0].extension[geolocation].extension[latitude].url = "latitude"
* address[0].extension[geolocation].extension[longitude].valueDecimal = 1.3791
* address[0].extension[geolocation].extension[longitude].url = "longitude"

* address[0].line = "Cherry Tree Lane 1"
//Zu klären, ob die Extensions auf line[0] oder line insgesamt gesetzt werden sollen
/*
* address[0].line[0].extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[0].line[0].extension[Strasse].valueString = "Cherry Tree Lane"
* address[0].line[0].extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[0].line[0].extension[Hausnummer].valueString = "1"
*/

* address[0].postalCode = "12345"
* address[0].city = "Berminghausen"
* address[0].state = "DE-BE"
* address[0].country = "DE"



* address[1].extension[addressUse].url = "https://demis.rki.de/fhir/StructureDefinition/AddressUse"
* address[1].extension[addressUse].valueCoding.system = "https://demis.rki.de/fhir/CodeSystem/addressUse"
* address[1].extension[addressUse].valueCoding.code = #current
* address[1].extension[addressUse].valueCoding.display = "Derzeitiger Aufenthaltsort"
* address[1].extension[facilityAssociation].url = "https://emiga.rki.de/fhir/common/Extension/FacilityAddressAffectedPerson"
* address[1].extension[facilityAssociation].extension[facility].url = "facility"
* address[1].extension[facilityAssociation].extension[facility].valueReference.reference = "http://example.org/fhir/Organization/4550"
* address[1].extension[facilityAssociation].extension[associationType].url = "associationType"
* address[1].extension[facilityAssociation].extension[associationType].valueCodeableConcept.coding.system = "https://demis.rki.de/fhir/CodeSystem/organizationAssociation"
* address[1].extension[facilityAssociation].extension[associationType].valueCodeableConcept.coding.code = #care
* address[1].extension[facilityAssociation].extension[associationType].valueCodeableConcept.coding.display = "Betreuung"
* address[1].extension[geolocation].extension[latitude].valueDecimal = 52.82096
* address[1].extension[geolocation].extension[latitude].url = "latitude"
* address[1].extension[geolocation].extension[longitude].valueDecimal = 1.3791
* address[1].extension[geolocation].extension[longitude].url = "longitude"

* address[1].line[0].value = "Blossom Hill 2"
* address[1].line[0].extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[1].line[0].extension[Strasse].valueString = "Blossom Hill"
* address[1].line[0].extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[1].line[0].extension[Hausnummer].valueString = "2"

* address[1].postalCode = "54321"
* address[1].city = "Blumenland"
* address[1].country = "DE"

* communication[0].language.coding.system = "urn:ietf:bcp:47"
* communication[0].language.coding.code = #de
* communication[0].language.coding.display = "Deutsch"

* generalPractitioner[0].reference = "Practitioner/4550"