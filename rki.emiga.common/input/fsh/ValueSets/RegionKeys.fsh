ValueSet: RegionKeys
Title: "Regionalschlüssel (Werteliste)"

Description: "Werteliste mit Regionalschlüsseln (Gemeinden Deutschlands durch den Amtlichen Regionalschlüssel (ARS))."
Id: RegionKeys
* ^url = "https://emiga.rki.de/fhir/ValueSet/RegionKeys"
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2025-09-08"

* include codes from system RegionKeys

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