Extension: Salutation
Id: Salutation
Title: "Anrede"
Description: "Extension für die Art der Anrede einer Person. Diese wird bei Anschreiben verwendet."
Context: Patient.name

* ^url = "https://emiga.rki.de/fhir/common/Extension/Salutation"
* url = "https://emiga.rki.de/fhir/common/Extension/Salutation" (exactly)
* ^version = "0.1.1"
* ^date = "2026-08-18"

* insert MetadataProfile

* value[x] 1.. MS
* value[x] only Coding
  * insert StrictCoding
* value[x] from $salutation (required)
* value[x] ^short = "Anrede der Betroffene Person"
* value[x] ^definition = "Anrede der Betroffene Person. Der Wert muss entsprechend des vom RKI definierten ValueSets (https://emiga.rki.de/fhir/ValueSet/Salutation) im coding Element dargestellt werden."
* value[x].system 1.. MS
* value[x].version MS
* value[x].code 1.. MS
* value[x].display MS