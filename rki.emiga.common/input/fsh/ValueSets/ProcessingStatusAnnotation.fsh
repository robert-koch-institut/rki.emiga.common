ValueSet: ProcessingStatusAnnotation
Id: ProcessingStatusAnnotation
Title: "Bearbeitungsstatus Annotation"
Description: "Werteliste mit möglichen Bearbeitungsstatus für Annotationen."
* insert MetadataTerminology
* ^version = "0.1.0"
* ^date = "2025-11-06"
* ^url = "https://emiga.rki.de/fhir/common/ValueSet/ProcessingStatusAnnotation"

* $ProcessingStatusCS#inprogress "in Bearbeitung"
* $ProcessingStatusCS#closed "abgeschlossen"
* $ProcessingStatusCS#cancelled "verworfen"
* $ProcessingStatusCS#handedover "abgegeben"
* $ProcessingStatusCS#inhandover "in Übergabe"
* $ProcessingStatusCS#intakeover "in Übernahme"
* $ProcessingStatusCS#forinformation "zur Kenntnis"
