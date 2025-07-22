CodeSystem: PersonalInformation
Id: PersonalInformation
Title: "Personenbezug"
Description: "Die Kodiersystematik PersonalInformation definiert Konzepte, die den Personenbezug der Daten in relevanten Ressourcen kennzeichnen."
* ^url = "https://emiga.rki.de/fhir/common/CodeSystem/PersonalInformation"
* insert MetadataTerminology
* ^version = "0.1.0"
* ^date = "2025-05-06"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/common/ValueSet/PersonalInformationVS"

* #HasPersonalInformation "Hat Personenbezug"
* #NoPersonalInformation "Hat keinen Personenbezug"

ValueSet: PersonalInformationVS
Id: PersonalInformationVS
Title: "Personenbezug (Werteliste)"
Description: "Werteliste mit Konzepten, die den Personenbezug der Daten in relevanten Ressourcen kennzeichnen."
* ^url = "https://emiga.rki.de/fhir/common/ValueSet/PersonalInformationVS"
* insert MetadataTerminology
* ^version = "0.1.0"
* ^date = "2025-05-06"
* include codes from system PersonalInformation