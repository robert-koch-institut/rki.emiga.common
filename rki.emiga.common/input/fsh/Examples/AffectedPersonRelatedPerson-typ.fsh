// -----------------------------------------------------------------------------
//  AffectedPersonRelatedPerson-typical.fsh
//  Typical example for RelatedPerson linked to AffectedPerson
// -----------------------------------------------------------------------------

Instance: AffectedPersonRelatedPerson-typical
InstanceOf: AffectedPersonRelatedPerson
Usage: #example
Title: "Bezugsperson der betroffenen Person (Typisch)"
Description: "Typisches Beispiel einer Bezugsperson, die mit einer betroffenen Person in Beziehung steht."

* id = "affectedpersonrelatedperson-typical"
* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPersonRelatedPerson|0.2.0"

// -----------------------------------------------------------------------------
//  Identifieren (EmigaID + EmigaFileNumber)
// -----------------------------------------------------------------------------

* identifier[EmigaID].system = "https://emiga.rki.de/fhir/sid/EmigaID"
* identifier[EmigaID].value = "RelatedPerson-PQRST-123456789"
* identifier[EmigaID].use = #official

* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
* identifier[EmigaFileNumber].value = "RelatedPerson-XYZ-987654321"
* identifier[EmigaFileNumber].use = #official

// -----------------------------------------------------------------------------
//  Bezug zur betroffenen Person
// -----------------------------------------------------------------------------

* patient = Reference(AffectedPerson-typical)
* patient.reference = "Patient/AffectedPerson-typical"
* patient.display = "Betroffene Person (Typisch - Anna Müller)"

// -----------------------------------------------------------------------------
//  Beziehungstyp (EMIGA CodeSystem)
// -----------------------------------------------------------------------------

* relationship[0].coding[0].system = "https://emiga.rki.de/fhir/common/CodeSystem/RelatedPersonRelationshipType"
* relationship[0].coding[0].code = #parentalAuthority
* relationship[0].coding[0].display = "Erziehungsberechtigter"
* relationship[0].text = "Erziehungsberechtigter"
