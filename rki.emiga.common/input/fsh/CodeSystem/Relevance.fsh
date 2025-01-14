CodeSystem: Relevance
Id: Relevance
Title: "Relevanz"
Description: "Die Kodiersystematik Relevance definiert Konzepte, die die für verschiedene Emiga Use Cases relevanten Ressourcen kennzeichnen."
* ^url = "https://emiga.rki.de/fhir/common/CodeSystem/Relevance"
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2024-12-18"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/common/ValueSet/Relevance"
* #IfsgKoordVwV "Paragraf 2 IfSG-Koordinierungs-VwV"

ValueSet: Relevance
Id: Relevance
Title: "Relevanz (Werteliste)"
Description: "Werteliste mit Konzepten, die die Relevanz der Ressourcen für verschiedene Use Cases kennzeichnen."
* ^url = "https://emiga.rki.de/fhir/common/ValueSet/Relevance"
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2024-12-18"
* include codes from system Relevance