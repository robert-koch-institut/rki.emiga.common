ValueSet: CountryCodesVS
Title: "Ländercodes gemäß Anlage 8 der DEÜV"
Description: "Werteliste mit Ländercodes gemäß Anlage 8 der DEÜV."
Id: CountryCodesVS
* ^url = "https://emiga.rki.de/fhir/ValueSet/CountryCodesVS"
* insert MetadataTerminology
* ^version = "1.1.0"
* ^date = "2025-09-18"

* include codes from system http://fhir.de/CodeSystem/deuev/anlage-8-laenderkennzeichen

* $DemisNoCountry#31099997 "staatenlos" // Staatenlos

* $HL7NullflavorCS#ASKU "asked but unknown" // nicht ermittelbar
* $HL7NullflavorCS#ASKU ^designation[0].use = $HL7DesignationUse#display
* $HL7NullflavorCS#ASKU ^designation[0].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $HL7NullflavorCS#ASKU ^designation[0].value = "nicht ermittelbar"
* $HL7NullflavorCS#ASKU ^designation[0].language = #de-DE
* $HL7NullflavorCS#NASK "not asked" // nicht erhoben
* $HL7NullflavorCS#NASK ^designation[0].use = $HL7DesignationUse#display
* $HL7NullflavorCS#NASK ^designation[0].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $HL7NullflavorCS#NASK ^designation[0].value = "nicht erhoben"
* $HL7NullflavorCS#NASK ^designation[0].language = #de-DE