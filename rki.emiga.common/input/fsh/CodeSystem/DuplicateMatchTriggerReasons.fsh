CodeSystem: DuplicateMatchTriggerReasons
Id: DuplicateMatchTriggerReasons
Title: "Dublettenprüfungsgründe"
Description: "Die Kodiersystematik 'DuplicateMatchTriggerReasons' definiert Konzepte, welche genutzt werden können, um verschiedene Arten von Gründen für Dublettenprüfungen zu unterscheiden."
* insert MetadataTerminology
* ^url = "https://emiga.rki.de/fhir/CodeSystem/DuplicateMatchTriggerReasons"
* ^version = "0.1.0"
* ^date = "2026-05-13"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/ValueSet/DuplicateMatchTriggerReasonsVS"
* ^count = 2

* #main-criteria "Hauptkriterium" "Dublettenprüfung wurde aufgrund eines Hauptkriteriums ausgelöst, z.B. Übereinstimmung von Name und Geburtsdatum."
* #address-fallback "Adress-Fallback" "Dublettenprüfung wurde aufgrund eines Adress-Fallbacks ausgelöst, z.B. Übereinstimmung von Adresse und Geburtsdatum."