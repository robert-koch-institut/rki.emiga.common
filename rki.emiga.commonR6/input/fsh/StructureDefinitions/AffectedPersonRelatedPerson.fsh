Profile: AffectedPersonRelatedPersonR6
Parent: RelatedPerson
Id: AffectedPersonRelatedPersonR6
Title: "Bezugsperson der betroffenen Person"
Description: "Dieses Profil bildet eine Bezugsperson der betroffenen Person ab. Es dient der strukturierten Darstellung von Personen, die in einer persönlichen oder rechtlichen Beziehung zur betroffenen Person stehen und im Rahmen der fachlichen Prozesse berücksichtigt werden müssen."

* insert ProfileMetaProfileTags
* insert MetadataProfile
* ^url = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPersonRelatedPersonR6"
* ^version = "0.5.0"
* ^date = "2026-04-24"

* insert ProfileResourceCommon
//* insert ProfileDomainResourceCommon
* insert ProfileSecurityTagsPerson

* insert IdentifierCommon
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPersonRelatedPersonR6"

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

