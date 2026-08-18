CodeSystem: DuplicateMatchTriggerReasons
Id: DuplicateMatchTriggerReasons
Title: "Dublettenprüfungsgründe"
Description: "Das CodeSystem 'DuplicateMatchTriggerReasons' definiert Konzepte, die genutzt werden können, um verschiedene Arten von Auslösern für Dublettenprüfungen zu unterscheiden."
* ^version = "0.1.1"
* ^date = "2026-08-18"
* ^caseSensitive = true
* ^content = #complete
* ^count = 2
* ^url = "https://emiga.rki.de/fhir/CodeSystem/DuplicateMatchTriggerReasons"
* ^valueSet = "https://emiga.rki.de/fhir/ValueSet/DuplicateMatchTriggerReasonsVS"

* insert MetadataTerminology

* #main-criteria "Hauptkriterium" "Dublettenprüfung wurde aufgrund eines Hauptkriteriums ausgelöst, z.B. Übereinstimmung von Name und Geburtsdatum."
* #address-fallback "Adress-Fallback" "Dublettenprüfung wurde aufgrund eines Adress-Fallbacks ausgelöst, z.B. Übereinstimmung von Adresse und Geburtsdatum."