CodeSystem: TranslationFhirLocationStatus
Id: TranslationFhirLocationStatus
Title: "Übersetzungen FHIR CodeSystem LocationStatus"
Description: "Beinhaltet die Übersetzungen für das FHIR CodeSystem LocationStatus"
* insert MetaTerminology
* ^version = "1.0.0"
* ^date = "2024-03-28"
* ^content = #supplement
* ^supplements = "http://hl7.org/fhir/location-status"
* #active
* #active ^designation[0].language = #de-DE
* #active ^designation[=].use = $ConceptDesignationUse#default
* #active ^designation[=].value = "aktiv"
* #active ^designation[+].language = #de-DE
* #active ^designation[=].use = $ConceptDesignationUse#abbreviation
* #active ^designation[=].value = "A"
* #suspended
* #suspended ^designation[0].language = #de-DE
* #suspended ^designation[=].use = $ConceptDesignationUse#default
* #suspended ^designation[=].value = "temporär inaktiv"
* #suspended ^designation[+].language = #de-DE
* #suspended ^designation[=].use = $ConceptDesignationUse#abbreviation
* #suspended ^designation[=].value = "TI"
* #inactive
* #inactive ^designation[0].language = #de-DE
* #inactive ^designation[=].use = $ConceptDesignationUse#default
* #inactive ^designation[=].value = "inaktiv"
* #inactive ^designation[+].language = #de-DE
* #inactive ^designation[=].use = $ConceptDesignationUse#abbreviation
* #inactive ^designation[=].value = "I"