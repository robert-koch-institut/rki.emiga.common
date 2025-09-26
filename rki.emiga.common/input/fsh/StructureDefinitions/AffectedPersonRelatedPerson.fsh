Profile: AffectedPersonRelatedPerson
Parent: RelatedPerson
Id: AffectedPersonRelatedPerson
Title: "Bezugsperson der betroffenen Person"
Description: "TODO"

* insert ProfileMetaProfileTags
* insert MetadataProfile
* ^url = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPersonRelatedPerson"
* ^version = "0.2.0"
* ^date = "2025-09-25"

* insert ProfileResourceCommon
//* insert ProfileDomainResourceCommon
* insert ProfileSecurityTags

* insert IdentifierCommon
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPersonRelatedPerson|1.2.0-alpha.9"

/* extension nicht gebraucht
* extension contains $RelatedPersonLinkExt named linkToRepresentedPerson 0..1 MS
* extension[linkToRepresentedPerson].url = "https://emiga.rki.de/fhir/common/Extension/RelatedPersonLink" (exactly)
//* extension[linkToRepresentedPerson].valueReference.reference MS
* extension[linkToRepresentedPerson].value[x] only Reference(Patient)
* extension[linkToRepresentedPerson].valueReference.reference ^short = "Verweis auf die Patient-Ressource"
* extension[linkToRepresentedPerson].valueReference.reference ^definition = "Verweis auf die Patient-Ressource, die dieselbe Person repräsentiert."
* extension[linkToRepresentedPerson].valueReference.type = "Patient" (exactly)
* extension[linkToRepresentedPerson].valueReference.type ^mustSupport = true
* extension[linkToRepresentedPerson].valueReference ^mustSupport = true
* extension[linkToRepresentedPerson].valueReference.identifier MS
* extension[linkToRepresentedPerson].valueReference.identifier ^short = "Identifier der Patient-Ressource"
* extension[linkToRepresentedPerson].valueReference.identifier ^definition = "Identifier der Patient-Ressource, die dieselbe Person repräsentiert."
* extension[linkToRepresentedPerson].valueReference.display MS
* extension[linkToRepresentedPerson].valueReference.display ^short = "Anzeigename der Patient-Ressource"
* extension[linkToRepresentedPerson].valueReference.display ^definition = "Anzeigename der Patient-Ressource, die dieselbe Person repräsentiert."
* extension[linkToRepresentedPerson] ^short = "Verweis auf die Bezugsperson"
* extension[linkToRepresentedPerson] ^definition = "Verweis auf die Patient-Ressource, die dieselbe Person repräsentiert."
*/
//* identifier 1..*

* patient MS
* patient ^short = "Die betroffene Person, zu der die Bezugsperson in Beziehung steht."
* patient ^definition = "Die betroffene Person, zu der die Bezugsperson in Beziehung steht."
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

