CodeSystem: KeywordsLocal
Id: KeywordsLocal
Title: "Schlagworter Lokal"
Description: "Dieses CodeSystem definiert lokale Schlagwörter, die zur spezifischen Klassifikation und Kennzeichnung von Ressourcen und Inhalten in einem definierten organisatorischen oder projektspezifischen Kontext verwendet werden."
* ^url = "https://emiga.rki.de/fhir/common/CodeSystem/KeywordsLocal"
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2025-06-20"
* ^caseSensitive = true
* ^content = #not-present
* ^valueSet = "https://emiga.rki.de/fhir/common/ValueSet/KeywordsLocal"

ValueSet: KeywordsLocal
Id: KeywordsLocal
Title: "Schlagworter Lokal"
Description: "Werteliste mit Konzepten, die die Lokale Schlawörter beschreiben."

* ^url = "https://emiga.rki.de/fhir/common/ValueSet/KeywordsLocal"
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2025-06-20"
* include codes from system KeywordsLocal