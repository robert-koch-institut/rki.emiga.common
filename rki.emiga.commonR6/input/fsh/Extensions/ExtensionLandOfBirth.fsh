Extension: LandOfBirth
Id: LandOfBirth
Title: "Geburtsland"
Description: "Geburtsland der betroffenen Person."
Context: Patient
* insert MetadataProfile

* ^url = "https://emiga.rki.de/fhir/common/Extension/LandOfBirth"
* ^version = "0.2.0"
* ^date = "2025-09-12"
* url = "https://emiga.rki.de/fhir/common/Extension/LandOfBirth" (exactly)
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

