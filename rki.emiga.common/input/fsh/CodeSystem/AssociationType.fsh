CodeSystem: AssociationType
Id: AssociationType
Title: "Verbindungs-Qualifikation"
Description: "Das CodeSystem AssociationType enthält die Codes für die verschiedenen Arten von Verbindungen einer Betroffenen zu einer Einrichtung."
* ^version = "0.1.0"
* ^status = #active
* ^date = "2025-09-03"
* ^caseSensitive = true
* ^url = "https://emiga.rki.de/fhir/CodeSystem/AssociationType"
* ^valueSet = "https://emiga.rki.de/fhir/ValueSet/AssociationType"

* ^content = #complete
* ^count = 6

* #housedIn "Untergebracht in"	"Die Person lebt dauerhaft oder langfristig in der Einrichtung, z.B. in einem Pflegeheim oder Wohnheim."
* #temporarilyHousedIn "Vorübergehend untergebracht in"	"Die Person hält sich zeitlich befristet in der Einrichtung auf, z.B. bei einem Krankenhaus- oder Gefängnisaufenthalts."
* #workingIn "Tätig in"	"Die Person arbeitet in der Einrichtung, z.B. als Pflegekraft, Hausmeister oder Ehrenamtlicher."
* #caredForIn "Betreut in"	"Die Person wird in einer Einrichtung betreut, z.B. in einer Kita oder Tagesgruppe."
* #memberOf "Mitglied in"	"Die Person ist Mitglied bei folgender Krankenkasse."
* #connectedTo "Verbunden mit"	"Allgemeine, unspezifische Beziehung zur Einrichtung, wenn keine der anderen Qualifizierungen zutrifft, z.B. gelegentlicher Kontakt."

ValueSet: AssociationType
Id: AssociationType
Title: "Verbindungs-Qualifikation - Werteliste"
Description: "Werteliste mit Konzepten, die die Art der Verbindungen bestimmen."
* ^url = "https://emiga.rki.de/fhir/ValueSet/AssociationType"
* insert MetadataTerminology
* ^version = "0.1.0"
* ^date = "2025-09-03"
* include codes from system AssociationType
//* $v3-NullFlavor#NASK "not asked"