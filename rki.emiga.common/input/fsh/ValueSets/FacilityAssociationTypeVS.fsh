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
<<<<<<< HEAD

* $HL7NullflavorCS#ASKU "asked but unknown" // nicht ermittelbar
* $HL7NullflavorCS#ASKU ^designation[0].use = $HL7DesignationUse#display
* $HL7NullflavorCS#ASKU ^designation[0].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $HL7NullflavorCS#ASKU ^designation[0].value = "nicht ermittelbar"
* $HL7NullflavorCS#ASKU ^designation[0].language = #de-DE
* $HL7NullflavorCS#NASK "not asked" // nicht erhoben
* $HL7NullflavorCS#NASK ^designation[0].use = $HL7DesignationUse#display
* $HL7NullflavorCS#NASK ^designation[0].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $HL7NullflavorCS#NASK ^designation[0].value = "nicht erhoben"
* $HL7NullflavorCS#NASK ^designation[0].language = #de-DE
=======
* include codes from system $HL7NullflavorCS
>>>>>>> origin/development
