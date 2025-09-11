Profile: AffectedPersonRelatedPerson
Parent: RelatedPerson
Id: AffectedPersonRelatedPerson
Title: "Bezugsperson der betroffenen Person"
Description: "TODO"

* insert ProfileMetaProfileTags
* insert MetadataProfile
* ^url = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson"
* ^version = "0.1.0"
* ^date = "2025-04-09"

* insert ProfileResourceCommon
//* insert ProfileDomainResourceCommon
* insert ProfileSecurityTags



//* identifier 1..*
* patient MS
* relationship 1..* MS
* relationship ^short = "Beziehung zur betroffenen Person"
* relationship ^definition = "Die Art der Beziehung zwischen der Bezugsperson und der betroffenen Person."
* relationship from RelatedPersonRelationshipType (required)
//* name 1..*
//* telecom 0..*
//* gender 0..1
//* birthDate 0..1
//* address 0..*
//* photo 0..*
//* period 0..1
//* communication 0..*

