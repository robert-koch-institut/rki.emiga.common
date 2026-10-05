Profile: AnnotationBundle
Parent: Bundle
Id: AnnotationBundle
Title: "Annotations Bundle"
Description: "Dieses Profil bildet ein Annotations-Bundle ab. Es dient der strukturierten Zusammenführung und gemeinsamen Übertragung von Annotationen (z.B. Notizen, Kommentaren und zugehörigen Ressourcen) zu Fällen, Ausbrüchen, Personen oder anderen Entitäten innerhalb eines fachlichen Vorgangs."
* insert ProfileMetaProfileTags
* insert MetadataProfile

* ^url = "https://emiga.rki.de/fhir/common/StructureDefinition/AnnotationBundle"
* ^version = "0.4.0"
* ^date = "2025-11-12"

* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AnnotationBundle"

//* type = #transaction (exactly)
* type 1..1 MS
* type ^short = "Typ des Bundles"
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
/*
* entry.request MS
* entry.request ^short = "HTTP-Request innerhalb der Transaktion"
* entry.request.method MS
* entry.request.method ^short = "HTTP-Verb"
* entry.request.url MS
* entry.request.url ^short = "Request-URL"
//* entry.response ..0
*/