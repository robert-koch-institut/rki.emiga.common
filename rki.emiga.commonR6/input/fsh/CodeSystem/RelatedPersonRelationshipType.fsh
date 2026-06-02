CodeSystem: RelatedPersonRelationshipType
Id: RelatedPersonRelationshipType
Title: "Beziehungen zu anderen Personen"
Description: "Die Kodiersystematik 'RelatedPersonRelationship' definiert Konzepte, welche genutzt werden können, um verschiedene Arten von Beziehungen zwischen einer betroffenen Person und anderen Personen zu unterscheiden."
* insert MetadataTerminology
* ^url = "https://emiga.rki.de/fhir/common/CodeSystem/RelatedPersonRelationshipType"
* ^version = "1.4.1"
* ^date = "2026-03-24"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/common/ValueSet/RelatedPersonRelationshipTypeVS"
* ^count = 6

* #legalGuardian "Sorgeberechtigte Person" "Person mit elterlicher Sorge für ein Kind."
* #legalRepresentative "Gesetzliche Vertretung" "Person mit gesetzlicher oder gerichtlich bestellter Vertretungsbefugnis im festgelegten Aufgabenkreis."
* #authorizedPerson "Bevollmächtigte Person" "Person mit durch Vollmacht erteilter Vertretungsbefugnis."
* #representedPerson "Vertretene Person" "Person, deren Angelegenheiten durch eine gesetzliche Vertretung oder eine bevollmächtigte Person wahrgenommen werden."
* #grantingPerson "Vollmachtgebende Person" "Person, die einer anderen Person eine Vollmacht zur Vertretung erteilt hat."
* #linkedPerson "Kind" "Person in der Rolle eines Kindes in Bezug auf die bezugnehmende Person (Eltern-Kind-Beziehung)."
