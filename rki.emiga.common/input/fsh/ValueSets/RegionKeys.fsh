ValueSet: RegionKeys
Title: "Regionalschlüssel (Werteliste)"

Description: "Werteliste mit Regionalschlüsseln (Gemeinden Deutschlands durch den Amtlichen Regionalschlüssel (ARS))."
Id: RegionKeys
* ^url = "https://emiga.rki.de/fhir/ValueSet/RegionKeys"
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2025-09-08"

* include codes from system RegionKeys

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