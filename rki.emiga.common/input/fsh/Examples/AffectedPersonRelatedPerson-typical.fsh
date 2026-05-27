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
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPersonRelatedPerson"
* meta.security[responsibility].system = "https://emiga.rki.de/fhir/common/CodeSystem/ResourceResponsibility"
* meta.security[responsibility].code = #1.01.0.01.
* meta.security[visibility].system = "https://emiga.rki.de/fhir/common/CodeSystem/ResourceVisibilityType"
* meta.security[visibility].code = #inAgency  
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
* patient.display = "Betroffene Person (Typisch - Anna Müller)"

// -----------------------------------------------------------------------------
//  Beziehungstyp (EMIGA CodeSystem)
// -----------------------------------------------------------------------------

* relationship[0].coding[0].system = "https://emiga.rki.de/fhir/common/CodeSystem/RelatedPersonRelationshipType"
* relationship[0].coding[0].code = #legalGuardian
* relationship[0].coding[0].display = "Sorgeberechtigte Person"
* relationship[0].text = "Sorgeberechtigte Person"
