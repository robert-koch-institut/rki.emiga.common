Instance: ExamplePatientMatchOutputBundle
InstanceOf: MatchOutputBundle
Usage: #example
Title: "Example Patient Match Output Bundle"


* meta.profile[+] = $MatchOutputBundle
* type = #searchset
* link[0].relation = "self"
* link[0].url = "https://emiga.rki.de/fhir/Patient/$match"
* total = 2


// -----------------------------------------------------------------------------
// First duplicate candidate
// -----------------------------------------------------------------------------

* entry[0].fullUrl = "urn:uuid:11111111-1111-1111-1111-111111111111"
* entry[0].resource = ExampleDuplicateCandidatePatientOne
* entry[0].search.mode = #match
* entry[0].search.score = 0.92

// Standard FHIR match-grade extension
* entry[0].search.extension[0].url = $MatchGrade
* entry[0].search.extension[0].valueCode = #probable

// Custom EMIGA duplicate match metadata extension
* entry[0].search.extension[1].url = $DuplicateMatchMetadata

* entry[0].search.extension[1].extension[0].url = "matchScore"
* entry[0].search.extension[1].extension[0].valueDecimal = 2.5

* entry[0].search.extension[1].extension[1].url = "algorithm"
* entry[0].search.extension[1].extension[1].valueString = "person-duplicate"

* entry[0].search.extension[1].extension[2].url = "algorithmVersion"
* entry[0].search.extension[1].extension[2].valueString = "v1"

* entry[0].search.extension[1].extension[3].url = "triggerReason"
* entry[0].search.extension[1].extension[3].valueCoding = $DuplicateMatchTriggerReasonsCS#main-criteria "Hauptkriterium"
* entry[0].search.extension[1].extension[3].valueCoding.version = "0.1.0"

* entry[0].search.extension[1].extension[4].url = "matchedCriteria"
* entry[0].search.extension[1].extension[4].valueCoding = $DuplicateMatchCriteriaCS#birthDateExact "Geburtsdatum exakt übereinstimmend"
* entry[0].search.extension[1].extension[4].valueCoding.version = "0.1.0"

* entry[0].search.extension[1].extension[5].url = "matchedCriteria"
* entry[0].search.extension[1].extension[5].valueCoding = $DuplicateMatchCriteriaCS#firstNameFuzzy "Vorname ungefähr übereinstimmend (fuzzy)"
* entry[0].search.extension[1].extension[5].valueCoding.version = "0.1.0"

* entry[0].search.extension[1].extension[6].url = "matchedCriteria"
* entry[0].search.extension[1].extension[6].valueCoding = $DuplicateMatchCriteriaCS#familyNameFuzzy "Familienname ungefähr übereinstimmend (fuzzy)"
* entry[0].search.extension[1].extension[6].valueCoding.version = "0.1.0"

* entry[0].search.extension[1].extension[7].url = "nonMatchedCriteria"
* entry[0].search.extension[1].extension[7].valueCoding = $DuplicateMatchCriteriaCS#cityPhonetic "Stadt phonetisch übereinstimmend"
* entry[0].search.extension[1].extension[7].valueCoding.version = "0.1.0"


// -----------------------------------------------------------------------------
// Second duplicate candidate
// -----------------------------------------------------------------------------

* entry[1].fullUrl = "urn:uuid:22222222-2222-2222-2222-222222222222"
* entry[1].resource = ExampleDuplicateCandidatePatientTwo
* entry[1].search.mode = #match
* entry[1].search.score = 0.74

// Standard FHIR match-grade extension
* entry[1].search.extension[0].url = $MatchGrade
* entry[1].search.extension[0].valueCode = #possible

// Custom EMIGA duplicate match metadata extension
* entry[1].search.extension[1].url = $DuplicateMatchMetadata

* entry[1].search.extension[1].extension[0].url = "matchScore"
* entry[1].search.extension[1].extension[0].valueDecimal = 1.8

* entry[1].search.extension[1].extension[1].url = "algorithm"
* entry[1].search.extension[1].extension[1].valueString = "person-duplicate"

* entry[1].search.extension[1].extension[2].url = "algorithmVersion"
* entry[1].search.extension[1].extension[2].valueString = "v1"

* entry[1].search.extension[1].extension[3].url = "triggerReason"
* entry[1].search.extension[1].extension[3].valueCoding = $DuplicateMatchTriggerReasonsCS#address-fallback "Adress-Fallback"
* entry[1].search.extension[1].extension[3].valueCoding.version = "0.1.0"

* entry[1].search.extension[1].extension[4].url = "matchedCriteria"
* entry[1].search.extension[1].extension[4].valueCoding = $DuplicateMatchCriteriaCS#birthDateExact "Geburtsdatum exakt übereinstimmend"
* entry[1].search.extension[1].extension[4].valueCoding.version = "0.1.0"

* entry[1].search.extension[1].extension[5].url = "matchedCriteria"
* entry[1].search.extension[1].extension[5].valueCoding = $DuplicateMatchCriteriaCS#streetPhonetic "Straße phonetisch übereinstimmend"
* entry[1].search.extension[1].extension[5].valueCoding.version = "0.1.0"

* entry[1].search.extension[1].extension[6].url = "matchedCriteria"
* entry[1].search.extension[1].extension[6].valueCoding = $DuplicateMatchCriteriaCS#houseNumberExact "Hausnummer exakt übereinstimmend"
* entry[1].search.extension[1].extension[6].valueCoding.version = "0.1.0"

* entry[1].search.extension[1].extension[7].url = "matchedCriteria"
* entry[1].search.extension[1].extension[7].valueCoding = $DuplicateMatchCriteriaCS#postalCodeExact "Postleitzahl exakt übereinstimmend"
* entry[1].search.extension[1].extension[7].valueCoding.version = "0.1.0"

* entry[1].search.extension[1].extension[8].url = "nonMatchedCriteria"
* entry[1].search.extension[1].extension[8].valueCoding = $DuplicateMatchCriteriaCS#birthNameFuzzy "Geburtsname ungefähr übereinstimmend (fuzzy)"
* entry[1].search.extension[1].extension[8].valueCoding.version = "0.1.0"


// -----------------------------------------------------------------------------
// Inline Patient 1
// -----------------------------------------------------------------------------

Instance: ExampleDuplicateCandidatePatientOne
InstanceOf: AffectedPerson
Usage: #inline
Title: "Example Duplicate Candidate Patient One"
Description: "First example Patient resource returned as a duplicate candidate."

* meta.profile[+] = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson"
* id = "example-duplicate-candidate-patient-one"

* meta.security[visibility] = $ResourceVisibilityType#inAgency "Eigene ÖGD-Stelle"
* meta.security[responsibility] = $ResourceResponsibility#1. "Robert Koch-Institut"

* identifier[EmigaID].system = "https://emiga.rki.de/fhir/sid/EmigaID"
* identifier[EmigaID].value = "Person-XYZ-123456789"
* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
* identifier[EmigaFileNumber].value = "Person-PQRS-987654321"

* name[0].use = #official
* name[0].family = "Mustermann"
* name[0].given = "Max"

* gender = #male
* birthDate = "1980-01-01"

//* address[0].use = #home
//* address[0].use = #home
* address[0].line = "Musterstr. 12"
* address[0].line.extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[0].line.extension[Strasse].valueString = "Musterstr."
* address[0].line.extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[0].line.extension[Hausnummer].valueString = "12"

* address[0].city = "Berlin"
* address[0].postalCode = "10115"
* address[0].country = "DE"


// -----------------------------------------------------------------------------
// Inline Patient 2
// -----------------------------------------------------------------------------

Instance: ExampleDuplicateCandidatePatientTwo
InstanceOf: AffectedPerson
Usage: #inline
Title: "Example Duplicate Candidate Patient Two"
Description: "Second example Patient resource returned as a duplicate candidate."

* meta.profile[+] = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson"
* id = "example-duplicate-candidate-patient-two"

* meta.security[visibility] = $ResourceVisibilityType#inAgency "Eigene ÖGD-Stelle"
* meta.security[responsibility] = $ResourceResponsibility#1. "Robert Koch-Institut"

* identifier[EmigaID].system = "https://emiga.rki.de/fhir/sid/EmigaID"
* identifier[EmigaID].value = "Person-KLMN-123456789"
* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
* identifier[EmigaFileNumber].value = "Person-GHIJ-987654321"

* name[0].use = #official
* name[0].family = "Muster"
* name[0].given = "Maximilian"

* gender = #male
* birthDate = "1980-01-01"

//* address[0].use = #home
* address[0].line = "Musterstr. 12"
* address[0].line.extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[0].line.extension[Strasse].valueString = "Musterstr."
* address[0].line.extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[0].line.extension[Hausnummer].valueString = "12"


* address[0].city = "Berlin"
* address[0].postalCode = "10115"
* address[0].country = "DE"