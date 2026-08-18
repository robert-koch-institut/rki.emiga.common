CodeSystem: AnnotationCategory
Id: AnnotationCategory
Title: "Annotationskategorien"
Description: "Das CodeSystem 'AnnotationCategory' enthält die Codes für die verschiedenen Arten von Annotationen."
* ^version = "0.1.2"
* ^date = "2026-08-18"
* ^status = #active
* ^caseSensitive = true
* ^content = #complete
* ^count = 3
* ^url = "https://emiga.rki.de/fhir/CodeSystem/AnnotationCategory"
* ^valueSet = "https://emiga.rki.de/fhir/ValueSet/AnnotationCategoryVS"

* insert MetadataTerminology

* #comment "Kommentar" "Annotationen mit zusätzlichen Attributen und ohne Anhänge."
* #attachment "Anhang" "Annotationen mit Anhängen und ohne zusätzliche Attribute."
* #note "Notiz" "Annotationen mit zusätzlichen Eigenschaften und ohne Anhänge."