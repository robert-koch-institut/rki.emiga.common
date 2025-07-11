Profile: AnnotationBundle
Parent: Bundle
Id: AnnotationBundle
Title: "Annotations Bundle"
Description: "TO DO"
* insert ProfileMetaProfileTags
* insert MetadataProfile

* ^url = "https://emiga.rki.de/fhir/common/StructureDefinition/AnnotationBundle"
* ^version = "0.1.0"
* ^date = "2025-07-07"

* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AnnotationBundle|1.2.0-alpha.7"
//* type = #transaction (exactly)
* type MS
* type ^short = "Type des Bundles"
//* type ^comment = "fix: transaction"
* entry 1.. MS
* entry ^short = "Der einzelne Eintrag zur Interaktion"
* entry.link ..0
* entry.fullUrl MS
* entry.fullUrl ^short = "vollständige URL der Ressource"
* entry.fullUrl ^comment = "auch die Verwendung von UUIDs in der Form ';urn:uuid:.....' ist möglich."
* entry.resource MS
* entry.resource ^short = "Die Ressourcen-Instanz der Interaktion"
//* entry.search 
* entry.request MS
* entry.request ^short = "HTTP-Request innerhalb der Transaktion"
* entry.request.method MS
* entry.request.method ^short = "HTTP-Verb"
* entry.request.url MS
* entry.request.url ^short = "Request-URL"
//* entry.response ..0