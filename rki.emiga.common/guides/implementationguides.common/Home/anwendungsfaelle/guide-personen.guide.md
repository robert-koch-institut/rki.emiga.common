# {{page-title}}

Dieser Abschnitt beschreibt die möglichen Anwendungsfälle zur Abbildung von **betroffenen Personen** und **Bezugspersonen** in EMIGA.

Eine betroffene Person wird als `Patient`-Ressourceninstanz gemäß dem Profil `AffectedPerson` abgebildet. Eine Bezugsperson wird als eigenständige `RelatedPerson`-Ressourceninstanz gemäß dem Profil `AffectedPersonRelatedPerson` geführt. 

{{render:guides/implementationguides.common/PlantUML/PNGs/Personen-und-bezugspersonen.png}}

## Anlegen einer betroffenen Person
Das Profil `AffectedPerson` enthält die für EMIGA relevanten personenbezogenen Angaben zu einer Fallperson (Patient). Dazu gehören insbesondere Identifikatoren, Name und Anrede, Kontakt- und Adressdaten, Geburtsdaten, Staatsangehörigkeit, Bearbeitungsstatus, Sprachkenntnisse sowie Angaben zu behandelnden Einrichtungsbezügen.
Mit Ausnahme der Identifikatoren sind in dieser Klasse keine weiteren Elemente als Must Support gekennzeichnet.

Beim Anlegen einer **betroffenen Person** wird eine neue Instance von `AffectedPerson`-Ressource erstellt. Die Erstellung erfolgt im Rahmen eines `TransactionBundle`, das alle für den Erstellungsvorgang benötigten Ressourcen gemeinsam an das System-Enpoint übermittelt.

{{render:guides/implementationguides.common/PlantUML/PNGs/AffectedPerson.png}}

## Abbildung einer Bezugsperson

Eine **Bezugsperson** wird als Instanz des Profils `AffectedPersonRelatedPerson` abgebildet. Über `patient` wird die betroffene Person referenziert, auf die sich die Bezugsperson bezieht.
Das Element `relationship` beschreibt die Art dieser Beziehung und ist an das ValueSet `RelatedPersonRelationshipTypeVS` gebunden.
Auf diese Weise werden Bezugsperson und betroffene Person jeweils als eigenständige Personeninstanzen geführt und ihre Beziehung zueinander explizit modelliert werden.

{{render:guides/implementationguides.common/PlantUML/PNGs/AffectedPersonRelatedPerson.png}}


## Unterschiedliche Repräsentationen derselben Person
Bei dem Fall, in denen dieselbe physische Person sowohl als betroffene Person als auch als Bezugsperson einer anderen betroffenen Person auftritt, wird sie in unterschiedlichen fachlichen Kontexten durch eine `AffectedPerson`- und eine `AffectedPersonRelatedPerson`-Instanz repräsentiert.
Die `AffectedPerson` kann über `link.relatedPersonLink` mit der entsprechenden `AffectedPersonRelatedPerson`-Instanz verknüpft werden. Der Link kennzeichnet, dass beide Ressourcen dieselbe physische Person repräsentieren.
Dabei sind insbesondere zwei Arten von Referenzen bzw. Verknüpfungen zu unterscheiden:
* `AffectedPersonRelatedPerson.patient` beschreibt die fachliche Beziehung einer Bezugsperson zu einer betroffenen Person. Über diese Referenz wird festgelegt, zu welcher betroffenen Person die jeweilige Bezugsperson gehört.
* `AffectedPerson.link[relatedPersonLink]` bzw. `AffectedPerson.link[patientLink]` dienen dagegen der Verknüpfung unterschiedlicher FHIR-Repräsentationen derselben physischen Person.

Diese Abbildung zeigt Person B in zwei unterschiedlichen fachlichen Rollen: als betroffene Person (AffectedPerson) und als Bezugsperson (AffectedPersonRelatedPerson) von Person A.
Dabei sind zwei Arten von Verknüpfungen zu unterscheiden:
- Identitätsverknüpfung (link[relatedPersonLink]): Verknüpft die AffectedPerson- und die AffectedPersonRelatedPerson-Instanz von Person B. Beide Instanzen repräsentieren dieselbe physische Person in unterschiedlichen Rollen.
- Beziehungsreferenz (patient): Verknüpft die Bezugsperson Person B mit der betroffenen Person Person A und beschreibt damit, zu welcher betroffenen Person die Bezugsperson gehört.

link[relatedPersonLink] verbindet somit dieselbe physische Person über unterschiedliche Repräsentationen hinweg, während patient eine fachliche Beziehung zwischen zwei unterschiedlichen physischen Personen abbildet.

{{render:guides/implementationguides.common/PlantUML/PNGs/SamePersonDifferentRoles.png}}

