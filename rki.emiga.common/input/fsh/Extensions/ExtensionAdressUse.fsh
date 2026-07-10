Extension: AddressUse
Id: AddressUse
Title: "Adressnutzung"
Description: "Über die Adressnutzung kann die Art des Aufenthaltsortes der Betroffenen Person angegeben werden."

* ^url = "https://emiga.rki.de/fhir/common/Extension/AddressUse"
* ^version = "1.0.0"
* ^status = #active
* ^date = "2026-07-10"
* ^context[0].type = #element
* ^context[0].expression = "Patient.address"

* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding from AddressUseVS (required)

* valueCoding.system 1..1 MS
* valueCoding.code 1..1 MS