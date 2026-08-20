ValueSet: NullFlavor
Id: NullFlavor
Title: "Nicht ermittelbar, Nicht erhoben Antworten"
Description: "Werteliste mit Konzepten, die den Grund für das Fehlen eines regulären Wertes angeben."
* ^url = "https://emiga.rki.de/fhir/ValueSet/NullFlavor"
* ^version = "1.0.1"
* ^date = "2026-08-18"

* insert MetadataTerminology

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