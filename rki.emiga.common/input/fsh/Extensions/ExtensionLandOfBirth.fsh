Extension: LandOfBirth
Id: LandOfBirth
Title: "Geburtsland"
Description: "Geburtsland der betroffenen Person."
Context: Patient
* insert MetadataProfile

* ^url = "https://emiga.rki.de/fhir/common/Extension/LandOfBirth"
* ^version = "0.1.0"
* ^date = "2025-09-11"
* extension.url = "https://emiga.rki.de/fhir/common/Extension/LandOfBirth"
* extension.extension 0..0
* value[x] only Coding
* value[x] from DeuevAnlage8CountryCodes (extensible)
* valueCoding 1..1 MS
* valueCoding.system 1..1 MS
* valueCoding.code 1..1 MS
* valueCoding.display 0..1 MS
* valueCoding.system = "http://fhir.de/CodeSystem/deuev/anlage-8-laenderkennzeichen"

