// -----------------------------------------------------------------------------
//  AffectedPersonRelatedPerson-min.fsh
//  Minimal example for RelatedPerson linked to AffectedPerson
// -----------------------------------------------------------------------------

Instance: AffectedPersonRelatedPerson-minimal
InstanceOf: AffectedPersonRelatedPerson
Usage: #example
Title: "Bezugsperson der betroffenen Person (Minimal)"
Description: "Minimalbeispiel einer Bezugsperson, die mit einer betroffenen Person in Beziehung steht."

* id = "affectedpersonrelatedperson-min"
* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPersonRelatedPerson|0.2.0"

// Identifier
* identifier[EmigaID].system = "https://emiga.rki.de/fhir/sid/EmigaID"
* identifier[EmigaID].value = "RelatedPerson-PQRST-123456789"
* identifier[EmigaID].use = #official

* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
* identifier[EmigaFileNumber].value = "RelatedPerson-XYZ-987654321"
* identifier[EmigaFileNumber].use = #official

// Patient reference — link to minimal AffectedPerson instance
* patient = Reference(AffectedPerson-minimal)
* patient.reference = "Patient/AffectedPerson-minimal"
* patient.display = "Betroffene Person (Minimal)"

// Relationship type - using EMIGA CodeSystem
* relationship[0].coding[0].system = "https://emiga.rki.de/fhir/common/CodeSystem/RelatedPersonRelationshipType"
* relationship[0].coding[0].code = #legalGuardian
* relationship[0].coding[0].display = "rechtlicher Betreuer"
* relationship[0].text = "rechtlicher Betreuer"
