Extension: DuplicateMatchMetadata
Id: DuplicateMatchMetadata
Title: "Dublettenprüfung Metadaten"
Description: "Metadaten zur Dublettenprüfung einer Resource."
Context: Bundle.entry.search
* insert MetadataProfile

* ^url = "https://emiga.rki.de/fhir/common/StructureDefinition/DuplicateMatchMetadata"
* ^version = "0.1.0"
* ^date = "2026-05-12"


* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #closed

* extension contains
    matchScore 0..1 MS and
    algorithm 1..1 MS and
    algorithmVersion 0..1 MS and
    triggerReason 0..1 MS and
    matchedCriteria 0..* MS and
    nonMatchedCriteria 0..* MS

* extension[matchScore].url = "matchScore" (exactly)
* extension[matchScore].value[x] 1..1 MS
* extension[matchScore].value[x] only decimal
* extension[matchScore].extension 0..0

* extension[algorithm].url = "algorithm" (exactly)
* extension[algorithm].value[x] only string
* extension[algorithm].value[x] 1..1 MS
* extension[algorithm].value[x] ^short = "Dublettenprüfungsalgorithmus"
* extension[algorithm].value[x] ^definition = "Algorithmus, der zur Dublettenprüfung verwendet wurde"
* extension[algorithm].extension 0..0

* extension[algorithmVersion].url = "algorithmVersion" (exactly)
* extension[algorithmVersion].value[x] only string
* extension[algorithmVersion].value[x] ^short = "Dublettenprüfungsalgorithmus Version"
* extension[algorithmVersion].value[x] ^definition = "Version des Algorithmus, der zur Dublettenprüfung verwendet wurde"
* extension[algorithmVersion].extension 0..0

* extension[triggerReason].url = "triggerReason" (exactly)
* extension[triggerReason].value[x] only Coding
* extension[triggerReason].value[x] from DuplicateMatchTriggerReasonsVS (required)
* extension[triggerReason].value[x] ^short = "Dublettenprüfungsgrund"
* extension[triggerReason].value[x] ^definition = "Grund, warum die Dublettenprüfung ausgelöst wurde"
* extension[triggerReason].value[x].system 1.. MS
* extension[triggerReason].value[x].version MS
* extension[triggerReason].value[x].code 1.. MS
* extension[triggerReason].value[x].display MS
* extension[triggerReason].extension 0..0

* extension[matchedCriteria].url = "matchedCriteria" (exactly)
* extension[matchedCriteria].value[x] only Coding
* extension[matchedCriteria].value[x] from DuplicateMatchCriteriaVS (required)
* extension[matchedCriteria].value[x] ^short = "Dublettenprüfungsübereinstimmungskriterium"
* extension[matchedCriteria].value[x] ^definition = "Kriterium, das bei der Dublettenprüfung übereinstimmend war"
* extension[matchedCriteria].value[x].system 1.. MS
* extension[matchedCriteria].value[x].version MS
* extension[matchedCriteria].value[x].code 1.. MS
* extension[matchedCriteria].value[x].display MS
* extension[matchedCriteria].extension 0..0

* extension[nonMatchedCriteria].url = "nonMatchedCriteria" (exactly)
* extension[nonMatchedCriteria].value[x] only Coding
* extension[nonMatchedCriteria].value[x] from DuplicateMatchCriteriaVS (required)
* extension[nonMatchedCriteria].value[x] ^short = "Dublettenprüfungsnichtübereinstimmungskriterium"
* extension[nonMatchedCriteria].value[x] ^definition = "Kriterium, das bei der Dublettenprüfung nicht übereinstimmend war"
* extension[nonMatchedCriteria].value[x].system 1.. MS
* extension[nonMatchedCriteria].value[x].version MS
* extension[nonMatchedCriteria].value[x].code 1.. MS
* extension[nonMatchedCriteria].value[x].display MS
* extension[nonMatchedCriteria].extension 0..0
