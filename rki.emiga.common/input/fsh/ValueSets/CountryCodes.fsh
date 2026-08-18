ValueSet: CountryCodes
Id: CountryCodes
Title: "Ländercodes gemäß Anlage 8 der DEÜV"
Description: "Werteliste mit Ländercodes gemäß Anlage 8 der DEÜV."
* ^url = "https://emiga.rki.de/fhir/ValueSet/CountryCodes"
* ^version = "1.1.1"
* ^date = "2026-08-18"

* insert MetadataTerminology

* include codes from system http://fhir.de/CodeSystem/deuev/anlage-8-laenderkennzeichen

* $DemisNoCountry#31099997 "staatenlos" // Staatenlos

* $v3-NullFlavor#ASKU "asked but unknown" // nicht ermittelbar
* $v3-NullFlavor#ASKU ^designation[0].use = $HL7DesignationUse#display
* $v3-NullFlavor#ASKU ^designation[0].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $v3-NullFlavor#ASKU ^designation[0].value = "nicht ermittelbar"
* $v3-NullFlavor#ASKU ^designation[0].language = #de-DE
* $v3-NullFlavor#NASK "not asked" // nicht erhoben
* $v3-NullFlavor#NASK ^designation[0].use = $HL7DesignationUse#display
* $v3-NullFlavor#NASK ^designation[0].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $v3-NullFlavor#NASK ^designation[0].value = "nicht erhoben"
* $v3-NullFlavor#NASK ^designation[0].language = #de-DE