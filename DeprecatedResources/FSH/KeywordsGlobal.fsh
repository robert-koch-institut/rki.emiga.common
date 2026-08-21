CodeSystem: KeywordsGlobal
Id: KeywordsGlobal
Title: "Schlagworter Global"
Description: "Dieses CodeSystem definiert globale Schlagwörter, die zur einheitlichen Klassifikation und Kennzeichnung von Ressourcen und Inhalten im Rahmen der Spezifikation verwendet werden."
* ^url = "https://emiga.rki.de/fhir/common/CodeSystem/KeywordsGlobal"
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2025-06-20"
* ^caseSensitive = true
* ^content = #not-present
* ^valueSet = "https://emiga.rki.de/fhir/common/ValueSet/KeywordsGlobal"

ValueSet: KeywordsGlobal
Id: KeywordsGlobal
Title: "Schlagworter Global"
Description: "Werteliste mit Konzepten, die die Lokale Schlawörter beschreiben."
* ^url = "https://emiga.rki.de/fhir/common/ValueSet/KeywordsGlobal"
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2025-06-20"
* include codes from system KeywordsGlobal