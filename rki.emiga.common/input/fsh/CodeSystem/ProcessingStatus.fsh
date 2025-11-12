CodeSystem: ProcessingStatus
Id: ProcessingStatus
Title: "Bearbeitungsstatus"
Description: "CodeSystem zur Abbildung der Bearbeitungsstatus eines Vorgangs oder einer betroffenen Person."
* insert MetadataTerminology
* ^url = "https://emiga.rki.de/fhir/common/CodeSystem/ProcessingStatus"
* ^valueSet = "https://emiga.rki.de/fhir/common/ValueSet/ProcessingStatusVS"
* ^version = "0.4.0"
* ^date = "2025-11-12"
* ^caseSensitive = true
* ^content = #complete

* #open "offen" "Der Vorgang ist offen und wurde noch nicht bearbeitet."
* #inprogress "in Bearbeitung" "Der Vorgang oder die betroffene Person ist in Bearbeitung."
* #closed "abgeschlossen" "Der Vorgang oder die betroffene Person ist abgeschlossen."
* #cancelled "verworfen" "Der Vorgang oder die betroffene Person ist verworfen."
* #handedover "abgegeben" "Der Vorgang wurde wurde an ein anderes GA abgegeben."
* #inhandover "in Übergabe" "Das GA hat den Vorgang zur Übernahme abgegeben."
* #intakeover "in Übernahme" "Das GA nimmt den Vorgang vom anderen GA an."
* #forinformation "zur Kenntnis" "Der Vorgang kann zur Kenntnis eingesehen werden."
* #finishedProcessing "fertig bearbeitet" "Der Vorgang wurde vollständig bearbeitet."
* #noFurtherProcessing "keine weitere Bearbeitung notwendig" "Für den Vorgang ist keine weitere Bearbeitung notwendig."
* #started "begonnen" "Die Bearbeitung des Vorgangs wurde begonnen."

ValueSet: ProcessingStatusVS
Id: ProcessingStatusVS
Title: "Bearbeitungsstatus"
Description: "TODO"
* insert MetadataTerminology
* ^version = "0.1.0"
* ^date = "2025-02-10"
* ^url = "https://emiga.rki.de/fhir/common/ValueSet/ProcessingStatusVS"
* include codes from system ProcessingStatus
//* $nullflavor#ASKU "asked but unknown" // nicht ermittelbar
//* $nullflavor#NASK "not asked" // nicht erhoben
//* $nullflavor#OTH "other" // sonstiges