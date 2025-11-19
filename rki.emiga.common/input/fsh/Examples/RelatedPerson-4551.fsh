Instance: 4551
InstanceOf: AffectedPersonRelatedPerson
Title: "Beispiel Bezugsperson der betroffenen Person"
Description: "Ein Beispielinstanz einer Bezugsperson-Ressource. "
Usage: #example
* id = "4551"
* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPersonRelatedPerson|1.2.0-alpha.12"

* meta.security[visibility] = $ResourceVisibilityType#inAgency "Eigene ÖGD-Stelle"
* meta.security[responsibility] = $ResourceResponsibility#1. "Robert Koch-Institut"

* identifier[EmigaID].system = "https://emiga.rki.de/fhir/sid/EmigaID"
* identifier[EmigaID].value = "Bezugsperson-PQRST-123456789"
* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
* identifier[EmigaFileNumber].value = "Bezugsperson-XYZ-987654321"

//* extension[linkToRepresentedPerson].url = "https://emiga.rki.de/fhir/common/Extension/RelatedPersonLink"
//* extension[linkToRepresentedPerson].valueReference.reference = "AffectedPerson-4551"
//* extension[linkToRepresentedPerson].valueReference.identifier.system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
//* extension[linkToRepresentedPerson].valueReference.identifier.value = "Person-XYZ-987654321"
//* extension[linkToRepresentedPerson].valueReference.display = "Jones Calamity"

* patient = Reference(AffectedPerson-4550)
* relationship[0].coding.system = "https://emiga.rki.de/fhir/common/CodeSystem/RelatedPersonRelationshipType"
* relationship[0].coding.code = #legalGuardian
* relationship[0].coding.display = "Sorgeberechtigte Person"

* relationship[1].coding.system = "https://emiga.rki.de/fhir/common/CodeSystem/RelatedPersonRelationshipType"
* relationship[1].coding.code = #linkedPerson
* relationship[1].coding.display = "verknüpfte Person"