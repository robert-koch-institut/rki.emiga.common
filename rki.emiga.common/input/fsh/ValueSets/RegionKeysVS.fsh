ValueSet: RegionKeysVS
Title: "Regionalschlüssel (Werteliste)"
Description: "Werteliste mit Regionalschlüsseln (Gemeinden Deutschlands durch den Amtlichen Regionalschlüssel (ARS))."
Id: RegionKeysVS
* ^url = "https://emiga.rki.de/fhir/ValueSet/RegionKeysVS"
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2025-09-08"

* include codes from system RegionKeys

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