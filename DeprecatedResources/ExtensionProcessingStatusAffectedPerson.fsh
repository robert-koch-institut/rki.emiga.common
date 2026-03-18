Extension: ProcessingStatusAffectedPerson
Id: ProcessingStatusAffectedPerson
Title: "Bearbeitungsstatus betroffene Person"
Description: "Extension zur Abbildung der Bearbeitungsstatus einer betroffenen Person."
Context: Patient
* ^url = "https://emiga.rki.de/fhir/common/Extension/ProcessingStatusAffectedPerson"
* ^version = "0.1.0"
* ^date = "2025-09-11"
* insert MetadataProfile
* url = "https://emiga.rki.de/fhir/common/Extension/ProcessingStatusAffectedPerson" (exactly)
* value[x] 1.. MS
* value[x] only Coding
* value[x] from ProcessingStatusAffectedPerson (required)
* value[x] ^short = "Bearbeitungsstatus der betroffenen Person"
* value[x] ^definition = "Bearbeitungsstatus der betroffenen Person"
* value[x] ^binding.description = "Bearbeitungsstatus der betroffenen Person"
* value[x].system 1.. MS
* value[x].version MS
* value[x].code 1.. MS
* value[x].display MS