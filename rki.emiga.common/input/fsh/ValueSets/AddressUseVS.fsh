ValueSet: AddressUseVS
Id: AddressUseVS
Title: "Adressnutzungskategorien"
Description: "Werteliste mit Konzepten, die die Art der Adressnutzung bestimmen."
* ^url = "https://emiga.rki.de/fhir/ValueSet/AddressUseVS"
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2026-07-10"

* include codes from system AddressUseCS

* $v3-NullFlavor#NASK "not asked" // nicht erhoben
* $v3-NullFlavor#NASK ^designation[0].use = $HL7DesignationUse#display
* $v3-NullFlavor#NASK ^designation[0].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $v3-NullFlavor#NASK ^designation[0].value = "nicht erhoben"
* $v3-NullFlavor#NASK ^designation[0].language = #de-DE