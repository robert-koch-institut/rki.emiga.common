Profile: PersonenTransactionBundle
Parent: Bundle
Id: PersonenTransactionBundle
Title: "EMIGA Personen Transactionbundle"
Description: "TO DO"
* insert ProfileMetaProfileTags
* insert MetadataProfile


* ^url = "https://emiga.rki.de/fhir/common/StructureDefinition/PersonenTransactionBundle"
* ^version = "0.3.0"
* ^date = "2025-10-23"

* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/PersonenTransactionBundle|1.2.0-alpha.10"
//* type = #transaction (exactly)
* type 1..1 MS
* type ^short = "Type des Bundles"
* type ^comment = "fix: transaction"
* type = #transaction (exactly)
* entry 1.. MS
* entry ^short = "Der einzelne Eintrag zur Interaktion"
* entry.link ..0
* entry.fullUrl MS
* entry.fullUrl ^short = "vollständige URL der Ressource"
* entry.fullUrl ^comment = "auch die Verwendung von UUIDs in der Form ';urn:uuid:.....' ist möglich."
* entry.resource MS
* entry.resource ^short = "Die Ressourcen-Instanz der Interaktion"
* entry.search 0..0
//* entry.search ^short = "Such-Parameter der Interaktion"
* entry.search ^comment = "wird in einem Transaktions-Bundle nicht verwendet"
* entry.request MS
* entry.request ^short = "HTTP-Request innerhalb der Transaktion"
* entry.request.method MS
* entry.request.method ^short = "HTTP-Verb"
* entry.request.url MS
* entry.request.url ^short = "Request-URL"
* entry.response ..0
//* entry.response ^short = "HTTP-Response innerhalb der Transaktion"
* entry.response ^comment = "wird in einem Transaktions-Bundle nicht verwendet"