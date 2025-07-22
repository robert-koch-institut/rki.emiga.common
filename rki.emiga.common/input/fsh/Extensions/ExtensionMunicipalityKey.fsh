Extension: MunicipalityKey
Id: MunicipalityKey
Title: "Extension Amtliche Gemeindeschlüssel (AGS)"
Description: "Erweiterung zur Darstellung des amtliches Gemeindeschlüssels"
Context: Element

* insert MetadataProfile
* ^url = "https://emiga.rki.de/fhir/common/Extension/MunicipalityKey"
* ^version = "0.1.0"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding.system 1..1 MS
* valueCoding.code 1..1 MS
* valueCoding.display 0..1 MS
* valueCoding ^short = "Amtlicher Gemeindeschlüssel (AGS)"
* valueCoding.system = "https://emiga.rki.de/fhir/common/CodeSystem/MunicipalityKey"

//* ^context.expression = "Patient.address" 
