CodeSystem: TranslationFhirEndpointStatus
Id: TranslationFhirEndpointStatus
Title: "Übersetzungen FHIR CodeSystem EndpointStatus"
Description: "Beinhaltet die Übersetzungen für das FHIR CodeSystem EndpointStatus"
* insert MetaTerminology
* ^version = "1.0.0"
* ^date = "2024-03-28"
* ^content = #supplement
* ^supplements = "http://hl7.org/fhir/endpoint-status|4.0.1"
* #active
* #active ^designation[0].language = #de-DE
* #active ^designation[=].use = $ConceptDesignationUse#default
* #active ^designation[=].value = "Aktiv"
* #active ^designation[+].language = #de-DE
* #active ^designation[=].use = $ConceptDesignationUse#abbreviation
* #active ^designation[=].value = "A"
* #suspended
* #suspended ^designation[0].language = #de-DE
* #suspended ^designation[=].use = $ConceptDesignationUse#default
* #suspended ^designation[=].value = "Temporär inaktiv"
* #suspended ^designation[+].language = #de-DE
* #suspended ^designation[=].use = $ConceptDesignationUse#abbreviation
* #suspended ^designation[=].value = "TI"
* #error
* #error ^designation[0].language = #de-DE
* #error ^designation[=].use = $ConceptDesignationUse#default
* #error ^designation[=].value = "Fehler"
* #error ^designation[+].language = #de-DE
* #error ^designation[=].use = $ConceptDesignationUse#abbreviation
* #error ^designation[=].value = "F"
* #off
* #off ^designation[0].language = #de-DE
* #off ^designation[=].use = $ConceptDesignationUse#default
* #off ^designation[=].value = "Aus"
* #off ^designation[+].language = #de-DE
* #off ^designation[=].use = $ConceptDesignationUse#abbreviation
* #off ^designation[=].value = "Aus"
* #entered-in-error
* #entered-in-error ^designation[0].language = #de-DE
* #entered-in-error ^designation[=].use = $ConceptDesignationUse#default
* #entered-in-error ^designation[=].value = "Irrtümliche Eingabe"
* #entered-in-error ^designation[+].language = #de-DE
* #entered-in-error ^designation[=].use = $ConceptDesignationUse#abbreviation
* #entered-in-error ^designation[=].value = "IE"
* #test
* #test ^designation[0].language = #de-DE
* #test ^designation[=].use = $ConceptDesignationUse#default
* #test ^designation[=].value = "Test"
* #test ^designation[+].language = #de-DE
* #test ^designation[=].use = $ConceptDesignationUse#abbreviation
* #test ^designation[=].value = "T"