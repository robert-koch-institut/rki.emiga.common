CodeSystem: RelatedPersonRelationshipType
Id: RelatedPersonRelationshipType
Title: "Beziehungen zu anderen Personen"
Description: "Die Kodiersystematik 'RelatedPersonRelationship' definiert Konzepte, welche genutzt werden können, um verschiedene Arten von Beziehungen zwischen einer betroffenen Person und anderen Personen zu unterscheiden."
* insert MetadataTerminology

* ^url = "https://emiga.rki.de/fhir/common/CodeSystem/RelatedPersonRelationship"
* ^version = "1.0.0"
* ^date = "2025-09-11"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/common/ValueSet/RelatedPersonRelationship"

* #legalGuardian "rechtlicher Betreuer" "Die betroffene Person hat einen rechtlichen Betreuer."
* #parentalAuthority "Erziehungsberechtigter" "Die betroffene Person hat einen Erziehungsberechtigten."

ValueSet: RelatedPersonRelationshipType
Id: RelatedPersonRelationshipType
Title: "Beziehungen zu anderen Personen - Werteliste"
Description: "Werteliste mit Konzepten, die die Art der Beziehungen bestimmen."
* ^url = "https://emiga.rki.de/fhir/common/ValueSet/RelatedPersonRelationship"
* insert MetadataTerminology
* ^version = "0.1.0"
* ^date = "2025-09-03"
* include codes from system RelatedPersonRelationshipType