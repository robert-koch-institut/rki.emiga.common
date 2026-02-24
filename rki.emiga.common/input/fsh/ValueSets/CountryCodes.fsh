ValueSet: CountryCodes
Title: "Ländercodes gemäß Anlage 8 der DEÜV"
Description: "Werteliste mit Ländercodes gemäß Anlage 8 der DEÜV."
Id: CountryCodes

* ^url = "https://emiga.rki.de/fhir/ValueSet/CountryCodes"
* insert MetadataTerminology
* ^version = "1.1.0"
* ^date = "2025-09-18"

* include codes from system http://fhir.de/CodeSystem/deuev/anlage-8-laenderkennzeichen

* $DemisNoCountry#31099997 "staatenlos" // Staatenlos

* $nullflavorCS#ASKU "asked but unknown" // nicht ermittelbar
* $nullflavorCS#ASKU ^designation[0].use = $HL7DesignationUse#display
* $nullflavorCS#ASKU ^designation[0].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $nullflavorCS#ASKU ^designation[0].value = "nicht ermittelbar"
* $nullflavorCS#ASKU ^designation[0].language = #de-DE
* $nullflavorCS#NASK "not asked" // nicht erhoben
* $nullflavorCS#NASK ^designation[0].use = $HL7DesignationUse#display
* $nullflavorCS#NASK ^designation[0].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $nullflavorCS#NASK ^designation[0].value = "nicht erhoben"
* $nullflavorCS#NASK ^designation[0].language = #de-DE