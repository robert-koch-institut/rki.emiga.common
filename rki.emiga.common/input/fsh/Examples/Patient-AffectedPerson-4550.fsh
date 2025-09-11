Instance: AffectedPerson-4550
InstanceOf: AffectedPerson
Title: "Beispiel Betroffene Person"
Description: "Ein Beispielinstanz einer Patient-Ressource basierend auf dem AffectedPerson-Profil."
Usage: #example
* id = "AffectedPerson-4550"


* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson|1.2.0-alpha.9"

* meta.security[visibility] = $ResourceVisibilityType#internal
* meta.security[responsibility] = $ResourceResponsibility#1. "Robert Koch-Institut"

* extension[citizenship].url = "https://emiga.rki.de/fhir/common/Extension/Citizenship"

* extension[citizenship].valueCoding.system = "http://fhir.de/CodeSystem/deuev/anlage-8-laenderkennzeichen"
* extension[citizenship].valueCoding.code = #D
* extension[citizenship].valueCoding.display = "Deutschland"
* extension[citizenship].valueCoding.version = "8.00"
* extension[landOfBirth].url = "https://emiga.rki.de/fhir/common/Extension/LandOfBirth"


* extension[landOfBirth].valueCoding.system = "http://fhir.de/CodeSystem/deuev/anlage-8-laenderkennzeichen"
* extension[landOfBirth].valueCoding.code = #YU
* extension[landOfBirth].valueCoding.display = "Jugoslawien"
* extension[landOfBirth].valueCoding.version = "8.00"
* extension[landOfBirth].url = "https://emiga.rki.de/fhir/common/Extension/LandOfBirth"

* identifier[referencenumberpatientid].system = "https://emiga.rki.de/fhir/common/sid/ReferenceNumberPatientId"
* identifier[referencenumberpatientid].value = "123456789"
* identifier[filenumberpatientid].system = "https://emiga.rki.de/fhir/common/sid/FileNumberPatientId"
* identifier[filenumberpatientid].value = "987654321"

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

* address.extension[addressUse].url = "https://demis.rki.de/fhir/StructureDefinition/AddressUse"
* address.extension[addressUse].valueCoding.system = "https://demis.rki.de/fhir/CodeSystem/addressUse"
* address.extension[addressUse].valueCoding.code = #primary

* address.extension[facilityAssociation].url = "https://emiga.rki.de/fhir/common/Extension/FacilityAddressAffectedPerson"
* address.extension[facilityAssociation].extension[facility].url = "facility"
* address.extension[facilityAssociation].extension[facility].valueReference.reference = "http://example.org/fhir/Organization/4550"

* address.extension[facilityAssociation].extension[associationType].url = "associationType"
* address.extension[facilityAssociation].extension[associationType].valueCodeableConcept.coding.system = "https://emiga.rki.de/fhir/CodeSystem/FacilityAssociationType"
* address.extension[facilityAssociation].extension[associationType].valueCodeableConcept.coding.code = #caredForIn
* address.extension[facilityAssociation].extension[associationType].valueCodeableConcept.coding.display = "Betreut in"


* address.line[0].value = "Cherry Tree Lane 1"
* address.line[0].extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line[0].extension[Strasse].valueString = "Cherry Tree Lane"
* address.line[0].extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line[0].extension[Hausnummer].valueString = "1"

* address.postalCode = "12345"
* address.city = "Berminghausen"
* address.country = "DE"

* communication[0].language.coding.system = "urn:ietf:bcp:47"
* communication[0].language.coding.code = #de
* communication[0].language.coding.display = "Deutsch"

* generalPractitioner[0].reference = "Practitioner/4550"