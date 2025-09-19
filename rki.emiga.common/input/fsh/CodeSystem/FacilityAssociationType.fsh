CodeSystem: FacilityAssociationType
Id: FacilityAssociationType
Title: "Verbindungs-Qualifikation"
Description: "Das CodeSystem FacilityAssociationType enthält die Codes für die verschiedenen Arten von Verbindungen einer Betroffenen zu einer Einrichtung."

* insert MetadataTerminology
* ^version = "0.1.0"
* ^status = #active
* ^date = "2025-09-03"
* ^caseSensitive = true
* ^url = "https://emiga.rki.de/fhir/CodeSystem/FacilityAssociationType"
//* ^valueSet = "https://emiga.rki.de/fhir/ValueSet/FacilityAssociationType"

* ^content = #complete
//* ^count = 3

//* #housedIn "Untergebracht in"	"Die Person lebt dauerhaft oder langfristig in der Einrichtung, z.B. in einem Pflegeheim oder Wohnheim."
* #temporarilyHousedIn "Vorübergehende unterbringung in"	"Die Person hält sich zeitlich befristet in der Einrichtung auf, z.B. bei einem Krankenhaus- oder Gefängnisaufenthalts."
//* #workingIn "Tätig in"	"Die Person arbeitet in der Einrichtung, z.B. als Pflegekraft, Hausmeister oder Ehrenamtlicher."
//* #caredForIn "Betreut in"	"Die Person wird in einer Einrichtung betreut, z.B. in einer Kita oder Tagesgruppe."
* #memberOf "Mitglied in"	"Die Person ist Mitglied bei folgender Krankenkasse."
* #connectedTo "Verbunden mit"	"Allgemeine, unspezifische Beziehung zur Einrichtung, wenn keine der anderen Qualifizierungen zutrifft, z.B. gelegentlicher Kontakt."

ValueSet: FacilityAssociationTypeVS
Id: FacilityAssociationTypeVS
Title: "Verbindungs-Qualifikation - Werteliste"
Description: "Werteliste mit Konzepten, die die Art der Verbindungen bestimmen."
* ^url = "https://emiga.rki.de/fhir/ValueSet/FacilityAssociationTypeVS"
* insert MetadataTerminology
* ^version = "0.1.0"
* ^date = "2025-09-03"
* include codes from system FacilityAssociationType
* include codes from system https://demis.rki.de/fhir/CodeSystem/organizationAssociation

* $v3-NullFlavor#ASKU "asked but unknown" // nicht ermittelbar
* $v3-NullFlavor#ASKU ^designation[0].use = $HL7DesignationUse#display
* $v3-NullFlavor#ASKU ^designation[0].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $v3-NullFlavor#ASKU ^designation[0].value = "nicht ermittelbar"
* $v3-NullFlavor#ASKU ^designation[0].language = #de-DE
* $v3-NullFlavor#NASK "not asked" // nicht erhoben
* $v3-NullFlavor#NASK ^designation[0].use = $HL7DesignationUse#display
* $v3-NullFlavor#NASK ^designation[0].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $v3-NullFlavor#NASK ^designation[0].value = "nicht erhoben"
* $v3-NullFlavor#NASK ^designation[0].language = #de-DE