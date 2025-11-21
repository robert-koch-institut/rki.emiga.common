Extension: ProcessingStatus
Id: ProcessingStatus
Title: "Bearbeitungsstatus"
Description: "Extension zur Abbildung der Bearbeitungsstatus eines Vorgangs."
Context: Element
* ^url = "https://emiga.rki.de/fhir/common/Extension/ProcessingStatus"
* ^version = "0.2.0"
* ^date = "2025-11-21"
* insert MetadataProfile

* url = "https://emiga.rki.de/fhir/common/Extension/ProcessingStatus" (exactly)
* value[x] 1.. MS
* value[x] only Coding
* value[x] from ProcessingStatusVS (example)
* value[x] ^short = "Bearbeitungsstatus"
* value[x] ^definition = "Bearbeitungsstatus des Vorgangs"
* value[x] ^binding.description = "Bearbeitungsstatus"
* value[x].system 1.. MS
* value[x].version MS
* value[x].code 1.. MS
* value[x].display MS