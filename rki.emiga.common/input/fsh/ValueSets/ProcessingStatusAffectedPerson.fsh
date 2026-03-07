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