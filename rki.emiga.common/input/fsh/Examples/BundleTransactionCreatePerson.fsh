Instance: TransactionBundleCreatePerson
InstanceOf: EMIGAPersonenTransactionBundle
Usage: #example

* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/EMIGAPersonenTransactionBundle|1.2.0-alpha.9"
* identifier.system = "https://emiga.rki.de/fhir/common/sid/EMIGAPersonenTransactionBundleId"
* identifier.value = "d317ce08-1da0-48d4-8dd7-8edbe88d51f4"
* type = #transaction
* timestamp = "2025-07-03T09:28:36.132+01:00"

* entry[0].fullUrl = "urn:uuid:d8140036-d5b5-461a-9a6e-adfb8a87039c"
//* entry[0].fullUrl = "Patient/AffectedPerson-Tochter-1"
* entry[0].resource = AffectedPerson-Tochter-1
* entry[0].request.method = #POST
* entry[0].request.url = "Patient"

* entry[1].fullUrl = "urn:uuid:7faa8330-db99-4a0e-a61b-91a26ef4d8df"
//* entry[1].fullUrl = "Patient/AffectedPerson-Mutter-1"
* entry[1].resource = AffectedPerson-Mutter-1
* entry[1].request.method = #POST
* entry[1].request.url = "Patient"

* entry[2].fullUrl = "urn:uuid:2bc89b69-41f7-4037-8298-94dc6ac03479"
//* entry[2].fullUrl = "RelatedPerson/RelatedPerson-Mutter-1"
* entry[2].resource = RelatedPerson-Mutter-1
* entry[2].request.method = #POST
* entry[2].request.url = "RelatedPerson"





Instance: AffectedPerson-Tochter-1
InstanceOf: AffectedPerson
Title: "Beispiel Betroffene Person"
Description: "Ein Beispielinstanz einer Patient-Ressource basierend auf dem AffectedPerson-Profil."
Usage: #inline

* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson|1.2.0-alpha.9"

* meta.security[visibility] = $ResourceVisibilityType#internal
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


* name.extension[salutation].url = "https://emiga.rki.de/fhir/common/Extension/Salutation"
* name.extension[salutation].valueCoding.system = "https://emiga.rki.de/fhir/common/CodeSystem/Salutation"
* name.extension[salutation].valueCoding.code = #SehrGeehrteFrau
* name.extension[salutation].valueCoding.display = "Sehr geehrte Frau"

* name[0].use = #official
* name[0].family.value = "Poppins"
* name[0].family.extension[nachname].valueString = "Poppins"
* name[0].given.value = "Mary"

* name[1].use = #maiden
* name[1].family.value = "Smith"
* name[1].family.extension[nachname].valueString = "Smith"


* name[2].use = #nickname
* name[2].family.value = "Popp"
* name[2].family.extension[nachname].valueString = "Popp"

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

* address[0].line[0].value = "Cherry Tree Lane 1"
* address[0].line[0].extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[0].line[0].extension[Strasse].valueString = "Cherry Tree Lane"
* address[0].line[0].extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[0].line[0].extension[Hausnummer].valueString = "1"

* address[0].postalCode = "12345"
* address[0].city = "Berminghausen"
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

//* generalPractitioner[0].reference = "Practitioner/4550"

Instance: AffectedPerson-Mutter-1
InstanceOf: AffectedPerson
Title: "Beispiel Betroffene Person"
Description: "Ein Beispielinstanz einer Patient-Ressource basierend auf dem AffectedPerson-Profil."
Usage: #inline


* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson|1.2.0-alpha.9"

* meta.security[visibility] = $ResourceVisibilityType#internal
* meta.security[responsibility] = $ResourceResponsibility#1. "Robert Koch-Institut"

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

* extension[processingStatus].url = "https://emiga.rki.de/fhir/common/Extension/ProcessingStatusAffectedPerson"
* extension[processingStatus].valueCoding.system = "https://emiga.rki.de/fhir/common/CodeSystem/ProcessingStatus"
* extension[processingStatus].valueCoding.code = #inprogress
* extension[processingStatus].valueCoding.display = "in Bearbeitung"


* identifier[EmigaID].system = "https://emiga.rki.de/fhir/sid/EmigaID"
* identifier[EmigaID].value = "Person-PQRST-123456789"
* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
* identifier[EmigaFileNumber].value = "Person-XYZ-987654321"


* name.extension[salutation].url = "https://emiga.rki.de/fhir/common/Extension/Salutation"
* name.extension[salutation].valueCoding.system = "https://emiga.rki.de/fhir/common/CodeSystem/Salutation"
* name.extension[salutation].valueCoding.code = #SehrGeehrteFrau
* name.extension[salutation].valueCoding.display = "Sehr geehrte Frau"

* name[0].use = #official
* name[0].family.value = "Calamity"
* name[0].family.extension[nachname].valueString = "Calamity"
* name[0].given.value = "Jones"

* name[1].use = #maiden
* name[1].family.value = "Doe"
* name[1].family.extension[nachname].valueString = "Doe"


* name[2].use = #nickname
* name[2].family.value = "Calam"
* name[2].family.extension[nachname].valueString = "Calam"

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

* address[0].line[0].value = "Cherry Tree Lane 1"
* address[0].line[0].extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[0].line[0].extension[Strasse].valueString = "Cherry Tree Lane"
* address[0].line[0].extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[0].line[0].extension[Hausnummer].valueString = "1"

* address[0].postalCode = "12345"
* address[0].city = "Berminghausen"
* address[0].country = "DE"

* communication[0].language.coding.system = "urn:ietf:bcp:47"
* communication[0].language.coding.code = #de
* communication[0].language.coding.display = "Deutsch"

//* generalPractitioner[0].reference = "Practitioner/4550"

* link[relatedPersonLink].other.reference = "urn:uuid:2bc89b69-41f7-4037-8298-94dc6ac03479" // RelatedPerson-Mutter-1
//* link[0].other.reference = "Patient/AffectedPerson-Tochter-1"
* link[relatedPersonLink].type = #seealso

Instance: RelatedPerson-Mutter-1
InstanceOf: AffectedPersonRelatedPerson
Title: "Beispiel Bezugsperson der betroffenen Person"
Description: "Ein Beispielinstanz einer Bezugsperson-Ressource. "
Usage: #inline

* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPersonRelatedPerson|1.2.0-alpha.9"

* meta.security[visibility] = $ResourceVisibilityType#internal
* meta.security[responsibility] = $ResourceResponsibility#1. "Robert Koch-Institut"

* identifier[EmigaID].system = "https://emiga.rki.de/fhir/sid/EmigaID"
* identifier[EmigaID].value = "Bezugsperson-PQRST-123456789"
* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
* identifier[EmigaFileNumber].value = "Bezugsperson-XYZ-987654321"

//* extension[linkToRepresentedPerson].url = "https://emiga.rki.de/fhir/common/Extension/RelatedPersonLink"
//* extension[linkToRepresentedPerson].valueReference.reference = "urn:uuid:7faa8330-db99-4a0e-a61b-91a26ef4d8df" // AffectedPerson-Mutter-1

* patient = Reference(urn:uuid:d8140036-d5b5-461a-9a6e-adfb8a87039c) // AffectedPerson-Tochter-1
* relationship[0].coding.system = "https://emiga.rki.de/fhir/common/CodeSystem/RelatedPersonRelationshipType"
* relationship[0].coding.code = #legalGuardian
* relationship[0].coding.display = "rechtlicher Betreuer"

