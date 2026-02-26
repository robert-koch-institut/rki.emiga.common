ValueSet: NullFlavor
Title: "Nicht ermittelbar, Nicht erhoben Antworten"
Description: "Werteliste mit nicht ermittelbar und nicht erhoben Antworten."
Id: NullFlavor
* ^url = "https://emiga.rki.de/fhir/ValueSet/NullFlavor"
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2025-09-08"

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