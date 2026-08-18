Extension: DateCreated
Id: DateCreated
Title: "Erstellungsdatum"
Description: "Extension zur Abbildung des Erstellungsdatums einer Ressource."
Context: Element

* ^url = "https://emiga.rki.de/fhir/common/Extension/DateCreated"
* url = "https://emiga.rki.de/fhir/common/Extension/DateCreated" (exactly)
* ^version = "0.1.1"
* ^date = "2026-08-18"

* insert MetadataProfile

* value[x] 1.. MS
* value[x] only instant