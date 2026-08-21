Instance: PersonBundle
InstanceOf: AffectedPersonBundle
Usage: #example
Title: "Personen Bundle"
//Description: "Example bundle containing an affected person and their related person"
* type = #collection
* entry[0].resource = AffectedPerson-Tochter
* entry[0].fullUrl = "https://emiga.rki.de/fhir/common/Patient/AffectedPerson-Tochter"
* entry[1].resource = AffectedPerson-Mutter
* entry[1].fullUrl = "https://emiga.rki.de/fhir/common/Patient/AffectedPerson-Mutter"
* entry[2].resource = RelatedPerson-Mutter
* entry[2].fullUrl = "https://emiga.rki.de/fhir/common/RelatedPerson/RelatedPerson-Mutter"



Instance: AffectedPerson-Tochter
InstanceOf: AffectedPerson
Title: "Beispiel Betroffene Person"
Description: "Ein Beispielinstanz einer Patient-Ressource basierend auf dem AffectedPerson-Profil."
Usage: #inline
* id = "AffectedPerson-Tochter"


* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson|1.2.0-alpha.11"

* meta.security[visibility].system = $ResourceVisibilityType
* meta.security[visibility].code = #inAgency
* meta.security[visibility].display =  "Eigene ÖGD-Stelle"
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
* identifier[EmigaID].value = "Person-XYZ-123456789"
* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
* identifier[EmigaFileNumber].value = "Person-QRST-987654321"

* name.extension[salutation].url = "https://emiga.rki.de/fhir/common/Extension/Salutation"
* name.extension[salutation].valueCoding.system = "https://emiga.rki.de/fhir/common/CodeSystem/Salutation"
* name.extension[salutation].valueCoding.code = #SehrGeehrteFrau
* name.extension[salutation].valueCoding.display = "Sehr geehrte Frau"

* name[0].use = #official
* name[0].family = "Jones"
//* name[0].family.extension[nachname].valueString = "Poppins"
* name[0].given = "Ada"

* name[1].use = #maiden
* name[1].family = "Wayne"
//* name[1].family.extension[nachname].valueString = "Smith"


* name[2].use = #nickname
* name[2].family = "Jon"
//* name[2].family.extension[nachname].valueString = "Popp"

* telecom[Email].system = #email
* telecom[Email].value = "ada.jones@example.com"

* telecom[Phone].system = #phone
* telecom[Phone].value = "+49309876543321"

* gender = #other
* gender.extension[other-amtlich].url = "http://fhir.de/StructureDefinition/gender-amtlich-de"
* gender.extension[other-amtlich].valueCoding.code = #D
* gender.extension[other-amtlich].valueCoding.system = "http://fhir.de/CodeSystem/gender-amtlich-de"
* gender.extension[other-amtlich].valueCoding.display = "divers"

* birthDate = "1981-01-01"

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

* address[0].line = "Palm Tree Avenue 1"
//Zu klären, ob die Extensions auf line[0] oder line insgesamt gesetzt werden sollen

* address[0].line[0].extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[0].line[0].extension[Strasse].valueString = "Palm Tree Avenue"
* address[0].line[0].extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[0].line[0].extension[Hausnummer].valueString = "1"


* address[0].postalCode = "12345"
* address[0].city = "Palmstadt"
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

* address[1].line[0].value = "Coconut Street 2"
* address[1].line[0].extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[1].line[0].extension[Strasse].valueString = "Coconut Street"
* address[1].line[0].extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[1].line[0].extension[Hausnummer].valueString = "2"

* address[1].postalCode = "54321"
* address[1].city = "Coconutville"
* address[1].country = "DE"

* communication[0].language.coding.system = "urn:ietf:bcp:47"
* communication[0].language.coding.code = #de
* communication[0].language.coding.display = "Deutsch"

//* generalPractitioner[0].reference = "Practitioner/4550"

Instance: AffectedPerson-Mutter
InstanceOf: AffectedPerson
Title: "Beispiel Betroffene Person"
Description: "Ein Beispielinstanz einer Patient-Ressource basierend auf dem AffectedPerson-Profil."
Usage: #inline
* id = "AffectedPerson-Mutter"


* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson|1.2.0-alpha.11"

* meta.security[visibility].system = $ResourceVisibilityType
* meta.security[visibility].code = #inAgency 
* meta.security[visibility].display =  "Eigene ÖGD-Stelle"
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
* identifier[SurvNetFileNumber].system = "https://emiga.rki.de/fhir/sid/SurvNetFileNumber"
* identifier[SurvNetFileNumber].value = "SURVNET-Person-567890"


* name.extension[salutation].url = "https://emiga.rki.de/fhir/common/Extension/Salutation"
* name.extension[salutation].valueCoding.system = "https://emiga.rki.de/fhir/common/CodeSystem/Salutation"
* name.extension[salutation].valueCoding.code = #SehrGeehrteFrau
* name.extension[salutation].valueCoding.display = "Sehr geehrte Frau"

* name[0].use = #official
* name[0].family = "Tara"
//* name[0].family.extension[nachname].valueString = "Calamity"
* name[0].given = "Wayne"

* name[1].use = #maiden
* name[1].family = "Doe"
//* name[1].family.extension[nachname].valueString = "Doe"


* name[2].use = #nickname
* name[2].family = "Tar"
//* name[2].family.extension[nachname].valueString = "Calam"

* telecom[Email].system = #email
* telecom[Email].value = "wayne.tara@example.com"

* telecom[Phone].system = #phone
* telecom[Phone].value = "+493087654321"

* gender = #other
* gender.extension[other-amtlich].url = "http://fhir.de/StructureDefinition/gender-amtlich-de"
* gender.extension[other-amtlich].valueCoding.code = #D
* gender.extension[other-amtlich].valueCoding.system = "http://fhir.de/CodeSystem/gender-amtlich-de"
* gender.extension[other-amtlich].valueCoding.display = "divers"

* birthDate = "1983-01-01"

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

* address[0].line[0] = "Pine Street 1"
* address[0].line[0].extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[0].line[0].extension[Strasse].valueString = "Pine Street"
* address[0].line[0].extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[0].line[0].extension[Hausnummer].valueString = "1"

* address[0].postalCode = "12345"
* address[0].city = "Palmstadt"
* address[0].state = "DE-BE"
* address[0].country = "DE"

* communication[0].language.coding.system = "urn:ietf:bcp:47"
* communication[0].language.coding.code = #de
* communication[0].language.coding.display = "Deutsch"

//* generalPractitioner[0].reference = "Practitioner/4550"

* link[relatedPersonLink].other.reference = "RelatedPerson/RelatedPerson-Mutter"
* link[relatedPersonLink].type = #seealso

Instance: RelatedPerson-Mutter
InstanceOf: AffectedPersonRelatedPerson
Title: "Beispiel Bezugsperson der betroffenen Person"
Description: "Ein Beispielinstanz einer Bezugsperson-Ressource. "
Usage: #inline
* id = "RelatedPerson-Mutter"
* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPersonRelatedPerson|1.2.0-alpha.11"

* meta.security[visibility].system = $ResourceVisibilityType
* meta.security[visibility].code = #inAgency 
* meta.security[visibility].display =  "Eigene ÖGD-Stelle"
* meta.security[responsibility] = $ResourceResponsibility#1. "Robert Koch-Institut"

* identifier[EmigaID].system = "https://emiga.rki.de/fhir/sid/EmigaID"
* identifier[EmigaID].value = "Bezugsperson-ADCDEF-123456789"
* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
* identifier[EmigaFileNumber].value = "Bezugsperson-DEFG-987654321"

//* extension[linkToRepresentedPerson].url = "https://emiga.rki.de/fhir/common/Extension/RelatedPersonLink"
//* extension[linkToRepresentedPerson].valueReference.reference = "AffectedPerson-4551"
//* extension[linkToRepresentedPerson].valueReference.identifier.system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
//* extension[linkToRepresentedPerson].valueReference.identifier.value = "Person-XYZ-987654321"
//* extension[linkToRepresentedPerson].valueReference.display = "Jones Calamity"

* patient = Reference(AffectedPerson-Tochter)
* relationship[0].coding.system = "https://emiga.rki.de/fhir/common/CodeSystem/RelatedPersonRelationshipType"
* relationship[0].coding.code = #legalGuardian
* relationship[0].coding.display = "Sorgeberechtigte Person"

* relationship[1].coding.system = "https://emiga.rki.de/fhir/common/CodeSystem/RelatedPersonRelationshipType"
* relationship[1].coding.code = #linkedPerson
* relationship[1].coding.display = "verknüpfte Person"