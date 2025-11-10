CodeSystem: RelatedPersonRelationshipType
Id: RelatedPersonRelationshipType
Title: "Beziehungen zu anderen Personen"
Description: "Die Kodiersystematik 'RelatedPersonRelationship' definiert Konzepte, welche genutzt werden können, um verschiedene Arten von Beziehungen zwischen einer betroffenen Person und anderen Personen zu unterscheiden."
* insert MetadataTerminology

* ^url = "https://emiga.rki.de/fhir/common/CodeSystem/RelatedPersonRelationshipType"
* ^version = "1.3.1"
* ^date = "2025-11-10"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/common/ValueSet/RelatedPersonRelationshipTypeVS"

//* #legalGuardian "rechtlicher Betreuer" "Die betroffene Person hat einen rechtlichen Betreuer."
//* #parentalAuthority "Erziehungsberechtigter" "Die betroffene Person hat einen Erziehungsberechtigten."
* #legalGuardian "Sorgeberechtigte Person" "Person mit gesetzlichem Sorgerecht für eine andere Person"
* #linkedPerson "verknüpfte Person" "Die betroffene Person ist eine verknüpfte Person."


ValueSet: RelatedPersonRelationshipTypeVS
Id: RelatedPersonRelationshipTypeVS
Title: "Beziehungen zu anderen Personen - Werteliste"
Description: "Werteliste mit Konzepten, die die Art der Beziehungen bestimmen."
* ^url = "https://emiga.rki.de/fhir/common/ValueSet/RelatedPersonRelationshipTypeVS"
* insert MetadataTerminology
* ^version = "0.3.0"
* ^date = "2025-11-05"
* include codes from system RelatedPersonRelationshipType