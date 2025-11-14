// -----------------------------------------------------------------------------
//  AffectedPersonRelatedPerson-maximal.fsh
//  Maximal example for RelatedPerson linked to AffectedPerson
// -----------------------------------------------------------------------------

Instance: AffectedPersonRelatedPerson-maximal
InstanceOf: AffectedPersonRelatedPerson
Usage: #example
Title: "Bezugsperson der betroffenen Person (Maximal)"
Description: "Maximalbeispiel einer Bezugsperson, die mit einer betroffenen Person in Beziehung steht."

* id = "affectedpersonrelatedperson-maximal"
* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPersonRelatedPerson|0.2.0"

// -----------------------------------------------------------------------------
//  Identifieren (EmigaID + EmigaFileNumber + SurvNetFileNumber)
// -----------------------------------------------------------------------------

* identifier[EmigaID].system = "https://emiga.rki.de/fhir/sid/EmigaID"
* identifier[EmigaID].value = "RelatedPerson-PQRST-123456789"
* identifier[EmigaID].use = #official

* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
* identifier[EmigaFileNumber].value = "RelatedPerson-XYZ-987654321"
* identifier[EmigaFileNumber].use = #official

* identifier[SurvNetFileNumber].system = "https://emiga.rki.de/fhir/sid/SurvNetFileNumber"
* identifier[SurvNetFileNumber].value = "SURVNET-RelatedPerson-567890"
* identifier[SurvNetFileNumber].use = #temp

// -----------------------------------------------------------------------------
//  Bezug zur betroffenen Person
// -----------------------------------------------------------------------------

* patient = Reference(AffectedPerson-maximal)
* patient.reference = "Patient/AffectedPerson-maximal"
* patient.display = "Betroffene Person (Maximal - Anna Müller)"

// -----------------------------------------------------------------------------
//  Beziehungstyp (EMIGA CodeSystem / ValueSet)
// -----------------------------------------------------------------------------

* relationship[0].coding[0].system = "https://emiga.rki.de/fhir/common/CodeSystem/RelatedPersonRelationshipType"
* relationship[0].coding[0].code = #parentalAuthority
* relationship[0].coding[0].display = "Erziehungsberechtigter"
* relationship[0].text = "Erziehungsberechtigter"
