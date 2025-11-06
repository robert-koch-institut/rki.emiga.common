ValueSet: ProcessingStatusAffectedPerson
Id: ProcessingStatusAffectedPerson
Title: "Bearbeitungsstatus betroffene Person"
Description: "Werteliste mit möglichen Bearbeitungsstatus einer betroffenen Person."
* insert MetadataTerminology
* ^version = "0.2.0"
* ^date = "2025-11-06"
* ^url = "https://emiga.rki.de/fhir/common/ValueSet/ProcessingStatusAffectedPerson"


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