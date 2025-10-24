ValueSet: ProcessingStatusAffectedPersonVS
Id: ProcessingStatusAffectedPersonVS
Title: "Bearbeitungsstatus betroffene Person"
Description: "Werteliste mit möglichen Bearbeitungsstatus einer betroffenen Person."
* insert MetadataTerminology
* ^version = "0.1.0"
* ^date = "2025-09-10"
* ^url = "https://emiga.rki.de/fhir/common/ValueSet/ProcessingStatusAffectedPersonVS"


* $ProcessingStatusCS#inprogress "in Bearbeitung" 
* $ProcessingStatusCS#closed "abgeschlossen"
* $ProcessingStatusCS#cancelled "verworfen"
//* $ProcessingStatusCS#handedover "abgegeben"
//* $ProcessingStatusCS#inhandover "in Übergabe"
//* $ProcessingStatusCS#intakeover "in Übernahme"
//* $ProcessingStatusCS#forinformation "zur Kenntnis"

//* $nullflavor#ASKU "asked but unknown" // nicht ermittelbar
//* $nullflavor#NASK "not asked" // nicht erhoben
//* $nullflavor#OTH "other" // sonstiges