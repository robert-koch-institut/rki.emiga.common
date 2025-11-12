Extension: LastModifiedBy
Id: LastModifiedBy
Title: "Zuletzt editiert von"
Description: "Extension um der letzten Nutzende Person zu referenzieren, die eine Ressource editiert hat."
Context: Resource.meta.extension
* insert MetadataProfile

* ^url = "https://emiga.rki.de/fhir/common/Extension/LastModifiedBy"
* ^version = "0.1.0"
* ^date = "2025-11-12"
* url = "https://emiga.rki.de/fhir/common/Extension/LastModifiedBy" (exactly)
* value[x] 1.. MS
* value[x] only Reference(Practitioner)
* value[x] ^short = "Zuletzt editiert von"
* value[x] ^definition = "Referenziert die Person, die die Ressource zuletzt editiert hat."
