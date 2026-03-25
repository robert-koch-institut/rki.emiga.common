CodeSystem: AnnotationCategory
Id: AnnotationCategory
Title: "Annotationskategorien"
Description: "Das CodeSystem AnnotationCategory enthält die Codes für die verschiedenen Arten von Annotationen."
* insert MetadataTerminology
* ^version = "0.1.2"
* ^status = #active
* ^date = "2026-03-24"
* ^caseSensitive = true
* ^url = "https://emiga.rki.de/fhir/CodeSystem/AnnotationCategory"

* ^content = #complete
* ^count = 3
* ^valueSet = "https://emiga.rki.de/fhir/ValueSet/AnnotationCategoryVS"

* #comment "Kommentar" "Annotationen mit zusätzlichen Attributen und ohne Anhänge."
* #attachment "Anhang" "Annotationen mit Anhängen und ohne zusätzliche Attribute."
* #note "Notiz" "Annotationen mit zusätzlichen Eigenschaften und ohne Anhänge."