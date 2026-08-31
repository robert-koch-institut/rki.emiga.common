# {{page-title}}

Dieser Abschnitt beschreibt die möglichen Anwendungsfälle zur Abbildung von **betroffenen Personen** und **Bezugspersonen** in EMIGA, beispielsweise eine Fallperson/Patient (Practitioner).

{{render:guides/implementationguides.common/PlantUML/PNGs/uml-personen-und-bezugspersonen.png}}

### Anlegen einer betroffenen Person
Das Profil `AffectedPerson` enthält die für EMIGA relevanten personenbezogenen Angaben zu einer Fallperson (Patient). Dazu gehören insbesondere Identifikatoren, Name und Anrede, Kontakt- und Adressdaten, Geburtsdaten, Staatsangehörigkeit, Bearbeitungsstatus, Sprachkenntnisse sowie Angaben zu behandelnden Personen und Einrichtungsbezügen. Das Element `relationship` beschreibt die Art dieser Beziehung und ist an das ValueSet `RelatedPersonRelationshipTypeVS` gebunden.
Mit Ausnahme der Identifikatoren sind in dieser Klasse keine weiteren Elemente als Must Support gekennzeichnet.

Beim Anlegen einer **betroffenen Person** wird eine neue Instance von `AffectedPerson`-Ressource erstellt. Die Erstellung erfolgt im Rahmen eines `TransactionBundle`, das alle für den Erstellungsvorgang benötigten Ressourcen gemeinsam an das System-Enpoint übermittelt.

Das `TransactionBundle` enthält de Ressourcen `AffectedPerson`, den erstellende `EmigaUserPractitioner` sowie optional die `AffectedPersonRelatedPerson`. Durch die gebündelte Übermittlung diese Information als FHIR-Transaktion können die Ressourcen und ihre gegenseitigen Referenzen in einem zusammenhängenden Vorgang verarbeitet werden.

### Abbildung einer Bezugsperson
Für eine **betroffene Person** können ihre Bezugspersonen über eine `AffectedPersonRelatedPerson`-Instanz abgebildet werden. Die betroffene Person (`AffectedPerson`) verweist hierzu über einen Link auf die entsprechende `AffectedPersonRelatedPerson`.

Die `AffectedPersonRelatedPerson` stellt die Beziehung zwischen der betroffenen Person und einer weiteren Person her. Sie referenziert die Bezugsperson als `Patient` und beschreibt über `Relationship` die **Art der Beziehung zur betroffenen Person**, beispielsweise eine familiäre oder betreuende Beziehung.

Auf diese Weise werden Bezugsperson und betroffene Person jeweils als eigenständige Personeninstanzen geführt und ihre Beziehung zueinander explizit modelliert werden.

## Unterschiedliche Repräsentationen derselben Person
Bei dem Fall, in denen dieselbe physische Person sowohl als betroffene Person als auch als Bezugsperson einer anderen betroffenen Person auftritt, wird sie in unterschiedlichen fachlichen Kontexten durch eine `AffectedPerson`- und eine `AffectedPersonRelatedPerson`-Instanz repräsentiert.
Die `AffectedPerson` kann über `link.relatedPersonLink` mit der entsprechenden `AffectedPersonRelatedPerson`-Instanz verknüpft werden. Der Link kennzeichnet, dass beide Ressourcen dieselbe physische Person repräsentieren.

Dabei sind insbesondere zwei Arten von Referenzen bzw. Verknüpfungen zu unterscheiden:
* `AffectedPersonRelatedPerson.patient` beschreibt die **fachliche Beziehung einer Bezugsperson zu einer betroffenen Person**. Über diese Referenz wird festgelegt, zu welcher betroffenen Person die jeweilige Bezugsperson gehört.
* `AffectedPerson.link[relatedPersonLink]` bzw. `AffectedPerson.link[patientLink]` dienen dagegen der **Verknüpfung unterschiedlicher FHIR-Repräsentationen <u>derselben</u> physischen Person**.

{{render:guides/implementationguides.common/PlantUML/PNGs/same-person-different-roles.png}}