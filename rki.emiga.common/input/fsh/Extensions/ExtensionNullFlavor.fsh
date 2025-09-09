Extension: NullFlavor
Id: NullFlavor
Title: "Null flavor"
Description: "If the value is not a proper value, indicates the reason."
Context: Element
* insert MetadataProfile

* ^url = "https://emiga.rki.de/fhir/common/Extension/NullFlavor"
* ^version = "0.1.0"
* ^date = "2025-09-08"

* value[x] 1.. MS
* value[x] only Coding
* value[x] ^short = "Nicht ermittelbar oder nicht erhoben"
* value[x] ^definition = "Gibt an, warum kein richtiger Wert vorhanden ist."
* value[x] from NullFlavor (required)
* value[x].system 1.. MS
* value[x].system = $v3-NullFlavor
* value[x].code 1.. MS
* value[x].display MS

