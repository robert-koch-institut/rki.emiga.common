Extension: Salutation
Id: Salutation
Title: "Anrede"
Description: "Für die Betroffene Person kann eine Anrede angegeben werden. Diese wird bei Anschreiben verwendet."
Context: Patient.name
* insert MetadataProfile
* ^url = "https://emiga.rki.de/fhir/common/Extension/Salutation"
* ^version = "0.1.0"
* ^date = "2024-11-07"
* url = "https://emiga.rki.de/fhir/common/Extension/Salutation" (exactly)
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