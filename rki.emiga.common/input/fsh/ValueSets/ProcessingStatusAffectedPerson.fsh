ValueSet: ProcessingStatusAffectedPerson
Id: ProcessingStatusAffectedPerson
Title: "Bearbeitungsstatus betroffene Person"
Description: "Werteliste mit möglichen Bearbeitungsstatus einer betroffenen Person."
* insert MetadataTerminology
* ^version = "0.2.0"
* ^date = "2025-11-06"
* ^url = "https://emiga.rki.de/fhir/common/ValueSet/ProcessingStatusAffectedPerson"


* $ProcessingStatusCS#inprogress "In Bearbeitung" 
* $ProcessingStatusCS#closed "Abgeschlossen"
* $ProcessingStatusCS#cancelled "Verworfen"
//* $ProcessingStatusCS#handedover "Abgegeben"
//* $ProcessingStatusCS#inhandover "In Übergabe"
//* $ProcessingStatusCS#intakeover "In Übernahme"
//* $ProcessingStatusCS#forinformation "Zur Kenntnis"

//* $nullflavor#ASKU "asked but unknown" // nicht ermittelbar
//* $nullflavor#NASK "not asked" // nicht erhoben
//* $nullflavor#OTH "other" // sonstiges