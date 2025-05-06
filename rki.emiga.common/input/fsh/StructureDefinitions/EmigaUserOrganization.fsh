Profile: EmigaUserOrganization
Parent: Organization
Id: EmigaUserOrganization
Title: "EmigaUserOrganization"
Description: "TODO"
* insert MetadataProfile
* ^version = "0.1.0"
* ^date = "2024-03-25"
* ^url = "https://emiga.rki.de/fhir/common/StructureDefinition/EmigaUserOrganization"

* insert ProfileResourceCommon
* insert ProfileDomainResourceCommon
* insert ProfileMetaProfileTags
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/EmigaUserOrganization"
//* insert ProfileSecurityTags
// 'Additional content defined by implementations' - 0..* - Extension
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt
// Update: extension benuzt um die Art derZuständigkeit abzubilden
/*
* extension 1..
* extension contains $ResponsibilityHealthdepartments named responsibilityHealthdepartments 0..*
* extension[responsibilityHealthdepartments] ^isModifier = false
* modifierExtension ..0
*/
// 'Identifies this organization across multiple systems' - 0..* - Identifier
// Logischer Identifier der Organisation
// Wir gestalten das Slicing bewusst offen, um später weitere Identifier-Typen abbilden zu können (z.B. DEMIS-ID, gematik-ID, usw.)
//Update 04.04.25: Slicing unnötig weil es nur einen Identifier gibt
/*
* identifier
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.description = "slicing organization identifier by system"
  * ^slicing.ordered = false
*/
//* identifier contains codeSiteId 1..1 MS
* identifier only IdentifierCodeSiteId
