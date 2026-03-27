CodeSystem: FacilityAssociationType
Id: FacilityAssociationType
Title: "Verbindungs-Qualifikation"
Description: "Das CodeSystem FacilityAssociationType enthält die Codes für die verschiedenen Arten von Verbindungen einer Betroffenen zu einer Einrichtung."
* insert MetadataTerminology
* ^version = "0.2.1"
* ^status = #active
* ^date = "2026-03-24"
* ^caseSensitive = true
* ^url = "https://emiga.rki.de/fhir/CodeSystem/FacilityAssociationType"
* ^count = 1
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/ValueSet/FacilityAssosciationType"

* #connectedTo "Verbunden mit"	"Allgemeine, unspezifische Beziehung zur Einrichtung, wenn keine der anderen Qualifizierungen zutrifft, z.B. gelegentlicher Kontakt."

ValueSet: FacilityAssociationType
Id: FacilityAssociationType
Title: "Verbindungs-Qualifikation"
Description: "Werteliste mit Konzepten, die die Art der Verbindungen bestimmen."
* ^url = "https://emiga.rki.de/fhir/ValueSet/FacilityAssociationType"
* insert MetadataTerminology
* ^version = "0.1.0"
* ^date = "2026-03-27"

* include codes from system FacilityAssociationType