ValueSet: ProcessingStatusAnnotation
Id: ProcessingStatusAnnotation
Title: "Bearbeitungsstatus Annotation"
Description: "Werteliste mit möglichen Bearbeitungsstatus für Annotationen."
* ^url = "https://emiga.rki.de/fhir/common/ValueSet/ProcessingStatusAnnotation"
* ^version = "0.1.0"
* ^date = "2025-11-06"

* insert MetadataTerminology

* $ProcessingStatusCS#inprogress "In Bearbeitung"
* $ProcessingStatusCS#closed "Abgeschlossen"
* $ProcessingStatusCS#cancelled "Verworfen"
* $ProcessingStatusCS#handedover "Abgegeben"
* $ProcessingStatusCS#inhandover "In Übergabe"
* $ProcessingStatusCS#intakeover "In Übernahme"
* $ProcessingStatusCS#forinformation "Zur Kenntnis"