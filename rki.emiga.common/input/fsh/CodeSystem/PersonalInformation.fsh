CodeSystem: PersonalInformation
Id: PersonalInformation
Title: "Personenbezug"
Description: "Das CodeSystem 'PersonalInformation' definiert Konzepte, die den Personenbezug der Daten in relevanten Ressourcen kennzeichnen."
* ^version = "0.1.2"
* ^date = "2026-08-18"
* ^caseSensitive = true
* ^content = #complete
* ^count = 2
* ^url = "https://emiga.rki.de/fhir/common/CodeSystem/PersonalInformation"
* ^valueSet = "https://emiga.rki.de/fhir/common/ValueSet/PersonalInformation"

* insert MetadataTerminology

* #ContainsPersonalInformation "Enthält personenbezogene Daten" "Kennzeichnet, dass die Ressource personenbezogene Daten enthält."
* #ContainsNoPersonalInformation "Enthält keine personenbezogenen Daten" "Kennzeichnet, dass die Ressource keine personenbezogenen Daten enthält."