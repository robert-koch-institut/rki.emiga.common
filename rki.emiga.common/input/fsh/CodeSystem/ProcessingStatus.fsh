CodeSystem: ProcessingStatus
Id: ProcessingStatus
Title: "Bearbeitungsstatus"
Description: "TODO"
* insert MetadataTerminology
* ^url = "https://emiga.rki.de/fhir/common/CodeSystem/ProcessingStatus"
* ^valueSet = "https://emiga.rki.de/fhir/common/ValueSet/ProcessingStatusVS"
* ^version = "0.1.0"
* ^date = "2025-02-10"
* ^caseSensitive = true
* ^content = #complete

* #inprogress "in Bearbeitung" "Der Vorgang ist in Bearbeitung."
* #closed "abgeschlossen" "Der Vorgang ist abgeschlossen."
* #cancelled "verworfen" "Der Vorgang ist verworfen."
* #handedover "abgegeben" "Der Vorgang wurde wurde an ein anderes GA abgegeben."
* #inhandover "in Übergabe" "Das GA hat den Vorgang zur Übernahme abgegeben."
* #intakeover "in Übernahme" "Das GA nimmt den Vorgang vom anderen GA an."
* #forinformation "zur Kenntnis" "Der Vorgang kann zur Kenntnis eingesehen werden."

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