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
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry.fullUrl 1..
* entry contains
    Patient 0..*  
* entry[Patient] ^short = "Patient"
* entry[Patient].resource 1.. MS
* entry[Patient].resource only AffectedPerson
* entry[Patient].search 1.. MS
* entry[Patient].search.extension contains http://hl7.org/fhir/StructureDefinition/match-grade named MatchGrade 1..1 MS and https://emiga.rki.de/fhir/common/StructureDefinition/DuplicateMatchMetadata named DuplicateMatchMetadata 1..1 MS
* entry[Patient].search.mode 1.. MS
* entry[Patient].search.mode = #match
* entry[Patient].search.score 1.. MS
