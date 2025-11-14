Instance: AffectedPerson-minimal // Minimal Example of a Affected Person 
InstanceOf: AffectedPerson
Title: "Beispiel Betroffene Person"
Description: "Ein minimales Beispiel für eine Patientenressource basierend auf dem AffectedPerson-Profil." //Contains only mandatory 1..1 Elements
Usage: #example

* id = "AffectedPerson-minimal"


// Meta Profile
* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson|1.2.0-alpha.9"

* meta.security[visibility] = $ResourceVisibilityType#internal
* meta.security[responsibility] = $ResourceResponsibility#1. "Robert Koch-Institut"


// Citizenship (must include coding.system + coding.code)
* extension[citizenship].url = "http://hl7.org/fhir/StructureDefinition/patient-citizenship"
* extension[citizenship].extension[code].valueCodeableConcept.coding.system = "http://fhir.de/CodeSystem/deuev/anlage-8-laenderkennzeichen"
* extension[citizenship].extension[code].valueCodeableConcept.coding.code = #D

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

// Name (with salutation)
* name[0].use = #official
* name[0].family = "Müller"
* name[0].given[0] = "Anna"
* name[0].extension[salutation].url = "https://emiga.rki.de/fhir/common/Extension/Salutation"
* name[0].extension[salutation].valueCoding.system = "https://emiga.rki.de/fhir/common/CodeSystem/Salutation"
* name[0].extension[salutation].valueCoding.code = #SehrGeehrteFrau
* name[0].extension[salutation].valueCoding.display = "Sehr geehrte Frau"

// Telecom
* telecom[Email].system = #email
* telecom[Email].value = "anna.mueller@example.com"
* telecom[Phone].system = #phone
* telecom[Phone].value = "+49301234567"

// Address with extensions
* address[0].line[0].value = "Cherry Tree Lane 1"
* address[0].line[0].extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[0].line[0].extension[Strasse].valueString = "Cherry Tree Lane"
* address[0].line[0].extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[0].line[0].extension[Hausnummer].valueString = "1"
* address[0].city = "München"
* address[0].postalCode = "80331"

// Deceased Status
* deceasedBoolean = false
 
// Link to RelatedPerson (mandatory type + other reference)
* link[relatedPersonLink].type = #seealso
* link[relatedPersonLink].other.reference = "RelatedPerson/AffectedPersonRelatedPerson-minimal"

// Link to Patient (mandatory type + other reference)
* link[patientLink].type = #seealso
* link[patientLink].other.reference = "Patient/AffectedPerson-minimal"
