ValueSet: ProcessingStatusAffectedPerson
Id: ProcessingStatusAffectedPerson
Title: "Bearbeitungsstatus betroffene Person"
Description: "Werteliste mit möglichen Bearbeitungsstatus einer betroffenen Person."
* ^url = "https://emiga.rki.de/fhir/common/ValueSet/ProcessingStatusAffectedPerson"
* ^version = "0.2.1"
* ^date = "2026-08-18"

* insert MetadataTerminology

* $ProcessingStatusCS#inprogress "In Bearbeitung" 
* $ProcessingStatusCS#closed "Abgeschlossen"
* $ProcessingStatusCS#cancelled "Verworfen"