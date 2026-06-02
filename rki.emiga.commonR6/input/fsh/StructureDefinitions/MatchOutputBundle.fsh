Profile: MatchOutputBundleR6
Parent: Bundle
Id: MatchOutputBundleR6
Title: "Match Output Bundle"
Description: "Dieses Profil bildet ein Match-Output-Bundle ab. Es dient der strukturierten Zusammenführung und gemeinsamen Übertragung von Match-Ergebnissen (z.B. Dublettenprüfungen) zu Fällen, Ausbrüchen, Personen oder anderen Entitäten innerhalb eines fachlichen Vorgangs."
* insert ProfileMetaProfileTags
* insert MetadataProfile

* ^url = "https://emiga.rki.de/fhir/common/StructureDefinition/MatchOutputBundleR6"
* ^version = "0.1.0"
* ^date = "2026-05-12"

* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/MatchOutputBundleR6"

//* type = #transaction (exactly)
* type 1..1 MS
* type ^short = "Typ des Bundles"
* type = #searchset (exactly)
* total 0..1 MS
* total ^short = "Anzahl der Suchergebnisse"
* entry 0..* MS
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open

* entry.fullUrl 1..1 MS

* entry contains Patient 0..* MS

* entry[Patient].resource 1..1 MS
* entry[Patient].resource only Patient
* entry[Patient].resource only AffectedPersonR6

* entry[Patient].search 1..1 MS
* entry[Patient].search.mode 1..1 MS
* entry[Patient].search.mode = #match

// Normalized FHIR match score between 0 and 1.
// This is the standard Bundle.entry.search.score used by Patient/$match.
* entry[Patient].search.score 1..1 MS

// Both extensions are required:
// - standard FHIR match-grade extension
// - project-specific DuplicateMatchMetadata extension
* entry[Patient].search.extension 2..* MS
* entry[Patient].search.extension ^slicing.discriminator.type = #value
* entry[Patient].search.extension ^slicing.discriminator.path = "url"
* entry[Patient].search.extension ^slicing.rules = #open

* entry[Patient].search.extension contains
    http://hl7.org/fhir/StructureDefinition/match-grade named MatchGrade 1..1 MS and
    https://emiga.rki.de/fhir/common/StructureDefinition/DuplicateMatchMetadata named DuplicateMatchMetadata 1..1 MS