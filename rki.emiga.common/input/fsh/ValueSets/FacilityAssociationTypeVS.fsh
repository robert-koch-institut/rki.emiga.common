ValueSet: FacilityAssociationTypeVS
Id: FacilityAssociationTypeVS
Title: "Verbindungs-Qualifikation"
Description: "Werteliste mit Konzepten, die die Art der Verbindungen bestimmen."
* ^url = "https://emiga.rki.de/fhir/ValueSet/FacilityAssociationTypeVS"
* insert MetadataTerminology
* ^version = "0.2.0"
* ^date = "2025-12-12"

* include codes from system FacilityAssociationType
* include codes from system https://demis.rki.de/fhir/CodeSystem/organizationAssociation
* include codes from system $v3-NullFlavor