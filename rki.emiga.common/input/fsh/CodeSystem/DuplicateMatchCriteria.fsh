CodeSystem: DuplicateMatchCriteria
Id: DuplicateMatchCriteria
Title: "Dublettenprüfungs-Kriterien"
Description: "Das CodeSystem 'DuplicateMatchCriteria' definiert Konzepte, die genutzt werden können, um verschiedene Arten von Dublettenprüfungs-Kriterien zu unterscheiden."
* ^version = "0.1.1"
* ^date = "2026-08-18"
* ^caseSensitive = true
* ^content = #complete
* ^count = 9
* ^url = "https://emiga.rki.de/fhir/CodeSystem/DuplicateMatchCriteria"
* ^valueSet = "https://emiga.rki.de/fhir/ValueSet/DuplicateMatchCriteriaVS"

* insert MetadataTerminology

* #birthDateExact "Geburtsdatum exakt übereinstimmend"
* #firstNameFuzzy "Vorname ungefähr übereinstimmend (fuzzy)"
* #familyNameFuzzy "Familienname ungefähr übereinstimmend (fuzzy)"
* #streetPhonetic "Straße phonetisch übereinstimmend"
* #houseNumberExact "Hausnummer exakt übereinstimmend"
* #postalCodeExact "Postleitzahl exakt übereinstimmend"
* #cityPhonetic "Stadt phonetisch übereinstimmend"
* #birthNameFuzzy "Geburtsname ungefähr übereinstimmend (fuzzy)"
* #birthCountryExact "Geburtsland exakt übereinstimmend"