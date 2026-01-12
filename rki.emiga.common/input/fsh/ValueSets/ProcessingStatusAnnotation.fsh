ValueSet: ProcessingStatusAnnotation
Id: ProcessingStatusAnnotation
Title: "Bearbeitungsstatus Annotation"
Description: "Werteliste mit möglichen Bearbeitungsstatus für Annotationen."
* insert MetadataTerminology
* ^version = "0.1.0"
* ^date = "2025-11-06"
* ^url = "https://emiga.rki.de/fhir/common/ValueSet/ProcessingStatusAnnotation"

* $ProcessingStatusCS#inprogress "In Bearbeitung"
* $ProcessingStatusCS#closed "Abgeschlossen"
* $ProcessingStatusCS#cancelled "Verworfen"
* $ProcessingStatusCS#handedover "Abgegeben"
* $ProcessingStatusCS#inhandover "In Übergabe"
* $ProcessingStatusCS#intakeover "In Übernahme"
* $ProcessingStatusCS#forinformation "Zur Kenntnis"
