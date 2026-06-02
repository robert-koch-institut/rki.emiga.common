// AUTO-DISABLED (SUSHI R6): Instance: ExamplePatientMatchOutputBundle
// AUTO-DISABLED (SUSHI R6): InstanceOf: MatchOutputBundleR6
// AUTO-DISABLED (SUSHI R6): Usage: #example
// AUTO-DISABLED (SUSHI R6): Title: "Example Patient Match Output Bundle"
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * meta.profile[+] = $MatchOutputBundleR6
// AUTO-DISABLED (SUSHI R6): * type = #searchset
// AUTO-DISABLED (SUSHI R6): * link[0].relation = "self"
// AUTO-DISABLED (SUSHI R6): * link[0].url = "https://emiga.rki.de/fhir/Patient/$match"
// AUTO-DISABLED (SUSHI R6): * total = 2
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): // -----------------------------------------------------------------------------
// AUTO-DISABLED (SUSHI R6): // First duplicate candidate
// AUTO-DISABLED (SUSHI R6): // -----------------------------------------------------------------------------
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * entry[0].fullUrl = "urn:uuid:11111111-1111-1111-1111-111111111111"
// AUTO-DISABLED (SUSHI R6): * entry[0].resource = ExampleDuplicateCandidatePatientOne
// AUTO-DISABLED (SUSHI R6): * entry[0].search.mode = #match
// AUTO-DISABLED (SUSHI R6): * entry[0].search.score = 0.92
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): // Standard FHIR match-grade extension
// AUTO-DISABLED (SUSHI R6): * entry[0].search.extension[0].url = $MatchGrade
// AUTO-DISABLED (SUSHI R6): * entry[0].search.extension[0].valueCode = #probable
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): // Custom EMIGA duplicate match metadata extension
// AUTO-DISABLED (SUSHI R6): * entry[0].search.extension[1].url = $DuplicateMatchMetadata
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * entry[0].search.extension[1].extension[0].url = "matchScore"
// AUTO-DISABLED (SUSHI R6): * entry[0].search.extension[1].extension[0].valueDecimal = 2.5
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * entry[0].search.extension[1].extension[1].url = "algorithm"
// AUTO-DISABLED (SUSHI R6): * entry[0].search.extension[1].extension[1].valueString = "person-duplicate"
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * entry[0].search.extension[1].extension[2].url = "algorithmVersion"
// AUTO-DISABLED (SUSHI R6): * entry[0].search.extension[1].extension[2].valueString = "v1"
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * entry[0].search.extension[1].extension[3].url = "triggerReason"
// AUTO-DISABLED (SUSHI R6): * entry[0].search.extension[1].extension[3].valueCoding = $DuplicateMatchTriggerReasonsCS#main-criteria "Hauptkriterium"
// AUTO-DISABLED (SUSHI R6): * entry[0].search.extension[1].extension[3].valueCoding.version = "0.1.0"
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * entry[0].search.extension[1].extension[4].url = "matchedCriteria"
// AUTO-DISABLED (SUSHI R6): * entry[0].search.extension[1].extension[4].valueCoding = $DuplicateMatchCriteriaCS#birthDateExact "Geburtsdatum exakt übereinstimmend"
// AUTO-DISABLED (SUSHI R6): * entry[0].search.extension[1].extension[4].valueCoding.version = "0.1.0"
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * entry[0].search.extension[1].extension[5].url = "matchedCriteria"
// AUTO-DISABLED (SUSHI R6): * entry[0].search.extension[1].extension[5].valueCoding = $DuplicateMatchCriteriaCS#firstNameFuzzy "Vorname ungefähr übereinstimmend (fuzzy)"
// AUTO-DISABLED (SUSHI R6): * entry[0].search.extension[1].extension[5].valueCoding.version = "0.1.0"
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * entry[0].search.extension[1].extension[6].url = "matchedCriteria"
// AUTO-DISABLED (SUSHI R6): * entry[0].search.extension[1].extension[6].valueCoding = $DuplicateMatchCriteriaCS#familyNameFuzzy "Familienname ungefähr übereinstimmend (fuzzy)"
// AUTO-DISABLED (SUSHI R6): * entry[0].search.extension[1].extension[6].valueCoding.version = "0.1.0"
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * entry[0].search.extension[1].extension[7].url = "nonMatchedCriteria"
// AUTO-DISABLED (SUSHI R6): * entry[0].search.extension[1].extension[7].valueCoding = $DuplicateMatchCriteriaCS#cityPhonetic "Stadt phonetisch übereinstimmend"
// AUTO-DISABLED (SUSHI R6): * entry[0].search.extension[1].extension[7].valueCoding.version = "0.1.0"
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): // -----------------------------------------------------------------------------
// AUTO-DISABLED (SUSHI R6): // Second duplicate candidate
// AUTO-DISABLED (SUSHI R6): // -----------------------------------------------------------------------------
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * entry[1].fullUrl = "urn:uuid:22222222-2222-2222-2222-222222222222"
// AUTO-DISABLED (SUSHI R6): * entry[1].resource = ExampleDuplicateCandidatePatientTwo
// AUTO-DISABLED (SUSHI R6): * entry[1].search.mode = #match
// AUTO-DISABLED (SUSHI R6): * entry[1].search.score = 0.74
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): // Standard FHIR match-grade extension
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[0].url = $MatchGrade
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[0].valueCode = #possible
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): // Custom EMIGA duplicate match metadata extension
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[1].url = $DuplicateMatchMetadata
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[1].extension[0].url = "matchScore"
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[1].extension[0].valueDecimal = 1.8
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[1].extension[1].url = "algorithm"
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[1].extension[1].valueString = "person-duplicate"
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[1].extension[2].url = "algorithmVersion"
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[1].extension[2].valueString = "v1"
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[1].extension[3].url = "triggerReason"
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[1].extension[3].valueCoding = $DuplicateMatchTriggerReasonsCS#address-fallback "Adress-Fallback"
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[1].extension[3].valueCoding.version = "0.1.0"
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[1].extension[4].url = "matchedCriteria"
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[1].extension[4].valueCoding = $DuplicateMatchCriteriaCS#birthDateExact "Geburtsdatum exakt übereinstimmend"
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[1].extension[4].valueCoding.version = "0.1.0"
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[1].extension[5].url = "matchedCriteria"
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[1].extension[5].valueCoding = $DuplicateMatchCriteriaCS#streetPhonetic "Straße phonetisch übereinstimmend"
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[1].extension[5].valueCoding.version = "0.1.0"
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[1].extension[6].url = "matchedCriteria"
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[1].extension[6].valueCoding = $DuplicateMatchCriteriaCS#houseNumberExact "Hausnummer exakt übereinstimmend"
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[1].extension[6].valueCoding.version = "0.1.0"
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[1].extension[7].url = "matchedCriteria"
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[1].extension[7].valueCoding = $DuplicateMatchCriteriaCS#postalCodeExact "Postleitzahl exakt übereinstimmend"
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[1].extension[7].valueCoding.version = "0.1.0"
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[1].extension[8].url = "nonMatchedCriteria"
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[1].extension[8].valueCoding = $DuplicateMatchCriteriaCS#birthNameFuzzy "Geburtsname ungefähr übereinstimmend (fuzzy)"
// AUTO-DISABLED (SUSHI R6): * entry[1].search.extension[1].extension[8].valueCoding.version = "0.1.0"


// -----------------------------------------------------------------------------
// Inline Patient 1
// -----------------------------------------------------------------------------

Instance: ExampleDuplicateCandidatePatientOne
InstanceOf: AffectedPersonR6
Usage: #inline
Title: "Example Duplicate Candidate Patient One"
Description: "First example Patient resource returned as a duplicate candidate."

* meta.profile[+] = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPersonR6"
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
InstanceOf: AffectedPersonR6
Usage: #inline
Title: "Example Duplicate Candidate Patient Two"
Description: "Second example Patient resource returned as a duplicate candidate."

* meta.profile[+] = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPersonR6"
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