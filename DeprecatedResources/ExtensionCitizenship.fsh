Extension: Citizenship
Id: Citizenship
Title: "Staatsangehörigkeit"
Description: "Staatsangehörigkeit der betroffenen Person."
Context: Patient
* insert MetadataProfile

* ^url = "https://emiga.rki.de/fhir/common/Extension/Citizenship"
* ^version = "0.5.0"
* ^date = "2025-09-12"
//* extension.url = "https://emiga.rki.de/fhir/common/Extension/Citizenship"
//* extension.extension 0..0
* value[x] only Coding
* value[x] from CountryCodes (extensible)
* value[x] 1.. MS
//* value[x].valueCodeableConcept from DeuevAnlage8CountryCodes (extensible)
* url = "https://emiga.rki.de/fhir/common/Extension/Citizenship" (exactly)
* value[x] ^short = "Staatsangehörigkeit"
* value[x] ^definition = "Staatsangehörigkeit der betroffenen Person"
* value[x].system 1..1 MS
* value[x].system = "http://fhir.de/CodeSystem/deuev/anlage-8-laenderkennzeichen"
* value[x].code 1..1 MS
* value[x].display ^mustSupport = true
* value[x].version MS
//* value[x].version ^comment = "Version ist verpflichtend, da sich die Codes ändern können."
//* valueCodeableConcept.coding.version = "8.00"

