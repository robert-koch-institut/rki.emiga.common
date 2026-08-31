Extension: NullFlavor
Id: NullFlavor
Title: "Null flavor"
Description: "Die Extension gibt an, aus welchem Grund für das betreffende Element kein regulärer Wert vorliegt."
Context: Element

* ^url = "https://emiga.rki.de/fhir/common/Extension/NullFlavor"
* url = "https://emiga.rki.de/fhir/common/Extension/NullFlavor" (exactly)
* ^version = "0.1.1"
* ^date = "2026-08-18"

* insert MetadataProfile

* value[x] 1.. MS
* value[x] only Coding
* value[x] ^short = "Nicht ermittelbar oder nicht erhoben"
* value[x] ^definition = "Gibt an, warum kein richtiger Wert vorhanden ist."
* value[x] from NullFlavor (required)
* value[x].system 1.. MS
* value[x].system = $v3-NullFlavor
* value[x].version MS
* value[x].code 1.. MS
* value[x].display MS