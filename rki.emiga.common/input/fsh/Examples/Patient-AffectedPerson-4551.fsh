Instance: AffectedPerson-4551
InstanceOf: AffectedPerson
Title: "Beispiel Betroffene Person"
Description: "Ein Beispielinstanz einer Patient-Ressource basierend auf dem AffectedPerson-Profil."
Usage: #example
* id = "AffectedPerson-4551"


* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson|1.2.0-alpha.16"

* meta.security[visibility] = $ResourceVisibilityType#inAgency "Eigene ÖGD-Stelle"
* meta.security[responsibility] = $ResourceResponsibility#1. "Robert Koch-Institut"

* meta.extension[lastModifiedBy].valueReference.reference = "Practitioner/EmigaUser-001"

//* extension[citizenship].url = "https://emiga.rki.de/fhir/common/Extension/Citizenship"

//* extension[citizenship].valueCoding.system = "http://fhir.de/CodeSystem/deuev/anlage-8-laenderkennzeichen"
//* extension[citizenship].valueCoding.code = #D
//* extension[citizenship].valueCoding.display = "Deutschland"
//* extension[citizenship].valueCoding.version = "8.00"

* extension[citizenship].url = "http://hl7.org/fhir/StructureDefinition/patient-citizenship"
* extension[citizenship].extension[code].valueCodeableConcept.coding.code = #D
* extension[citizenship].extension[code].valueCodeableConcept.coding.system = "http://fhir.de/CodeSystem/deuev/anlage-8-laenderkennzeichen"
* extension[citizenship].extension[code].valueCodeableConcept.coding.display = "Deutschland"
* extension[citizenship].extension[code].valueCodeableConcept.coding.version = "8.00"

* extension[landOfBirth].url = "https://emiga.rki.de/fhir/common/Extension/LandOfBirth"


* extension[landOfBirth].valueCoding.system = "http://fhir.de/CodeSystem/deuev/anlage-8-laenderkennzeichen"
* extension[landOfBirth].valueCoding.code = #YU
* extension[landOfBirth].valueCoding.display = "Jugoslawien"
* extension[landOfBirth].valueCoding.version = "8.00"
* extension[landOfBirth].url = "https://emiga.rki.de/fhir/common/Extension/LandOfBirth"

* extension[processingStatus].url = "https://emiga.rki.de/fhir/common/Extension/ProcessingStatus"
* extension[processingStatus].valueCoding.system = "https://emiga.rki.de/fhir/common/CodeSystem/ProcessingStatus"
* extension[processingStatus].valueCoding.code = #inprogress
* extension[processingStatus].valueCoding.display = "In Bearbeitung"


* identifier[EmigaID].system = "https://emiga.rki.de/fhir/sid/EmigaID"
* identifier[EmigaID].value = "Person-PQRST-123456789"
* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
* identifier[EmigaFileNumber].value = "Person-XYZ-987654321"
//* identifier[SurvNetFileNumber].system = "https://emiga.rki.de/fhir/sid/SurvNetFileNumber"
//* identifier[SurvNetFileNumber].value = "SURVNET-Person-567890"


* name.extension[salutation].url = "https://emiga.rki.de/fhir/common/Extension/Salutation"
* name.extension[salutation].valueCoding.system = "https://emiga.rki.de/fhir/common/CodeSystem/Salutation"
* name.extension[salutation].valueCoding.code = #SehrGeehrteFrau
* name.extension[salutation].valueCoding.display = "Sehr geehrte Frau"

* name[0].use = #official
* name[0].family = "Calamity"
//* name[0].family.extension[nachname].valueString = "Calamity"
* name[0].given = "Jones"

* name[1].use = #maiden
* name[1].family = "Doe"
//* name[1].family.extension[nachname].valueString = "Doe"


* name[2].use = #nickname
* name[2].family = "Calam"
//* name[2].family.extension[nachname].valueString = "Calam"

* telecom[Email].system = #email
* telecom[Email].value = "jones.calamity@example.com"

* telecom[Phone].system = #phone
* telecom[Phone].value = "+493087654321"

* gender = #other
* gender.extension[other-amtlich].url = "http://fhir.de/StructureDefinition/gender-amtlich-de"
* gender.extension[other-amtlich].valueCoding.code = #D
* gender.extension[other-amtlich].valueCoding.system = "http://fhir.de/CodeSystem/gender-amtlich-de"
* gender.extension[other-amtlich].valueCoding.display = "divers"

* birthDate = "1980-01-01"

//* deceasedBoolean = true

//* deceasedDateTime = "2025-04-11T10:00:00+01:00"

* address[0].extension[addressUse].url = "https://demis.rki.de/fhir/StructureDefinition/AddressUse"
* address[0].extension[addressUse].valueCoding.system = "https://demis.rki.de/fhir/CodeSystem/addressUse"
* address[0].extension[addressUse].valueCoding.code = #primary
* address[0].extension[addressUse].valueCoding.display = "Hauptwohnsitz"

/*
* address[0].extension[facilityAssociation].url = "https://emiga.rki.de/fhir/common/Extension/FacilityAddressAffectedPerson"
* address[0].extension[facilityAssociation].extension[facility].url = "facility"
* address[0].extension[facilityAssociation].extension[facility].valueReference.reference = "http://example.org/fhir/Organization/4550"
[0]
* address[0].extension[facilityAssociation].extension[associationType].url = "associationType"
* address[0].extension[facilityAssociation].extension[associationType].valueCodeableConcept.coding.system = "https://emiga.rki.de/fhir/common/CodeSystem/FacilityAssociationType"
* address[0].extension[facilityAssociation].extension[associationType].valueCodeableConcept.coding.code = #caredForIn
* address[0].extension[facilityAssociation].extension[associationType].valueCodeableConcept.coding.display = "Betreut in"
*/
* address[0].extension[geolocation].extension[latitude].valueDecimal = 52.82096
* address[0].extension[geolocation].extension[latitude].url = "latitude"
* address[0].extension[geolocation].extension[longitude].valueDecimal = 1.3791
* address[0].extension[geolocation].extension[longitude].url = "longitude"

* address[0].line[0] = "Blossom Lane 1"
* address[0].line[0].extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[0].line[0].extension[Strasse].valueString = "Blossom Lane"
* address[0].line[0].extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[0].line[0].extension[Hausnummer].valueString = "1"

* address[0].postalCode = "12345"
* address[0].city = "Berminghausen"
* address[0].state = "DE-BE"
* address[0].country = "DE"

* communication[0].language.coding.system = "urn:ietf:bcp:47"
* communication[0].language.coding.code = #de
* communication[0].language.coding.display = "Deutsch"

* generalPractitioner[0].reference = "Practitioner/4550"

* link[relatedPersonLink].other.reference = "RelatedPerson/AffectedPersonRelatedPerson-4551"
* link[relatedPersonLink].type = #seealso