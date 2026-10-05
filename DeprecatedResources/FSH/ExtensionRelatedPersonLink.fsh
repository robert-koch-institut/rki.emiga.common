Extension: RelatedPersonLink
Id: RelatedPersonLink
Title: "Bezugsperson Link zum repräsentierten Patienten"
Description: "Verknüpft eine RelatedPerson-Ressource mit der Patient-Ressource, die dieselbe Person repräsentiert (z. B. wenn der gesetzliche Vormund ebenfalls ein Patient im System ist)."
* insert MetadataProfile

* ^url = "https://emiga.rki.de/fhir/common/Extension/RelatedPersonLink"
* ^version = "0.1.0"
* ^date = "2025-09-17"

* ^context.type = #element
* ^context.expression = "RelatedPerson"
* value[x] only Reference(Patient)
* valueReference 1..1 MS
* valueReference ^short = "Verweis auf die Patient-Ressource"
* valueReference ^definition = "Verweis auf die Patient-Ressource, die dieselbe Person repräsentiert."
