CodeSystem: AnnotationCategory
Id: AnnotationCategory
Title: "Annotationskategorien"
Description: "Das CodeSystem AnnotationCategory enthält die Codes für die verschiedenen Arten von Annotationen."
* insert MetadataTerminology
* ^version = "0.1.0"
* ^status = #active
* ^date = "2026-03-04"
* ^caseSensitive = true
* ^url = "https://emiga.rki.de/fhir/CodeSystem/AnnotationCategory"

* ^content = #complete

* #comment "Kommentar" "Annotationen mit zusätzlichen Attributen und ohne Anhänge."
* #attachment "Anhang" "Annotationen mit Anhängen und ohne zusätzliche Attribute."
* #note "Notiz" "Annotationen ohne zusätzliche Attribute und Anhänge."