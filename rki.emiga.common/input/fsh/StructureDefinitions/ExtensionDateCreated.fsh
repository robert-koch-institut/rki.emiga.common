Extension: DateCreated
Id: DateCreated
Title: "Erstellungsdatum"
Description: "Extension zur Abbildung der Erstellungsdatum eine Resource."
Context: Element
* ^url = "https://emiga.rki.de/fhir/common/Extension/DateCreated"
* ^version = "0.1.0"
* insert MetadataProfile
* value[x] 1.. MS
* value[x] only date
