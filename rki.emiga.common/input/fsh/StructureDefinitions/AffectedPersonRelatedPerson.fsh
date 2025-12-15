Profile: AffectedPersonRelatedPerson
Parent: RelatedPerson
Id: AffectedPersonRelatedPerson
Title: "Bezugsperson der betroffenen Person"
Description: "TODO"

* insert ProfileMetaProfileTags
* insert MetadataProfile
* ^url = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPersonRelatedPerson"
* ^version = "0.3.0"
* ^date = "2025-10-23"

* insert ProfileResourceCommon
//* insert ProfileDomainResourceCommon
* insert ProfileSecurityTagsPerson

* insert IdentifierCommon
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPersonRelatedPerson|1.2.0-alpha.15"

* patient MS
* patient ^short = "Die betroffene Person, zu der die Bezugsperson in Beziehung steht."
* patient ^definition = "Die betroffene Person, zu der die Bezugsperson in Beziehung steht."
* relationship 1..* MS
* relationship ^short = "Beziehung zur betroffenen Person"
* relationship ^definition = "Die Art der Beziehung zwischen der Bezugsperson und der betroffenen Person."
* relationship from RelatedPersonRelationshipTypeVS (required)
//* name 1..*
//* telecom 0..*
//* gender 0..1
//* birthDate 0..1
//* address 0..*
//* photo 0..*
//* period 0..1
//* communication 0..*

