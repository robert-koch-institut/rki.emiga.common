Profile: MatchOutputBundle
Parent: Bundle
Id: MatchOutputBundle
Title: "Match Output Bundle"
Description: "Dieses Profil bildet ein Match-Output-Bundle ab. Es dient der strukturierten Zusammenführung und gemeinsamen Übertragung von Match-Ergebnissen (z.B. Dublettenprüfungen) zu Fällen, Ausbrüchen, Personen oder anderen Entitäten innerhalb eines fachlichen Vorgangs."
* insert ProfileMetaProfileTags
* insert MetadataProfile

* ^url = "https://emiga.rki.de/fhir/common/StructureDefinition/MatchOutputBundle"
* ^version = "0.1.0"
* ^date = "2026-05-12"

* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/MatchOutputBundle"

//* type = #transaction (exactly)
* type 1..1 MS
* type ^short = "Typ des Bundles"
* type = #searchset (exactly)
* entry 1.. MS
* entry ^short = "Der einzelne Eintrag zur Interaktion"
* entry.link ..0
* entry.fullUrl MS
* entry.fullUrl ^short = "vollständige URL der Ressource"
* entry.fullUrl ^comment = "auch die Verwendung von UUIDs in der Form ';urn:uuid:.....' ist möglich."
* entry.resource MS
* entry.resource ^short = "Die Ressourcen-Instanz der Interaktion"
//* entry.search 
/*
* entry.request MS
* entry.request ^short = "HTTP-Request innerhalb der Transaktion"
* entry.request.method MS
* entry.request.method ^short = "HTTP-Verb"
* entry.request.url MS
* entry.request.url ^short = "Request-URL"
//* entry.response ..0
*/