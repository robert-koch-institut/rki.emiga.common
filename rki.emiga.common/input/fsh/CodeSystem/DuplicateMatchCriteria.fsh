CodeSystem: DuplicateMatchCriteria
Id: DuplicateMatchCriteria
Title: "Dublettenprüfungs-Kriterien"
Description: "Die Kodiersystematik 'DuplicateMatchCriteria' definiert Konzepte, welche genutzt werden können, um verschiedene Arten von Dublettenprüfungs-Kriterien zu unterscheiden."
* insert MetadataTerminology
* ^url = "https://emiga.rki.de/fhir/CodeSystem/DuplicateMatchCriteria"
* ^version = "0.1.0"
* ^date = "2026-05-13"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/ValueSet/DuplicateMatchCriteriaVS"
* ^count = 9

* #birthDateExact "Geburtsdatum exakt übereinstimmend"
* #firstNameFuzzy "Vorname ungefähr übereinstimmend (fuzzy)"
* #familyNameFuzzy "Familienname ungefähr übereinstimmend (fuzzy)"
* #streetPhonetic "Straße phonetisch übereinstimmend"
* #houseNumberExact "Hausnummer exakt übereinstimmend"
* #postalCodeExact "Postleitzahl exakt übereinstimmend"
* #cityPhonetic "Stadt phonetisch übereinstimmend"
* #birthNameFuzzy "Geburtsname ungefähr übereinstimmend (fuzzy)"
* #birthCountryExact "Geburtsland exakt übereinstimmend"