Extension: LandOfBirth
Id: LandOfBirth
Title: "Geburtsland"
Description: "Extension für das Geburtsland der betroffenen Person."
Context: Patient

* ^url = "https://emiga.rki.de/fhir/common/Extension/LandOfBirth"
* url = "https://emiga.rki.de/fhir/common/Extension/LandOfBirth" (exactly)
* ^version = "0.2.1"
* ^date = "2026-08-18"

* insert MetadataProfile

* value[x] only Coding
* value[x] from CountryCodes (extensible)
* value[x] 1.. MS
//* value[x].valueCodeableConcept from DeuevAnlage8CountryCodes (extensible)
* url = "https://emiga.rki.de/fhir/common/Extension/LandOfBirth" (exactly)
* value[x] ^short = "Staatsangehörigkeit"
* value[x] ^definition = "Staatsangehörigkeit der betroffenen Person"
* value[x].system 1..1 MS
* value[x].system = "http://fhir.de/CodeSystem/deuev/anlage-8-laenderkennzeichen"
* value[x].code 1..1 MS
* value[x].display ^mustSupport = true
* value[x].version MS