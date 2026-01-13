CodeSystem: ProcessingStatus
Id: ProcessingStatus
Title: "Bearbeitungsstatus"
Description: "CodeSystem zur Abbildung der Bearbeitungsstatus eines Vorgangs oder einer betroffenen Person."
* insert MetadataTerminology
* ^url = "https://emiga.rki.de/fhir/common/CodeSystem/ProcessingStatus"
* ^valueSet = "https://emiga.rki.de/fhir/common/ValueSet/ProcessingStatusVS"
* ^version = "0.5.0"
* ^date = "2025-12-12"
* ^caseSensitive = true
* ^content = #complete

* #open "Offen" "Der Vorgang ist offen und wurde noch nicht bearbeitet."
* #inprogress "In Bearbeitung" "Der Vorgang oder die betroffene Person ist in Bearbeitung."
* #closed "Abgeschlossen" "Der Vorgang oder die betroffene Person ist abgeschlossen."
* #cancelled "Verworfen" "Der Vorgang oder die betroffene Person ist verworfen."
* #handedover "Abgegeben" "Der Vorgang wurde wurde an ein anderes GA abgegeben."
* #inhandover "In Übergabe" "Das GA hat den Vorgang zur Übernahme abgegeben."
* #intakeover "In Übernahme" "Das GA nimmt den Vorgang vom anderen GA an."
* #forinformation "Zur Kenntnis" "Der Vorgang kann zur Kenntnis eingesehen werden."
* #finishedProcessing "Fertig bearbeitet" "Der Vorgang wurde vollständig bearbeitet."
* #noFurtherProcessing "Keine weitere Bearbeitung notwendig" "Für den Vorgang ist keine weitere Bearbeitung notwendig."
* #started "Begonnen" "Die Bearbeitung des Vorgangs wurde begonnen."

ValueSet: ProcessingStatusVS
Id: ProcessingStatusVS
Title: "Bearbeitungsstatus"
Description: "TODO"
* insert MetadataTerminology
* ^version = "0.2.0"
* ^date = "2025-12-12"
* ^url = "https://emiga.rki.de/fhir/common/ValueSet/ProcessingStatusVS"
* include codes from system ProcessingStatus
//* $nullflavor#ASKU "asked but unknown" // nicht ermittelbar
//* $nullflavor#NASK "not asked" // nicht erhoben
//* $nullflavor#OTH "other" // sonstiges