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
    algorithm 1..1 MS and
    algorithmVersion 0..1 MS and
    triggerReason 0..1 MS and
    matchedCriteria 0..1 MS and
    nonMatchedCriteria 0..1 MS

* extension[algorithm].url = "algorithm"
* extension[algorithm].value[x] only String
* extension[algorithm].value[x] 1..1 MS
* extension[algorithm].value[x] ^short = "Dublettenprüfungsalgorithmus"
* extension[algorithm].value[x] ^definition = "Algorithmus, der zur Dublettenprüfung verwendet wurde"


* extension[algorithmVersion].url = "algorithmVersion"
* extension[algorithmVersion].value[x] only String
* extension[algorithmVersion].value[x] ^short = "Dublettenprüfungsalgorithmus Version"
* extension[algorithmVersion].value[x] ^definition = "Version des Algorithmus, der zur Dublettenprüfung verwendet wurde"

* extension[triggerReason].url = "triggerReason"
* extension[triggerReason].value[x] only Coding
* extension[triggerReason].value[x] from DuplicateMatchTriggerReasonVS (example)
* extension[triggerReason].value[x] ^short = "Dublettenprüfungsgrund"
* extension[triggerReason].value[x] ^definition = "Grund, warum die Dublettenprüfung ausgelöst wurde"
* extension[triggerReason].value[x].system 1.. MS
* extension[triggerReason].value[x].version MS
* extension[triggerReason].value[x].code 1.. MS
* extension[triggerReason].value[x].display MS

* extension[matchedCriteria].url = "matchedCriteria"
* extension[matchedCriteria].value[x] only Coding
* extension[matchedCriteria].value[x] from DuplicateMatchCriteriaVS (example)
* extension[matchedCriteria].value[x] ^short = "Dublettenprüfungsübereinstimmungskriterium"
* extension[matchedCriteria].value[x] ^definition = "Kriterium, das bei der Dublettenprüfung übereinstimmend war"
* extension[matchedCriteria].value[x].system 1.. MS
* extension[matchedCriteria].value[x].version MS
* extension[matchedCriteria].value[x].code 1.. MS
* extension[matchedCriteria].value[x].display MS

* extension[nonMatchedCriteria].url = "nonMatchedCriteria"
* extension[nonMatchedCriteria].value[x] only Coding
* extension[nonMatchedCriteria].value[x] from DuplicateMatchCriteriaVS (example)
* extension[nonMatchedCriteria].value[x] ^short = "Dublettenprüfungsnichtübereinstimmungskriterium"
* extension[nonMatchedCriteria].value[x] ^definition = "Kriterium, das bei der Dublettenprüfung nicht übereinstimmend war"
* extension[nonMatchedCriteria].value[x].system 1.. MS
* extension[nonMatchedCriteria].value[x].version MS
* extension[nonMatchedCriteria].value[x].code 1.. MS
* extension[nonMatchedCriteria].value[x].display MS
