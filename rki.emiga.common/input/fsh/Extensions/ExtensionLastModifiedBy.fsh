Extension: LastModifiedBy
Id: LastModifiedBy
Title: "Zuletzt editiert von"
Description: "Extension um die Person zu referenzieren, die als letztes eine Ressource editiert hat."
Context: Resource.meta

* ^url = "https://emiga.rki.de/fhir/common/Extension/LastModifiedBy"
* url = "https://emiga.rki.de/fhir/common/Extension/LastModifiedBy" (exactly)
* ^version = "0.2.1"
* ^date = "2026-08-18"

* insert MetadataProfile

* value[x] 1.. MS
* value[x] only Reference(Practitioner)
* value[x] ^short = "Zuletzt editiert von"
* value[x] ^definition = "Referenziert die Person, die die Ressource zuletzt editiert hat."